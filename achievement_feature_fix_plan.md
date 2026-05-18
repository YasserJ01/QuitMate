# Achievement Feature — Complete Fix & Enhancement Plan

## Executive Summary

The achievement system has **12 identified issues** ranging from a critical timing bug that prevents all achievements from unlocking, to missing push-notification delivery on unlock, a globally-non-unique Isar index, a stale-context bug in the overlay, and several gaps in UX and architecture. This document provides a precise, file-by-file remediation plan with code snippets, rationale, and an execution order.

---

## Table of Contents

1. [Bug Inventory](#1-bug-inventory)
2. [Root Cause Analysis](#2-root-cause-analysis)
3. [Fix Plan — Ordered by Priority](#3-fix-plan---ordered-by-priority)
   - [P0 — Critical: Statistics Timing Race Condition](#p0--critical-statistics-timing-race-condition)
   - [P0 — Critical: No Push Notification on Unlock](#p0--critical-no-push-notification-on-unlock)
   - [P1 — High: Isar Unique-Index Conflict](#p1--high-isar-unique-index-conflict)
   - [P1 — High: AchievementNotifier autoDispose Race](#p1--high-achievementnotifier-autodispose-race)
   - [P1 — High: evaluate() Not Awaited After Log Events](#p1--high-evaluate-not-awaited-after-log-events)
   - [P2 — Medium: Statistics Computed Inside evaluate()](#p2--medium-statistics-computed-inside-evaluate)
   - [P2 — Medium: AchievementUnlockOverlay Static State Leak](#p2--medium-achievementunlockoverlay-static-state-leak)
   - [P2 — Medium: Money Achievements Invisible Without Cost Data](#p2--medium-money-achievements-invisible-without-cost-data)
   - [P2 — Medium: Engine Missing Craving-Resistance Count from LogEntries](#p2--medium-engine-missing-craving-resistance-count-from-logentries)
   - [P3 — Low: Badge Gallery UX Polish](#p3--low-badge-gallery-ux-polish)
   - [P3 — Low: Achievement Progress not Shown on Dashboard](#p3--low-achievement-progress-not-shown-on-dashboard)
   - [P3 — Low: No Test Coverage for AchievementEngine](#p3--low-no-test-coverage-for-achievementengine)
4. [File-by-File Change Summary](#4-file-by-file-change-summary)
5. [Execution Order](#5-execution-order)
6. [Testing Checklist](#6-testing-checklist)

---

## 1. Bug Inventory

| ID | Severity | File | Description |
|----|----------|------|-------------|
| B-01 | **Critical** | `dashboard_screen.dart`, `achievement_provider.dart` | `evaluate()` reads statistics synchronously right after calling `refresh()` — stats are still empty (all zeros) when engine runs |
| B-02 | **Critical** | `achievement_provider.dart` | No push notification is dispatched when achievements are unlocked |
| B-03 | **High** | `achievement_model.dart` | `achievementId` has a globally-unique Isar index — a re-seed or a second user with same achievement IDs will silently overwrite rows |
| B-04 | **High** | `achievement_provider.dart` | `achievementNotifierProvider` is `autoDispose`; rapid navigation away + back can dispose the notifier mid-evaluation, dropping updates |
| B-05 | **High** | `dashboard_screen.dart` | `_evaluateAchievements()` is not called from `QuickLogSheet` path — only from FAB callbacks |
| B-06 | **Medium** | `achievement_provider.dart` | `evaluate()` fetches its own statistics from `statisticsProvider` state — if that provider was rebuilt in a different time range the values are wrong |
| B-07 | **Medium** | `achievement_unlock_overlay.dart` | `_queue` and `_isShowing` are static class variables; stale `BuildContext` references persist across hot-restarts and navigation |
| B-08 | **Medium** | `achievement_engine.dart` | Money achievements (`smoke-money-10/100`) require `profile.costPerPack` to be set; engine silently shows 0 progress without guidance |
| B-09 | **Medium** | `achievement_engine.dart` | `cravingDelayed` log type is the only source counted for craving-resistance achievements — `CravingEntry.wasSuccessfullyResisted` outcomes are ignored |
| B-10 | **Low** | `badge_gallery_screen.dart` | No real-time update: gallery does not refresh when a new achievement fires while screen is open |
| B-11 | **Low** | `dashboard_screen.dart` | No achievement-progress widget on dashboard — users have no ambient feedback until they navigate to gallery |
| B-12 | **Low** | — | `AchievementEngine` has zero unit tests; logic regressions go undetected |

---

## 2. Root Cause Analysis

### Why no achievements unlock on day 3 of quitting

The call chain is:

```
DashboardScreen.initState()
  └─ addPostFrameCallback
       ├─ statisticsProvider.notifier.refresh()   // starts async load — returns immediately
       └─ _evaluateAchievements()                 // fires BEFORE refresh() completes
            └─ achievementNotifier.evaluate()
                 └─ ref.read(statisticsProvider)  // reads Statistics.empty()  ← BUG B-01
                      └─ currentStreak = 0
                           └─ engine computes 0 progress for all streak achievements
                                └─ no updates generated → nothing persisted → nothing unlocked
```

The `statisticsProvider` is an `autoDispose StateNotifier`. Its `loadStatistics()` is async and involves Isar reads. When `evaluate()` reads `.statistics` on the same frame, it always gets the initial `Statistics.empty()` value. Every streak check returns 0.

### Why no notification on unlock

`evaluate()` enqueues achievements into `pendingUnlockAnimationsProvider` (in-app overlay only) but never calls `NotificationManager.sendImmediate()`. The overlay itself only shows when the user has the app open and is on the dashboard.

---

## 3. Fix Plan — Ordered by Priority

---

### P0 — Critical: Statistics Timing Race Condition

**Files:** `achievement_provider.dart`, `dashboard_screen.dart`

#### Problem

`evaluate()` calls `ref.read(statisticsProvider)` which returns stale state. The async load triggered by `refresh()` has not completed.

#### Fix A — Compute fresh statistics directly inside `evaluate()`

Instead of relying on the `statisticsProvider` state snapshot, `evaluate()` should fetch data from the repositories directly and call `StatisticsCalculator` itself. This makes evaluation self-contained and timing-independent.

**`lib/features/achievements/presentation/providers/achievement_provider.dart`**

```dart
// ADD import
import '../../../tracking/services/statistics_calculator.dart';
import '../../../tracking/data/models/statistics.dart' as raw_stats;

// REPLACE the statistics-reading block inside evaluate():

// ── OLD (reads potentially stale state) ──────────────────────────────────
// final statsState = ref.read(statisticsProvider);
// final stats = statsState.statistics;

// ── NEW (always fresh) ───────────────────────────────────────────────────
final profileRepo = ref.read(profileRepositoryProvider);
final profile = await profileRepo.getProfile(userId);
if (profile == null) return;
final mode = profile.goalType.name;

final trackingRepo = ref.read(trackingRepositoryProvider);
final allLogs = await trackingRepo.getLogEntries(userId);
final allCravings = await trackingRepo.getCravingEntries(userId);

final freshStats = StatisticsCalculator.calculateStatistics(
  logs: allLogs,
  cravings: allCravings,
  profile: profile,
);

final logSummaries = allLogs.map((l) => LogEntrySummary(
  typeName: l.type.name,
  timestamp: l.timestamp,
)).toList();

// Then use freshStats everywhere evaluate() previously used stats:
final updates = engine.evaluate(
  existing: current,
  stats: _mapStatistics(freshStats),   // ← freshStats, not statsState.statistics
  recentLogs: logSummaries,
  mode: mode,
);
```

#### Fix B — Remove redundant `_evaluateAchievements` post-frame call from dashboard

The dashboard should still trigger evaluation, but after statistics are loaded. Change `DashboardScreen` to listen to `statisticsProvider` changes and evaluate on each fresh load:

**`lib/features/tracking/presentation/screens/dashboard_screen.dart`**

```dart
// REMOVE from initState():
// ref.read(statisticsProvider.notifier).refresh();  // keep this
// _evaluateAchievements();                           // REMOVE — moved below

// ADD a listener in build() or use ref.listen:
@override
Widget build(BuildContext context) {
  // Listen to statistics state changes — evaluate achievements whenever
  // fresh stats arrive.
  ref.listen<StatisticsState>(statisticsProvider, (previous, next) {
    if (!next.isLoading && next.error == null) {
      _evaluateAchievements();
    }
  });
  // ... rest of build
}
```

This guarantees `evaluate()` runs **after** the statistics load completes, every time statistics change. Because Fix A makes `evaluate()` self-contained, the listener is now just a trigger — the actual data fetch happens inside `evaluate()`.

---

### P0 — Critical: No Push Notification on Unlock

**Files:** `achievement_provider.dart`

#### Problem

When `justUnlocked` achievements are found, only the in-app overlay queue is updated. No OS-level push notification is sent.

#### Fix

Add a call to `NotificationManager.sendImmediate()` for each newly unlocked achievement, using a dedicated `NotificationType.milestone` notification.

**`lib/features/achievements/presentation/providers/achievement_provider.dart`**

```dart
// ADD import
import '../../../interventions/presentation/providers/notification_provider.dart';

// INSIDE evaluate(), after persisting updates, replace the just-unlocked block:

if (justUnlocked.isNotEmpty) {
  // 1. In-app overlay (existing)
  ref.read(pendingUnlockAnimationsProvider.notifier).enqueue(justUnlocked);

  // 2. Push notification for each unlocked achievement (NEW)
  final managerAsync = ref.read(notificationManagerProvider);
  final manager = managerAsync.valueOrNull;
  if (manager != null) {
    for (final achievement in justUnlocked) {
      await manager.sendImmediate(
        userId: userId,
        title: '${achievement.iconEmoji} Achievement Unlocked!',
        body: '${achievement.name} — ${achievement.description}',
        type: NotificationType.milestone,
        payload: 'type=achievement&id=${achievement.id}',
      );
    }
  }
}
```

#### Notification tap routing

To handle taps on these notifications and open the Badge Gallery, extend `_handleNotificationTap` in `app.dart`:

**`lib/app.dart`**

```dart
void _handleNotificationTap(String? payload) {
  if (payload == null || !mounted) return;
  final params = Uri.splitQueryString(payload);
  final type = params['type'];
  final context = _navigatorKey.currentContext;
  if (context == null) return;

  if (type == 'achievement') {                     // ADD
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BadgeGalleryScreen()),
    );
  } else if (action == 'open_toolkit' || ...) {   // existing
    ...
  }
}
```

---

### P1 — High: Isar Unique-Index Conflict

**Files:** `achievement_model.dart`, `achievement_model.g.dart`

#### Problem

```dart
@Index(unique: true)
late String achievementId;
```

`achievementId` values like `'streak-day-7'` are identical across users. Isar's unique index is **global** — not scoped to `userId`. A second call to `putAll()` (re-seed) or a different user would silently overwrite the first user's row.

While the app is currently single-user, this is a latent data-corruption risk and is already fragile if the seed runs twice due to a bug.

#### Fix — Composite unique index on `(userId, achievementId)`

**`lib/features/achievements/data/models/achievement_model.dart`**

```dart
@collection
class AchievementModel {
  Id id = Isar.autoIncrement;

  // REMOVE the standalone unique index:
  // @Index(unique: true)
  // late String achievementId;

  // ADD a composite unique index:
  @Index(composite: [CompositeIndex('achievementId')], unique: true)
  late String userId;

  late String achievementId;

  // ... rest unchanged
}
```

After this change, regenerate Isar code:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Update `applyUpdates()` to use `putByIndex` with the composite key:

**`lib/features/achievements/data/repositories/achievement_repository_impl.dart`**

```dart
// In applyUpdates(), the query is already correct:
// .userIdEqualTo(userId).achievementIdEqualTo(update.achievementId).findFirst()
// No change needed in query logic.

// In seedAchievements(), putAll uses auto-increment so it's safe.
// No change needed there either.
```

---

### P1 — High: AchievementNotifier autoDispose Race

**Files:** `achievement_provider.dart`

#### Problem

`achievementNotifierProvider` is declared as `autoDispose`. If the user navigates away from the dashboard while `evaluate()` is running, the notifier is disposed mid-execution. Any `ref.read()` calls after disposal throw, and persisted updates may be dropped.

#### Fix — Remove autoDispose from achievementNotifierProvider

```dart
// BEFORE:
final achievementNotifierProvider = AsyncNotifierProvider.autoDispose<
    AchievementNotifier, List<Achievement>>(AchievementNotifier.new);

// AFTER:
final achievementNotifierProvider = AsyncNotifierProvider<
    AchievementNotifier, List<Achievement>>(AchievementNotifier.new);
```

Change `AutoDisposeAsyncNotifier` to `AsyncNotifier`:

```dart
// BEFORE:
class AchievementNotifier extends AutoDisposeAsyncNotifier<List<Achievement>> {

// AFTER:
class AchievementNotifier extends AsyncNotifier<List<Achievement>> {
```

The gallery screen already uses `achievementsProvider` (a separate `FutureProvider.autoDispose`) for display, so keeping the notifier alive is correct — it acts as a long-lived service.

---

### P1 — High: evaluate() Not Awaited After Log Events

**Files:** `dashboard_screen.dart`, `quick_log_sheet.dart`

#### Problem

`_onLogSuccess()` calls `_evaluateAchievements()` only when actions are taken through the `QuickLogButton` FAB. When a log is submitted through `QuickLogSheet`, the statistics are refreshed but `_evaluateAchievements()` is never called.

#### Fix A — Call evaluate via statistics listener (already handled by P0 Fix B)

The `ref.listen(statisticsProvider, ...)` approach from P0 Fix B covers all log paths automatically — whenever statistics refresh after any log event, evaluation fires.

#### Fix B — Also trigger from QuickLogSheet directly

**`lib/features/tracking/presentation/widgets/quick_log_sheet.dart`**

```dart
// In each _logXxx() method, after the SnackBar / navigation, add:
// (using a small helper)

Future<void> _triggerAchievementEvaluation() async {
  try {
    await ref.read(achievementNotifierProvider.notifier).evaluate();
  } catch (e) {
    debugPrint('Achievement evaluation error: $e');
  }
}

// At the end of _logCigarette(), _logEpisode(), _logCraving(), etc.:
// ref.read(statisticsProvider.notifier).refresh();
// await _triggerAchievementEvaluation();   ← ADD
```

---

### P2 — Medium: Statistics Computed Inside evaluate()

**Files:** `achievement_provider.dart`

This is already resolved by P0 Fix A — `evaluate()` now computes its own fresh statistics from repositories instead of reading `statisticsProvider` state. No additional changes needed beyond what P0 describes.

---

### P2 — Medium: AchievementUnlockOverlay Static State Leak

**Files:** `achievement_unlock_overlay.dart`

#### Problem

```dart
static final _queue = <Achievement>[];
static bool _isShowing = false;
```

Static state is never reset between sessions or hot-restarts. If `_showNext(context)` is called after the context is unmounted (e.g., app backgrounded), it will throw or silently do nothing.

#### Fix — Convert to a proper singleton with safe context handling

**`lib/features/achievements/presentation/widgets/achievement_unlock_overlay.dart`**

```dart
class AchievementUnlockOverlay {
  AchievementUnlockOverlay._();

  static final _queue = <Achievement>[];
  static bool _isShowing = false;

  /// Reset should be called when the app is brought back to foreground
  /// or when the root navigator context changes.
  static void reset() {
    _queue.clear();
    _isShowing = false;
  }

  static void enqueue(BuildContext context, Achievement achievement) {
    _queue.add(achievement);
    if (!_isShowing) _showNext(context);
  }

  static void _showNext(BuildContext context) {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    // Guard: context must still be valid
    if (!context.mounted) {                        // ADD mounted check
      _queue.clear();
      _isShowing = false;
      return;
    }

    _isShowing = true;
    final achievement = _queue.removeAt(0);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _AchievementOverlayWidget(
        achievement: achievement,
        onDismiss: () {
          entry.remove();
          Future.delayed(
            const Duration(milliseconds: 500),
            () => _showNext(context),              // context captured — safe if mounted checked
          );
        },
      ),
    );

    // Additional guard before inserting
    final overlayState = Overlay.maybeOf(context); // USE maybeOf
    if (overlayState == null) {
      _isShowing = false;
      return;
    }
    overlayState.insert(entry);
  }
}
```

In `_AchievementOverlayListener` (dashboard), change `enqueue` call to pass current context correctly and call `reset()` on dispose:

**`lib/features/tracking/presentation/screens/dashboard_screen.dart`**

```dart
class _AchievementOverlayListener extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pendingUnlockAnimationsProvider, (prev, next) {
      if (next.isNotEmpty) {
        final achievement = ref
            .read(pendingUnlockAnimationsProvider.notifier)
            .dequeue();
        if (achievement != null && context.mounted) {   // ADD mounted check
          AchievementUnlockOverlay.enqueue(context, achievement);
        }
      }
    });
    return const SizedBox.shrink();
  }
}
```

---

### P2 — Medium: Money Achievements Invisible Without Cost Data

**Files:** `achievement_engine.dart`, `badge_gallery_screen.dart`

#### Problem

`smoke-money-10` and `smoke-money-100` show 0% progress and are stuck forever if the user did not fill in `costPerPack` during onboarding. Users don't know why.

#### Fix A — Engine: return null-progress sentinel for data-gated achievements

**`lib/features/achievements/domain/services/achievement_engine.dart`**

Add a field to `Statistics` to signal whether money data is available:

```dart
// In the switch inside _computeProgress():
'smoke-money-10' when stats.moneySaved <= 0 && stats.moneySavedDataAvailable == false
    => achievement.progressValue,   // preserve current, don't force 0
'smoke-money-10' => (stats.moneySaved.toInt()).clamp(0, 10),
```

Or simpler: extend `EngineStatistics` with a flag:

```dart
class Statistics {
  final int currentStreak;
  final int recoveryCount;
  final double moneySaved;
  final bool hasMoneySavingsData;   // ADD

  const Statistics({
    this.currentStreak = 0,
    this.recoveryCount = 0,
    this.moneySaved = 0,
    this.hasMoneySavingsData = false,  // ADD
  });
}
```

In `achievement_provider.dart._mapStatistics()`:

```dart
static EngineStatistics _mapStatistics(raw_stats.Statistics s) {
  return EngineStatistics(
    currentStreak: s.currentStreak,
    recoveryCount: s.recoveryCount,
    moneySaved: s.moneySaved,
    hasMoneySavingsData: s.moneySaved > 0 || s.potentialMoneySaved > 0,  // ADD
  );
}
```

In `_computeProgress()`:

```dart
'smoke-money-10' => stats.hasMoneySavingsData
    ? (stats.moneySaved.toInt()).clamp(0, 10)
    : achievement.progressValue,   // leave as-is if no data
'smoke-money-100' => stats.hasMoneySavingsData
    ? (stats.moneySaved.toInt()).clamp(0, 100)
    : achievement.progressValue,
```

#### Fix B — Gallery: show a "needs profile data" label on locked money achievements

**`lib/features/achievements/presentation/widgets/achievement_badge_card.dart`**

```dart
// In _buildContent(), after the progress indicator for locked achievements,
// add a contextual hint if the achievement ID is money-related and progress is 0:

if (!achievement.isUnlocked && achievement.progressValue == 0 &&
    achievement.id.contains('money')) ...[
  const SizedBox(height: 4),
  Text(
    'Add cigarette cost in your profile to track this',
    style: theme.textTheme.bodySmall?.copyWith(
      color: Colors.orange.shade700,
      fontSize: 10,
    ),
    textAlign: TextAlign.center,
  ),
],
```

---

### P2 — Medium: Engine Missing Craving-Resistance Count from LogEntries

**Files:** `achievement_engine.dart`

#### Problem

The engine counts `cravingDelayed` log entries for craving-resistance achievements. However, `CravingEntry` objects with `wasSuccessfullyResisted == true` are tracked separately in the `cravingEntrys` collection and are not included in `logSummaries`. This means users who use the craving-tracking flow (start + end craving) don't get credit.

#### Fix — Include CravingEntry outcomes in log summaries

**`lib/features/achievements/presentation/providers/achievement_provider.dart`**

```dart
// In evaluate(), after building logSummaries, also pull craving entries:

final allCravings = await trackingRepo.getCravingEntries(userId);  // already fetched for stats

// Synthetic log summaries for successfully resisted cravings:
final resistedSummaries = allCravings
    .where((c) => c.wasSuccessfullyResisted)
    .map((c) => LogEntrySummary(
          typeName: 'cravingDelayed',   // reuse same type name the engine checks
          timestamp: c.startTime,
        ))
    .toList();

final combinedSummaries = [...logSummaries, ...resistedSummaries];

final updates = engine.evaluate(
  existing: current,
  stats: _mapStatistics(freshStats),
  recentLogs: combinedSummaries,        // ← use combined
  mode: mode,
);
```

---

### P3 — Low: Badge Gallery UX Polish

**Files:** `badge_gallery_screen.dart`

#### Problems
- Gallery does not live-update while open
- No category filter tabs
- Locked achievements have no description visible by default

#### Fix A — Live updates via `ref.listen`

```dart
// In BadgeGalleryScreen.build():
ref.listen(achievementNotifierProvider, (_, __) {
  ref.invalidate(achievementsProvider);
});
```

#### Fix B — Category tabs

```dart
// Add a DefaultTabController around the body:
DefaultTabController(
  length: AchievementCategory.values.length + 1, // +1 for "All"
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Achievements'),
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          const Tab(text: 'All'),
          ...AchievementCategory.values.map(
            (c) => Tab(text: c.displayName),
          ),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        _buildGallery(context, achievements),
        ...AchievementCategory.values.map(
          (c) => _buildGallery(
            context,
            achievements.where((a) => a.category == c).toList(),
          ),
        ),
      ],
    ),
  ),
)
```

#### Fix C — Expandable locked achievement cards

```dart
// In AchievementBadgeCard, make the card tappable to show description:
// Already supports onTap, just wire it in BadgeGalleryScreen:

AchievementBadgeCard(
  achievement: locked[i],
  onTap: () => _showAchievementDetail(context, locked[i]),
),

void _showAchievementDetail(BuildContext context, Achievement a) {
  showModalBottomSheet(
    context: context,
    builder: (_) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(a.iconEmoji, style: const TextStyle(fontSize: 64)),
        const SizedBox(height: 12),
        Text(a.name, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(a.description, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        LinearProgressIndicator(value: a.progressPercent),
        const SizedBox(height: 8),
        Text('${a.progressValue} / ${a.progressMax}'),
      ]),
    ),
  );
}
```

---

### P3 — Low: Achievement Progress not Shown on Dashboard

**Files:** `smoking_dashboard.dart`, `reduction_dashboard.dart`

#### Fix — Add `AchievementsPreviewCard` to both dashboards

The widget already exists (`lib/features/achievements/presentation/widgets/achievements_preview_card.dart`) but is not used in either dashboard.

**`lib/features/tracking/presentation/widgets/smoking_dashboard.dart`**

```dart
// ADD import:
import '../../../achievements/presentation/widgets/achievements_preview_card.dart';

// In _buildContent() ListView children, after HealthMetricsCard and before Quick Actions:
const AchievementsPreviewCard(),
const SizedBox(height: 16),
```

Apply the same change to `reduction_dashboard.dart`.

Also add a "Next Achievement" teaser card that shows the closest-to-unlock achievement:

**New widget: `lib/features/achievements/presentation/widgets/next_achievement_card.dart`**

```dart
class NextAchievementCard extends ConsumerWidget {
  const NextAchievementCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);
    return achievementsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (achievements) {
        // Find the locked achievement with highest progress percentage
        final candidates = achievements
            .where((a) => !a.isUnlocked && a.progressValue > 0)
            .toList()
          ..sort((a, b) => b.progressPercent.compareTo(a.progressPercent));

        if (candidates.isEmpty) return const SizedBox.shrink();
        final next = candidates.first;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Text(next.iconEmoji, style: const TextStyle(fontSize: 32)),
            title: Text('Almost there: ${next.name}'),
            subtitle: LinearProgressIndicator(value: next.progressPercent),
            trailing: Text('${(next.progressPercent * 100).toInt()}%'),
          ),
        );
      },
    );
  }
}
```

---

### P3 — Low: No Test Coverage for AchievementEngine

**File:** `test/features/achievements/domain/services/achievement_engine_test.dart`

The engine is pure Dart with no Flutter dependencies — it is ideal for unit testing.

```dart
void main() {
  group('AchievementEngine', () {
    late AchievementEngine engine;

    setUp(() => engine = AchievementEngine());

    test('unlocks streak-day-7 when currentStreak >= 7', () {
      final achievement = Achievement(
        id: 'streak-day-7',
        name: '1 Week', description: '', iconEmoji: '🌿',
        category: AchievementCategory.streak,
        modeFilter: GoalTypeFilter.quitSmoking,
        progressMax: 7,
      );
      final updates = engine.evaluate(
        existing: [achievement],
        stats: const Statistics(currentStreak: 7),
        recentLogs: [],
        mode: 'quitSmoking',
      );
      expect(updates.length, 1);
      expect(updates.first.isUnlocked, isTrue);
      expect(updates.first.justUnlocked, isTrue);
    });

    test('does not unlock streak-day-7 for wrong mode', () {
      final achievement = Achievement(
        id: 'streak-day-7', name: '', description: '', iconEmoji: '',
        category: AchievementCategory.streak,
        modeFilter: GoalTypeFilter.quitSmoking,  // smoking only
        progressMax: 7,
      );
      final updates = engine.evaluate(
        existing: [achievement],
        stats: const Statistics(currentStreak: 30),
        recentLogs: [],
        mode: 'reduceMasturbation',              // wrong mode
      );
      expect(updates, isEmpty);
    });

    test('counts cravingDelayed log entries for craving achievements', () {
      final achievement = Achievement(
        id: 'craving-resisted-1', name: '', description: '', iconEmoji: '',
        category: AchievementCategory.craving,
        progressMax: 1,
      );
      final logs = [
        LogEntrySummary(typeName: 'cravingDelayed', timestamp: DateTime.now()),
      ];
      final updates = engine.evaluate(
        existing: [achievement],
        stats: const Statistics(),
        recentLogs: logs,
        mode: 'quitSmoking',
      );
      expect(updates.first.isUnlocked, isTrue);
    });
  });
}
```

---

## 4. File-by-File Change Summary

| File | Changes |
|------|---------|
| `achievement_model.dart` | Replace `@Index(unique: true)` on `achievementId` with composite `@Index(composite: [...], unique: true)` on `(userId, achievementId)` |
| `achievement_model.g.dart` | Regenerate via `build_runner` |
| `achievement_engine.dart` | Add `hasMoneySavingsData` field to `Statistics`; guard money achievements; keep rest intact |
| `achievement_provider.dart` | (1) Remove `autoDispose` from notifier; (2) Compute fresh stats inside `evaluate()` via repos+calculator instead of reading `statisticsProvider`; (3) Add push notification dispatch on unlock; (4) Include `CravingEntry` outcomes in log summaries |
| `dashboard_screen.dart` | (1) Add `ref.listen(statisticsProvider, ...)` to trigger evaluation after stats load; (2) Remove direct `_evaluateAchievements()` call from `initState` post-frame; (3) Fix `_AchievementOverlayListener` with `context.mounted` guard |
| `achievement_unlock_overlay.dart` | Add `context.mounted` guard; use `Overlay.maybeOf()`; add `reset()` method |
| `app.dart` | Extend `_handleNotificationTap` to route `type=achievement` to `BadgeGalleryScreen` |
| `badge_gallery_screen.dart` | Add live-update listener; add category tabs; add expandable detail sheet for locked achievements |
| `smoking_dashboard.dart` | Add `AchievementsPreviewCard` and `NextAchievementCard` |
| `reduction_dashboard.dart` | Add `AchievementsPreviewCard` and `NextAchievementCard` |
| `quick_log_sheet.dart` | Call `achievementNotifierProvider.notifier.evaluate()` after each log action |
| `achievements_preview_card.dart` | No changes needed — already built correctly |
| `next_achievement_card.dart` | **New file** — "almost there" widget |
| `test/achievement_engine_test.dart` | **New file** — unit tests for engine |

---

## 5. Execution Order

Execute in this exact order to avoid breaking intermediate states:

```
Step 1 — Isar Schema Fix (B-03)
  • Edit achievement_model.dart (composite index)
  • Run: dart run build_runner build --delete-conflicting-outputs
  • Verify generated achievement_model.g.dart looks correct

Step 2 — Fix AchievementNotifier lifetime (B-04)
  • Remove autoDispose from achievementNotifierProvider
  • Change AutoDisposeAsyncNotifier → AsyncNotifier

Step 3 — Fix evaluate() to compute fresh statistics (B-01, B-06)
  • Rewrite the statistics-reading block in evaluate()
  • Import StatisticsCalculator into achievement_provider.dart

Step 4 — Fix dashboard trigger (B-01 completion, B-05)
  • Add ref.listen(statisticsProvider) in DashboardScreen
  • Add _triggerAchievementEvaluation() in QuickLogSheet

Step 5 — Add push notifications on unlock (B-02)
  • Add sendImmediate() calls in evaluate()
  • Extend _handleNotificationTap() in app.dart

Step 6 — Fix overlay static state (B-07)
  • Add mounted checks and maybeOf() in AchievementUnlockOverlay
  • Add mounted check in _AchievementOverlayListener

Step 7 — Fix money achievements & engine improvements (B-08, B-09)
  • Add hasMoneySavingsData to EngineStatistics
  • Update _computeProgress() guards
  • Add CravingEntry outcomes to log summaries

Step 8 — UX enhancements (B-10, B-11)
  • Add AchievementsPreviewCard + NextAchievementCard to dashboards
  • Gallery: live update, category tabs, detail sheet

Step 9 — Write unit tests (B-12)
  • Create test/features/achievements/domain/services/achievement_engine_test.dart

Step 10 — Manual QA (see checklist below)
```

---

## 6. Testing Checklist

### Functional (manual)

- [ ] **Day-3 streak**: Create a fresh user, set quit date 3 days ago, no lapse logs → open dashboard → `streak-day-3` achievement (reduction) or progress toward `streak-day-7` (smoking) shows non-zero progress
- [ ] **Day-7 unlock**: Streak reaches 7 → overlay appears with "Achievement Unlocked!" animation → OS notification fires on device
- [ ] **Notification tap**: Tap the OS notification → app navigates to Badge Gallery screen
- [ ] **Gallery live update**: Keep Badge Gallery open, trigger a log from another tab → gallery refreshes without manual pull-to-refresh
- [ ] **Craving resistance**: Log 1 `cravingDelayed` entry → `craving-resisted-1` unlocks
- [ ] **CravingEntry resistance**: Start + end a craving with outcome `resisted` → same achievement still unlocks
- [ ] **Money achievement**: Fill `costPerPack` in profile → `smoke-money-10` shows correct progress; without `costPerPack` → achievement shows "Add cigarette cost" hint and doesn't regress
- [ ] **No double unlock**: Run app twice in a row → same achievement does not fire twice (idempotency of `seedAchievements` and `justUnlocked` flag)
- [ ] **Overlay context safety**: Navigate away while overlay is pending → no crash, queue drains gracefully on next open
- [ ] **Re-seed safety**: Wipe and re-open app → achievements seeded exactly once, Isar composite index holds

### Automated (unit)

- [ ] `AchievementEngine` — streak at boundary (6 days: no unlock, 7 days: unlock)
- [ ] `AchievementEngine` — mode filter skips wrong-mode achievements
- [ ] `AchievementEngine` — `justUnlocked` is `true` only on first transition to unlocked
- [ ] `AchievementEngine` — already-unlocked achievements produce no update (idempotent)
- [ ] `AchievementEngine` — cravingDelayed log counted correctly
- [ ] `StatisticsCalculator._calculateStreakData` — 3 clean days → currentStreak = 3

---

*Plan version: 1.0 — Covers all 12 identified bugs, 4 UX enhancements, and full test coverage strategy.*

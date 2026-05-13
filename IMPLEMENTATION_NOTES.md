# QuitMate — Interventions & Relapse Prevention Implementation Notes

**Document Version:** 1.0  
**Date:** 2026-05-12  
**Stack:** Flutter · Isar · Riverpod · Clean Architecture  
**Scope:** Craving Toolkit (Interventions) · Relapse Prevention · Notification System  

---

## Table of Contents

1. [Architecture Overview](#1-architecture-overview)
2. [Feature: Craving Toolkit](#2-feature-craving-toolkit)
3. [Feature: Notification System](#3-feature-notification-system)
4. [Feature: Relapse Prevention](#4-feature-relapse-prevention)
5. [Data Models](#5-data-models)
6. [State Management Patterns](#6-state-management-patterns)
7. [Navigation & Routing](#7-navigation--routing)
8. [Known Issues & Future Work](#8-known-issues--future-work)
9. [Developer Quick Reference](#9-developer-quick-reference)

---

## 1. Architecture Overview

### 1.1 Clean Architecture Layers

```
lib/features/<feature>/
├── data/
│   ├── datasources/        ← Seed services, static data
│   ├── models/             ← Isar @collection classes
│   └── repositories/       ← Repository implementations
├── domain/
│   ├── entities/           ← Pure Dart classes (no Flutter deps)
│   ├── repositories/       ← Abstract interfaces (I-prefix)
│   ├── services/           ← Domain services (e.g., content audit)
│   └── usecases/           ← Single-purpose use case classes
└── presentation/
    ├── providers/          ← Riverpod providers & notifiers
    ├── screens/            ← Full-screen widgets
    └── widgets/            ← Reusable UI components
```

### 1.2 Key Design Decisions

| Decision | Rationale |
|----------|-----------|
| **Isar over Hive** | Type-safe, faster queries, better embedded object support |
| **Riverpod over BLoC** | Less boilerplate, better testability, auto-dispose |
| **AsyncNotifier for async state** | Properly handles loading/error states via AsyncValue |
| **Domain layer has zero Flutter deps** | Testable without widget tests, portable |
| **Exercise catalogue seeded from static const** | No migration complexity for schema additions |
| **isFavorite/lastUsedAt on exercise record** | Single `put()` toggle, no join table |
| **ToolkitSession append-only** | Immutable audit trail for weekly summary |
| **JournalEntry independent collection** | Not embedded in session — reusable across features |

### 1.3 File Naming Conventions

- Isar models: `snake_case_model.dart` (e.g., `toolkit_exercise_model.dart`)
- Domain entities: `snake_case.dart` (e.g., `toolkit_exercise.dart`)
- Repositories: `snake_case_repository.dart` / `i_snake_case_repository.dart`
- Providers: `snake_case_provider.dart`
- Screens: `snake_case_screen.dart`
- Widgets: `snake_case.dart` (e.g., `exercise_card.dart`)
- Use cases: `snake_case_usecase.dart`

---

## 2. Feature: Craving Toolkit

### 2.1 Current State (Pre-Enhancement)

The toolkit has 4 functional exercise types (breathing, grounding, CBT, distraction) but:
- No persistence for exercise catalogue (hardcoded lists in UI)
- No favorites/recents system
- No mode-specific content filtering
- No usage tracking (ToolkitSession)
- No journaling feature
- Breathing animation uses same timing for all patterns
- Distraction screen is a stub ("Coming soon!")

### 2.2 Enhancement Summary

| Enhancement | Status | Files Affected |
|-------------|--------|---------------|
| Exercise catalogue seeding | ✅ Implemented | `toolkit_seed_service.dart`, `toolkit_exercise_model.dart` |
| Favorites system | ✅ Implemented | `toolkit_exercise_model.dart`, `toolkit_provider.dart`, `craving_toolkit_screen.dart` |
| Recents system | ✅ Implemented | `toolkit_exercise_model.dart`, `toolkit_provider.dart` |
| Mode-specific filtering | ✅ Implemented | `get_exercises_for_mode_usecase.dart`, `craving_toolkit_screen.dart` |
| Breathing phase timing fix | ✅ Implemented | `breathing_exercise_screen.dart`, `breathing_animation.dart` |
| Grounding stepped flow | ✅ Implemented | `grounding_exercise_screen.dart` |
| CBT interactive prompts | ✅ Implemented | `cbt_technique_screen.dart` |
| Urge Surfing screen | ✅ Implemented | `urge_surfing_screen.dart` |
| Delay & Distract screen | ✅ Implemented | `delay_distract_screen.dart` |
| Cognitive Reframing screen | ✅ Implemented | `cognitive_reframing_screen.dart` |
| Relapse Recovery Plan exercise | ✅ Implemented | `relapse_recovery_plan_screen.dart` |
| Journaling (create/list/edit) | ✅ Implemented | `journal_entry_screen.dart`, `journal_list_screen.dart`, `journal_entry_model.dart` |
| Post-exercise feedback | ✅ Implemented | `post_exercise_feedback_sheet.dart` |
| ToolkitSession tracking | ✅ Implemented | `toolkit_session_model.dart`, `toolkit_provider.dart` |
| Duration estimates on cards | ✅ Implemented | `exercise_card.dart`, `duration_chip.dart` |

### 2.3 Exercise Catalogue (16 exercises)

| # | Exercise | Category | Mode | Duration |
|---|----------|----------|------|----------|
| 1 | Box Breathing | breathing | Shared | 2 min |
| 2 | 4-7-8 Relaxing Breath | breathing | Shared | 3 min |
| 3 | Energizing Breath | breathing | Shared | 2 min |
| 4 | Calming Breath | breathing | Shared | 2 min |
| 5 | 5-4-3-2-1 Grounding | grounding | Shared | 2 min |
| 6 | Body Scan | grounding | Shared | 3 min |
| 7 | Object Focus | grounding | Shared | 1 min |
| 8 | Urge Surfing | urgeSurfing | Shared* | 5 min |
| 9 | Delay & Distract | delayAndDistract | Shared* | 5 min |
| 10 | Cognitive Reframing | cognitiveReframing | Shared* | 3 min |
| 11 | Thought Challenge | cognitiveReframing | Shared | 2 min |
| 12 | Consequence Analysis | cognitiveReframing | Shared | 2 min |
| 13 | Alternative Behavior | cognitiveReframing | Shared | 1 min |
| 14 | Journaling | journaling | Shared | 5 min |
| 15 | Relapse Recovery Planning | relapseRecoveryPlanning | Shared | 10 min |
| 16 | Cold Water Reset | grounding | Shared | 1 min |

*Mode-specific wording applied at runtime.

### 2.4 Breathing Animation Architecture

The breathing animation uses a `BreathingAnimation` widget with `SingleTickerProviderStateMixin`. Each phase (inhale/hold/exhale/pause) drives:
- **Scale:** Circle grows on inhale (0.6→1.0), shrinks on exhale (1.0→0.6), static on hold/pause
- **Opacity:** Fades in on inhale, fades out on exhale
- **Particles:** 12 orbiting particles with sinusoidal size variation
- **Arcs:** 3 rotating arc segments

The `BreathingExerciseNotifier` (Riverpod StateNotifier) manages the phase state machine:
```
inhale → hold → exhale → pause → inhale (cycle++)
```

Each phase transition is driven by a 1-second `Future.delayed` loop that decrements `phaseSecondsRemaining`. When it reaches 0, the next phase is calculated via `_getNextPhase()`.

**Important:** The notifier checks `mounted` before each state update to prevent post-disposal errors.

---

## 3. Feature: Notification System

### 3.1 Current State (Pre-Enhancement)

The notification system has a working scheduler, platform service, and settings UI but:
- `hasPermission()` returns `true` unconditionally on iOS
- `cancelAll()` cancels today's already-delivered notifications
- `isInQuietHours()` has inverted logic for same-day ranges
- `_selectTypes()` casts stats as `dynamic`
- Permission requested at wrong lifecycle moment (cold start)
- No debounce on preference saves
- Missing mode-specific templates
- No content audit mechanism

### 3.2 Enhancement Summary

| Enhancement | Status | Files Affected |
|-------------|--------|---------------|
| iOS permission check fix | ✅ Implemented | `push_notification_service.dart` |
| Cancel only future notifications | ✅ Implemented | `notification_scheduler_service.dart` |
| Quiet hours logic fix | ✅ Implemented | `notification_models.dart` |
| Typed Statistics parameter | ✅ Implemented | `notification_scheduler_service.dart` |
| Permission timing fix | ✅ Implemented | `notification_manager.dart`, `app.dart` |
| Preference save debounce | ✅ Implemented | `notification_provider.dart` |
| Default frequency → medium | ✅ Implemented | `notification_models.dart` |
| Mode-specific templates | ✅ Implemented | `notification_content.dart` |
| Content audit service | ✅ Implemented | `content_audit_service.dart` |
| Quit-date prep notifications | ✅ Implemented | `notification_scheduler_service.dart` |
| Bedtime reminder (reduction) | ✅ Implemented | `notification_scheduler_service.dart` |
| Settings UI overflow fix | ✅ Implemented | `notifications_settings_screen.dart` |
| permissionDeniedAt tracking | ✅ Implemented | `notification_models.dart` |

### 3.3 Notification Scheduling Flow

```
App cold start
  └── _bootstrap()
      └── _initNotifications()
          ├── manager.requestPermissionsIfAppropriate()  ← NEW: only after first log
          ├── manager.scheduleAll(userId)                 ← 7-day rolling window
          └── manager.schedulePreventive(userId)          ← high-risk hour prevention

scheduleForNextDays(userId, days=7)
  ├── Check notificationsEnabled
  ├── Prune old (>7 days) sent notifications
  ├── Cancel only FUTURE pending notifications (not today's)
  ├── Gather adaptive context (stats, profile, logs)
  └── For each day:
      ├── _selectTypes(prefs, stats, count, mode)  ← mode-aware
      ├── _generateTimes(date, prefs, count)
      └── For each slot:
          ├── Skip if quiet hours
          ├── _buildNotification() → random template from pool
          └── _push.scheduleNotification()
```

### 3.4 Content Audit Service

Located at `lib/features/interventions/domain/services/content_audit_service.dart`.

**Banned phrases** (case-insensitive check):
`failed`, `failure`, `weak`, `pathetic`, `addict`, `disgusting`, `shameful`, `give up`, `loser`, `worthless`, `you should be`, `you must`, `sin`, `immoral`, `dirty`, `filthy`, `wrong`, `bad person`, `broken`, `relapsed again`

**Usage:** Run `ContentAuditService.audit(allTemplates)` in a unit test. CI must fail if violations exist. This is a release gate.

---

## 4. Feature: Relapse Prevention

### 4.1 Current State (Pre-Enhancement)

The relapse prevention feature has working models, repository, and screens but:
- No LapseRecoveryScreen (SRS §8.4)
- No HelpSafetyScreen (SRS §15)
- PanicButton animation wastes battery (no WidgetsBindingObserver)
- EditPanicStepsScreen has race condition in _loadSteps()
- RelapsePlanScreen custom steps dialog flickers
- relapseNotifierProvider uses dead StateNotifier during loading
- No recovery statistics

### 4.2 Enhancement Summary

| Enhancement | Status | Files Affected |
|-------------|--------|---------------|
| LapseRecoveryScreen (3-step) | ✅ Implemented | `lapse_recovery_screen.dart`, `lapse_recovery_provider.dart` |
| HelpSafetyScreen | ✅ Implemented | `help_safety_screen.dart`, `crisis_helplines.dart` |
| PanicButton battery fix | ✅ Implemented | `panic_button.dart` |
| EditPanicStepsScreen race fix | ✅ Implemented | `edit_panic_steps_screen.dart` |
| EditCustomStepsScreen (dedicated) | ✅ Implemented | `edit_custom_steps_screen.dart` |
| RelapseNotifier → AsyncNotifier | ✅ Implemented | `relapse_provider.dart` |
| RecoveryGuideScreen | ✅ Implemented | `recovery_guide_screen.dart` |
| Recovery statistics | ✅ Implemented | `relapse_provider.dart`, `recovery_stats_card.dart` |
| Contact count validation | ✅ Implemented | `relapse_repository.dart` |
| Phone number validation | ✅ Implemented | `relapse_plan_screen.dart` |
| Personal recovery note | ✅ Implemented | `relapse_models.dart` |
| PanicModeScreen fade-in | ✅ Implemented | `panic_mode_screen.dart` |

### 4.3 Lapse Recovery Flow

```
Trigger: User logs a lapse event (LogType.cigaretteSmoked / urgeEpisode)
  └── QuickLogSheet pushes LapseRecoveryScreen (full-screen route)

Step 0 — Acknowledgment
  "This is a data point, not a failure."
  Mode-specific subtext (smoking vs. reduction)
  → "I'm ready" → Step 1
  → "I need a moment" → closes (session logged as skipped)

Step 1 — Trigger Identification (optional)
  MultiSelectChipGroup of mode-specific triggers
  → "Save & Continue" → Step 2
  → "Skip" → Step 2

Step 2 — Choose Next Action
  Three option cards:
  1. 🧰 Open Craving Toolkit → CravingToolkitScreen
  2. 📖 Read Recovery Guide → RecoveryGuideScreen
  3. ✓ I'm okay — close → saves session, pops

Post-flow: Schedules 3h supportive follow-up notification
```

### 4.4 Help & Safety Screen

Accessible without authentication. Contains:
1. **User's emergency contacts** (from RelapsePlan, with tel: links)
2. **Static crisis helplines** (8+ international, hardcoded, no network)
3. **App disclaimer** (not medical advice, call emergency services)

Navigation entry points:
- Settings → Help / Safety
- Privacy lock screen → "Get Help" button (bypasses auth)
- Bottom nav "Help Now" button

---

## 5. Data Models

### 5.1 Isar Collections

| Collection | Feature | Purpose |
|------------|---------|---------|
| `ToolkitExerciseModel` | Toolkit | Seeded exercise catalogue with favorites/recents |
| `ToolkitSessionModel` | Toolkit | Append-only usage records for weekly summary |
| `JournalEntryModel` | Journal | Freeform entries with mood tags, encrypted at box level |
| `LapseRecoverySessionModel` | Relapse | Tracks each lapse recovery flow completion |
| `BreathingSession` | Toolkit | Existing — per-session breathing data |
| `CbtSession` | Toolkit | Existing — per-session CBT data |
| `GroundingSession` | Toolkit | Existing — per-session grounding data |
| `DistractionSession` | Toolkit | Existing — per-session distraction data |
| `ScheduledNotification` | Notifications | Pending notification queue |
| `NotificationPreferences` | Notifications | User preferences (frequency, quiet hours, toggles) |
| `NotificationHistory` | Notifications | Archive of sent notifications |
| `RelapsePlan` | Relapse | User's relapse prevention plan + panic steps |
| `RelapseContact` | Relapse | Emergency contacts |
| `UserProfile` | Onboarding | User profile and goal settings |
| `LogEntry` | Tracking | Daily log entries |
| `CravingEntry` | Tracking | Craving episode records |

### 5.2 Schema Registration

All schemas are registered in `IsarService.instance` (`lib/core/services/database/isar_service.dart`). When adding a new Isar collection:

1. Create the model file in `data/models/`
2. Run `dart run build_runner build` to generate `.g.dart`
3. Add the schema to the `Isar.open()` schemas list in `isar_service.dart`
4. **Never edit `.g.dart` files manually**

### 5.3 Isar Embedded Object Mutation

**Critical:** Isar does not detect changes to embedded objects when mutated in-place. Always create **brand-new instances** when updating embedded objects:

```dart
// WRONG — Isar won't detect the change:
plan.panicSteps[0].title = 'New Title';
await isar.relapsePlans.put(plan); // No-op!

// CORRECT — create fresh instances:
final newSteps = plan.panicSteps.map((s) => PanicStep()
  ..title = s.title  // copy all fields
  ..description = s.description
  // ... etc
).toList();
plan.panicSteps = newSteps;
await isar.relapsePlans.put(plan); // Works!
```

---

## 6. State Management Patterns

### 6.1 Provider Types Used

| Provider Type | When to Use | Example |
|---------------|-------------|---------|
| `Provider` | Synchronous singleton (repositories) | `toolkitRepositoryProvider` |
| `FutureProvider.autoDispose` | Async read-only data | `toolkitExercisesProvider` |
| `StreamProvider.autoDispose` | Reactive Isar watch queries | `favoriteExercisesProvider` |
| `StateNotifierProvider.autoDispose` | Mutable state with methods | `BreathingExerciseNotifier` |
| `AsyncNotifierProvider.autoDispose` | Async initialization + mutations | `RelapseNotifier`, `NotificationPreferencesNotifier` |
| `NotifierProvider.autoDispose` | Sync initialization + mutations | `ToolkitSessionNotifier` |

### 6.2 AsyncNotifier Pattern

Used when the notifier needs async `build()`. The `AsyncValue` wrapper automatically provides loading/error states:

```dart
class RelapseNotifier extends AutoDisposeAsyncNotifier<RelapseState> {
  @override
  Future<RelapseState> build() async {
    final userId = await ref.watch(relapseUserIdProvider.future);
    final repo = ref.watch(relapseRepositoryProvider);
    final plan = await repo.getOrCreatePlan(userId);
    final contacts = await repo.getContacts(userId);
    return RelapseState(plan: plan, contacts: contacts);
  }

  Future<void> addContact(RelapseContact contact) async {
    // ... mutation logic ...
    ref.invalidateSelf(); // triggers rebuild
  }
}
```

### 6.3 Debounced Saves

For settings that trigger expensive operations (notification rescheduling), use a debounce pattern:

```dart
Timer? _saveDebounce;

Future<void> _update(void Function(Preferences) mutate) async {
  mutate(current);
  state = AsyncData(current); // optimistic UI update

  _saveDebounce?.cancel();
  _saveDebounce = Timer(const Duration(seconds: 2), () async {
    await manager.savePreferences(current);
  });
}
```

### 6.4 Provider Invalidation Rules

- `ref.invalidateSelf()` — re-runs the notifier's `build()` method
- `ref.invalidate(provider)` — re-runs a different provider
- **Never** call `ref.invalidate()` then immediately `ref.read().future` — this is a race condition. Use direct repository reads instead.

---

## 7. Navigation & Routing

### 7.1 Current Approach

The app uses imperative navigation with `Navigator.push()` and `MaterialPageRoute`. There is no `go_router` or named route table.

### 7.2 Key Navigation Paths

```
Dashboard FAB → CravingToolkitScreen
  └── ExerciseCard tap → ExerciseDetailScreen → ExerciseScreen
  └── Recent "Repeat" → ExerciseScreen (skips detail)

PanicButton → PanicModeScreen
  └── PanicStepCard → BreathingExerciseScreen / GroundingExerciseScreen / CbtTechniqueScreen

LapseRecoveryScreen Step 2 → CravingToolkitScreen / RecoveryGuideScreen

Settings → NotificationSettingsScreen
Settings → HelpSafetyScreen (un-guarded route)

Privacy Lock → "Get Help" → HelpSafetyScreen (bypasses auth)
```

### 7.3 Notification Deep Links

Notification tap payloads are parsed in `app.dart` `_handleNotificationTap()`:

```
Payload format: "type=craving_support&action=open_toolkit"
Supported actions:
  - open_toolkit → CravingToolkitScreen
  - type=craving_support → CravingToolkitScreen
  - type=preventive → CravingToolkitScreen
```

### 7.4 Help Screen Auth Bypass

The `HelpSafetyScreen` is pushed via `Navigator.of(context, rootNavigator: true)` to bypass the authenticated widget tree. The privacy lock screen includes a "Get Help" button that uses this mechanism.

---

## 8. Known Issues & Future Work

### 8.1 Known Issues

| Issue | Severity | Notes |
|-------|----------|-------|
| `DropdownButtonFormField.initialValue` in edit_panic_steps | Medium | Flutter uses `value`, not `initialValue`. May cause runtime issues. |
| Dark theme is a stub | Low | `AppTheme.darkTheme` has no custom styling |
| Mode lock stored but not enforced | Medium | `SecureStorageService.isModeLocked()` exists but no gate in app.dart |
| Phone formatting US-centric | Low | `RelapseContact.formattedPhone` assumes 10-digit US numbers |
| Background notification taps silently dropped | Medium | `_onBackgroundTap` only prints to debug console |

### 8.2 Future Enhancements

- [ ] **Dark mode** — Complete `AppTheme.darkTheme` with proper color tokens
- [ ] **Mode lock enforcement** — Gate app access when mode is locked
- [ ] **International phone formatting** — Use `intl` phone formatting
- [ ] **Background notification handling** — Store tap payload in shared_preferences for next-launch routing
- [ ] **Toolkit search** — Search/filter exercises by name or category
- [ ] **Exercise customization** — Allow users to create custom breathing patterns
- [ ] **Journal export** — Export journal entries as PDF/CSV
- [ ] **Cloud sync** — Optional encrypted cloud backup (currently offline-only per NFR-01)
- [ ] **Widget tests** — Comprehensive widget tests for all new screens
- [ ] **Integration tests** — End-to-end flow tests for lapse recovery and toolkit

---

## 9. Developer Quick Reference

### 9.1 Commands

```bash
# Generate Isar .g.dart files
dart run build_runner build --delete-conflicting-outputs

# Run analyzer
flutter analyze

# Run tests
flutter test

# Run specific test file
flutter test test/features/interventions/content_audit_test.dart

# Build APK (debug)
flutter build apk --debug

# Build APK (release)
flutter build apk --release
```

### 9.2 Key Files Map

```
lib/
├── main.dart                                    ← Entry point, Isar init, timezone
├── app.dart                                     ← Root widget, notification bootstrap, deep links
├── core/
│   ├── constants/app_constants.dart             ← App-wide constants & strings
│   ├── theme/app_theme.dart                     ← Light/dark theme definitions
│   ├── services/database/isar_service.dart      ← Isar singleton, schema registration
│   ├── services/storage/secure_storage_service.dart ← Encrypted key-value storage
│   └── widgets/common_widgets.dart              ← GradientButton, LoadingOverlay, EmptyState
├── features/
│   ├── craving_toolkit/
│   │   ├── data/models/toolkit_models.dart      ← Enums + BreathingSession, CbtSession, etc.
│   │   ├── data/models/toolkit_exercise_model.dart  ← NEW: Exercise catalogue Isar model
│   │   ├── data/models/toolkit_session_model.dart   ← NEW: Usage tracking Isar model
│   │   ├── data/models/journal_entry_model.dart     ← NEW: Journal Isar model
│   │   ├── data/datasources/toolkit_seed_service.dart ← NEW: First-run catalogue seeding
│   │   ├── data/repositories/toolkit_repository.dart  ← Existing session CRUD
│   │   ├── data/repositories/toolkit_repository_impl.dart ← NEW: Exercise/session repo
│   │   ├── data/repositories/journal_repository_impl.dart ← NEW: Journal repo
│   │   ├── domain/entities/                     ← NEW: Pure Dart entities
│   │   ├── domain/repositories/                 ← NEW: Abstract interfaces
│   │   ├── domain/usecases/                     ← NEW: Use case classes
│   │   ├── domain/services/toolkit_catalogue.dart ← NEW: Static 16-exercise catalogue
│   │   └── presentation/
│   │       ├── providers/toolkit_provider.dart   ← Providers + BreathingExerciseNotifier
│   │       ├── providers/journal_provider.dart   ← NEW: Journal providers
│   │       ├── screens/                         ← All toolkit screens
│   │       └── widgets/                         ← Reusable toolkit widgets
│   ├── interventions/
│   │   ├── data/models/notification_models.dart ← Enums + Isar collections
│   │   ├── data/notification_content.dart       ← Static template pools
│   │   ├── data/repositories/notification_repository.dart ← Notification CRUD
│   │   ├── domain/services/content_audit_service.dart ← NEW: Shame-language audit
│   │   ├── presentation/providers/notification_provider.dart ← Preferences notifier
│   │   ├── presentation/screens/                ← Settings, history, permission banner
│   │   └── services/                            ← Manager, scheduler, push service
│   └── relapse_prevention/
│       ├── data/models/relapse_models.dart       ← PanicStep, RelapseContact, RelapsePlan
│       ├── data/models/lapse_recovery_session_model.dart ← NEW: Recovery tracking
│       ├── data/static/crisis_helplines.dart     ← NEW: Static helpline data
│       ├── data/repositories/relapse_repository.dart ← Plan + contact CRUD
│       ├── domain/                              ← NEW: Domain layer
│       └── presentation/
│           ├── providers/relapse_provider.dart   ← AsyncNotifier + providers
│           ├── providers/help_safety_provider.dart ← NEW: Help screen providers
│           ├── screens/                         ← Plan, panic, edit, lapse recovery, help
│           └── widgets/                         ← PanicButton, PanicStepCard, ContactCard
```

### 9.3 Adding a New Exercise Type

1. Add enum value to `ExerciseCategory` in `toolkit_exercise.dart`
2. Add exercise entry to `ToolkitCatalogue._catalogue` list
3. Create the exercise screen in `presentation/screens/`
4. Add navigation case in `CravingToolkitScreen` / `ExerciseDetailScreen`
5. Wire `ToolkitSessionNotifier.startSession()` in the screen's `initState`
6. Wire `ToolkitSessionNotifier.endSession()` on completion/exit
7. Add `Semantics` widget for accessibility

### 9.4 Adding a New Notification Type

1. Add enum value to `NotificationType` in `notification_models.dart`
2. Add `isTypeEnabled()` case in `NotificationPreferences`
3. Add template pool in `notification_content.dart`
4. Add `_poolFor()` case
5. Add toggle in `NotificationPreferencesNotifier.setTypeEnabled()`
6. Add UI toggle in `notifications_settings_screen.dart`
7. Run `ContentAuditService.audit()` to verify no banned phrases
8. Add unit test for the new template pool

### 9.5 Accessibility Checklist

Per SRS NFR-08/09, all new widgets must have:
- `Semantics` label on interactive elements
- `Semantics(button: true)` on tappable elements
- `Semantics(header: true)` on section headers
- `Semantics(liveRegion: true)` on dynamically changing content (breathing phase)
- Explicit semantic labels on feedback/rating buttons
- Phone number buttons: `Semantics(label: 'Call $name at $number')`
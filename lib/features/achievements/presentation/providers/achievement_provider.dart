import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/database/database_provider.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/services/achievement_engine.dart';
import '../../domain/repositories/i_achievement_repository.dart';
import '../../data/repositories/achievement_repository_impl.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../tracking/data/models/statistics.dart' as raw_stats;
import '../../../tracking/services/statistics_calculator.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../../../interventions/data/models/notification_models.dart';

// ─── Repository provider ──────────────────────────────────────────────────

final achievementRepositoryProvider = Provider<IAchievementRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AchievementRepositoryImpl(db);
});

// ─── All achievements for the current user's mode ─────────────────────────

final achievementsProvider =
    FutureProvider.autoDispose<List<Achievement>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];
  final repo = ref.watch(achievementRepositoryProvider);
  return repo.getAchievements(userId);
});

// ─── Earned achievements only, sorted newest-first ────────────────────────

final earnedAchievementsProvider =
    FutureProvider.autoDispose<List<Achievement>>((ref) async {
  final all = await ref.watch(achievementsProvider.future);
  return all
      .where((a) => a.isUnlocked)
      .toList()
    ..sort((a, b) => b.unlockedAt!.compareTo(a.unlockedAt!));
});

// ─── Pending unlock animation queue ───────────────────────────────────────

final pendingUnlockAnimationsProvider =
    StateNotifierProvider<_UnlockQueueNotifier, List<Achievement>>(
  (ref) => _UnlockQueueNotifier(),
);

class _UnlockQueueNotifier extends StateNotifier<List<Achievement>> {
  _UnlockQueueNotifier() : super([]);

  void enqueue(List<Achievement> achievements) {
    state = [...state, ...achievements];
  }

  Achievement? dequeue() {
    if (state.isEmpty) return null;
    final next = state.first;
    state = state.sublist(1);
    return next;
  }
}

// ─── Achievement notifier — evaluates and persists ─────────────────────────
// NOT autoDispose — this is a long-lived service that must survive
// navigation away while evaluation is in-flight (B-04 fix).

final achievementNotifierProvider = AsyncNotifierProvider<
    AchievementNotifier, List<Achievement>>(AchievementNotifier.new);

class AchievementNotifier extends AsyncNotifier<List<Achievement>> {
  @override
  Future<List<Achievement>> build() async {
    final userId = await ref.watch(currentUserIdProvider.future);
    if (userId == null) return [];
    final repo = ref.read(achievementRepositoryProvider);
    return repo.getAchievements(userId);
  }

  /// Evaluate all achievements against CURRENT (freshly computed) statistics
  /// and log history. Persists updates, sends push notifications, and
  /// enqueues in-app unlock animations.
  ///
  /// Self-contained: computes its own statistics from repositories rather
  /// than relying on the possibly-stale [statisticsProvider] snapshot (B-01,
  /// B-06 fixes). Self-healing: seeds definitions if none exist yet.
  Future<void> evaluate() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final achievementsRepo = ref.read(achievementRepositoryProvider);
      final trackingRepo = ref.read(trackingRepositoryProvider);
      final profileRepo = ref.read(profileRepositoryProvider);

      // ── Guard: seed achievements if not yet seeded (race with bootstrap) ──
      int count = await achievementsRepo.getAchievementCount(userId);
      if (count == 0) {
        final profile = await profileRepo.getProfile(userId);
        if (profile != null) {
          await achievementsRepo.seedAchievements(
            userId: userId,
            mode: profile.goalType.name,
          );
        }
      }

      final current = await achievementsRepo.getAchievements(userId);
      if (current.isEmpty) return;

      // ── Profile & mode ───────────────────────────────────────────────
      final profile = await profileRepo.getProfile(userId);
      if (profile == null) return;
      final mode = profile.goalType.name;

      // ── Compute fresh statistics (B-01, B-06 fix) ────────────────────
      final allLogs = await trackingRepo.getLogEntries(userId);
      final allCravings = await trackingRepo.getCravingEntries(userId);

      final freshStats = StatisticsCalculator.calculateStatistics(
        logs: allLogs,
        cravings: allCravings,
        profile: profile,
      );

      // ── Build log summaries (B-09 fix: include CravingEntry outcomes) ─
      final logSummaries = allLogs
          .map((l) => LogEntrySummary(
                typeName: l.type.name,
                timestamp: l.timestamp,
              ))
          .toList();

      final resistedSummaries = allCravings
          .where((c) => c.wasSuccessfullyResisted)
          .map((c) => LogEntrySummary(
                typeName: 'cravingDelayed',
                timestamp: c.startTime,
              ))
          .toList();

      final combinedSummaries = [...logSummaries, ...resistedSummaries];

      // ── Evaluate ─────────────────────────────────────────────────────
      final engine = AchievementEngine();
      final updates = engine.evaluate(
        existing: current,
        stats: _mapStatistics(freshStats, profile),
        recentLogs: combinedSummaries,
        mode: mode,
      );

      if (updates.isEmpty) return;

      // ── Persist ──────────────────────────────────────────────────────
      await achievementsRepo.applyUpdates(userId, updates);

      // ── Enqueue in-app unlock animations ─────────────────────────────
      final justUnlocked = updates
          .where((u) => u.justUnlocked)
          .map((u) => current.firstWhere((a) => a.id == u.achievementId))
          .toList();

      if (justUnlocked.isNotEmpty) {
        ref
            .read(pendingUnlockAnimationsProvider.notifier)
            .enqueue(justUnlocked);

        // B-02 fix: Push notification for each unlocked achievement
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

      ref.invalidateSelf();
      ref.invalidate(achievementsProvider);
      ref.invalidate(earnedAchievementsProvider);

      debugPrint('Achievements evaluated: ${updates.length} updates, '
          '${justUnlocked.length} new unlocks');
    } catch (e, stack) {
      debugPrint('Achievement evaluation error: $e');
      debugPrint('Stack: $stack');
    }
  }

  // ── Map the app's Statistics to the engine's lightweight Statistics ──────

  static EngineStatistics _mapStatistics(
    raw_stats.Statistics s,
    dynamic profile,
  ) {
    final hasCostData = profile != null && profile.dailySmokingCost != null;
    return EngineStatistics(
      currentStreak: s.currentStreak,
      recoveryCount: s.recoveryCount,
      moneySaved: s.moneySaved,
      hasMoneySavingsData: hasCostData || s.moneySaved > 0 || s.potentialMoneySaved > 0,
    );
  }
}

// ─── Engine-compatible types (re-exported from engine for convenience) ─────

typedef EngineStatistics = Statistics;
typedef EngineLogSummary = LogEntrySummary;
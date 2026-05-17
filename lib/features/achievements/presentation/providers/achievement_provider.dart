import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/services/achievement_engine.dart';
import '../../domain/repositories/i_achievement_repository.dart';
import '../../data/repositories/achievement_repository_impl.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../tracking/data/models/statistics.dart' as tracking_stats;
import '../../../tracking/presentation/providers/statistics_provider.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// ─── Repository provider ──────────────────────────────────────────────────

final achievementRepositoryProvider = Provider<IAchievementRepository>((ref) {
  return AchievementRepositoryImpl();
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

final achievementNotifierProvider = AsyncNotifierProvider.autoDispose<
    AchievementNotifier, List<Achievement>>(AchievementNotifier.new);

class AchievementNotifier extends AutoDisposeAsyncNotifier<List<Achievement>> {
  @override
  Future<List<Achievement>> build() async {
    final userId = await ref.watch(currentUserIdProvider.future);
    if (userId == null) return [];
    final repo = ref.read(achievementRepositoryProvider);
    return repo.getAchievements(userId);
  }

  /// Evaluate all achievements against current statistics and log history.
  /// Persists updates and enqueues unlock animations for newly earned badges.
  ///
  /// Reads achievements directly from the repository (does NOT depend on
  /// [state] because `build()` may not have completed when this is first
  /// called). Self-healing: seeds definitions if none exist yet.
  Future<void> evaluate() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final achievementsRepo = ref.read(achievementRepositoryProvider);

      // ── Guard: seed achievements if not yet seeded (race with bootstrap) ──
      final count = await achievementsRepo.getAchievementCount(userId);
      if (count == 0) {
        final profileRepo = ref.read(profileRepositoryProvider);
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

      // ── Gather inputs ────────────────────────────────────────────────
      final statsState = ref.read(statisticsProvider);
      final stats = statsState.statistics;

      final profileRepo = ref.read(profileRepositoryProvider);
      final profile = await profileRepo.getProfile(userId);
      final mode = profile?.goalType.name ?? 'quitSmoking';

      final trackingRepo = ref.read(trackingRepositoryProvider);
      final allLogs = await trackingRepo.getLogEntries(userId);
      final logSummaries = allLogs
          .map((l) => LogEntrySummary(
                typeName: l.type.name,
                timestamp: l.timestamp,
              ))
          .toList();

      // ── Evaluate ─────────────────────────────────────────────────────
      final engine = AchievementEngine();
      final updates = engine.evaluate(
        existing: current,
        stats: _mapStatistics(stats),
        recentLogs: logSummaries,
        mode: mode,
      );

      if (updates.isEmpty) return;

      // ── Persist ──────────────────────────────────────────────────────
      await achievementsRepo.applyUpdates(userId, updates);

      // ── Enqueue unlock animations ────────────────────────────────────
      final justUnlocked = updates
          .where((u) => u.justUnlocked)
          .map((u) => current.firstWhere((a) => a.id == u.achievementId))
          .toList();

      if (justUnlocked.isNotEmpty) {
        ref.read(pendingUnlockAnimationsProvider.notifier).enqueue(justUnlocked);
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
    tracking_stats.Statistics s,
  ) {
    return EngineStatistics(
      currentStreak: s.currentStreak,
      recoveryCount: s.recoveryCount,
      moneySaved: s.moneySaved,
    );
  }
}

// ─── Engine-compatible types (re-exported from engine for convenience) ─────

typedef EngineStatistics = Statistics;
typedef EngineLogSummary = LogEntrySummary;
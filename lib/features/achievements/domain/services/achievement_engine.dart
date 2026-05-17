import '../entities/achievement.dart';

/// Pure Dart engine that evaluates achievement progress against current
/// statistics and log history.
///
/// Has zero Flutter dependencies — fully unit-testable.
class AchievementEngine {
  /// Evaluate all achievements against current statistics.
  ///
  /// Returns updates only for achievements whose [progressValue]
  /// or [isUnlocked] changed. Caller persists changes to Isar.
  List<AchievementUpdate> evaluate({
    required List<Achievement> existing,
    required Statistics stats,
    required List<LogEntrySummary> recentLogs,
    required String mode,
  }) {
    final updates = <AchievementUpdate>[];

    for (final achievement in existing) {
      // Skip achievements from the other mode
      if (achievement.modeFilter != null &&
          achievement.modeFilter!.name != mode) {
        continue;
      }

      final newProgress = _computeProgress(achievement, stats, recentLogs);
      final newUnlocked = newProgress >= achievement.progressMax;
      final justUnlocked = newUnlocked && !achievement.isUnlocked;

      if (newProgress != achievement.progressValue ||
          newUnlocked != achievement.isUnlocked) {
        updates.add(AchievementUpdate(
          achievementId: achievement.id,
          progressValue: newProgress,
          isUnlocked: newUnlocked,
          unlockedAt: justUnlocked
              ? DateTime.now().toUtc()
              : achievement.unlockedAt,
          justUnlocked: justUnlocked,
        ));
      }
    }
    return updates;
  }

  int _computeProgress(
    Achievement achievement,
    Statistics stats,
    List<LogEntrySummary> logs,
  ) {
    return switch (achievement.id) {
      // ── Streak-based ──────────────────────────────────────────────────
      'streak-day-1' => stats.currentStreak.clamp(0, 1),
      'streak-day-3' => stats.currentStreak.clamp(0, 3),
      'streak-day-7' => stats.currentStreak.clamp(0, 7),
      'streak-day-14' => stats.currentStreak.clamp(0, 14),
      'streak-day-30' => stats.currentStreak.clamp(0, 30),
      'streak-day-90' => stats.currentStreak.clamp(0, 90),
      'streak-day-180' => stats.currentStreak.clamp(0, 180),
      'streak-day-365' => stats.currentStreak.clamp(0, 365),

      // ── Resilience ────────────────────────────────────────────────────
      'recovery-1' => stats.recoveryCount.clamp(0, 1),
      'recovery-3' => stats.recoveryCount.clamp(0, 3),
      'recovery-5' => stats.recoveryCount.clamp(0, 5),

      // ── Engagement ────────────────────────────────────────────────────
      'checkin-7' => _countEventType(logs, 'dailyCheckin', 7),
      'checkin-30' => _countEventType(logs, 'dailyCheckin', 30),
      'toolkit-5' => _countEventType(logs, 'copingAction', 5),
      'toolkit-20' => _countEventType(logs, 'copingAction', 20),

      // ── Craving resistance ────────────────────────────────────────────
      'craving-resisted-1' => _countEventType(logs, 'cravingDelayed', 1),
      'craving-resisted-10' => _countEventType(logs, 'cravingDelayed', 10),
      'craving-resisted-50' => _countEventType(logs, 'cravingDelayed', 50),

      'urge-resisted-1' => _countEventType(logs, 'cravingDelayed', 1),
      'urge-resisted-25' => _countEventType(logs, 'cravingDelayed', 25),

      // ── Smoking money milestones ──────────────────────────────────────
      'smoke-money-10' =>
          (stats.moneySaved.toInt()).clamp(0, 10),
      'smoke-money-100' =>
          (stats.moneySaved.toInt()).clamp(0, 100),

      // Unknown ID — no change
      _ => achievement.progressValue,
    };
  }

  int _countEventType(List<LogEntrySummary> logs, String typeName, int max) =>
      logs.where((l) => l.typeName == typeName).length.clamp(0, max);
}

// ── Lightweight log summary for the engine ─────────────────────────────────
// Avoids a dependency on the full LogEntry Isar model in the domain layer.

class LogEntrySummary {
  final String typeName; // LogType.name
  final DateTime timestamp;

  const LogEntrySummary({
    required this.typeName,
    required this.timestamp,
  });
}

// ── Statistics POJO for the engine ─────────────────────────────────────────

class Statistics {
  final int currentStreak;
  final int recoveryCount;
  final double moneySaved;

  const Statistics({
    this.currentStreak = 0,
    this.recoveryCount = 0,
    this.moneySaved = 0,
  });
}
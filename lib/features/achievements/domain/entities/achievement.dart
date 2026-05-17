/// A badge or milestone achievement that a user can earn.
///
/// Achievements are computed on app open from LogEvent history.
/// They are never deducted — once earned, always shown as earned.
class Achievement {
  final String id; // stable string ID, never reused
  final String name; // short display name
  final String description; // one-sentence description
  final String iconEmoji; // single emoji for the badge icon
  final AchievementCategory category;
  final GoalTypeFilter? modeFilter; // null = shared; non-null = mode-specific
  final int progressValue; // current progress toward this badge
  final int progressMax; // target value (e.g. 7 for "7 days smoke-free")
  final bool isUnlocked;
  final DateTime? unlockedAt; // UTC, null if not yet earned

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.iconEmoji,
    required this.category,
    this.modeFilter,
    this.progressValue = 0,
    required this.progressMax,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  double get progressPercent =>
      progressMax > 0 ? (progressValue / progressMax).clamp(0.0, 1.0) : 0.0;

  bool get isInProgress => !isUnlocked && progressValue > 0;
}

enum AchievementCategory {
  streak, // time-based streaks
  milestone, // health or habit milestones
  resilience, // recovery and lapse events handled well
  engagement, // consistent check-ins, toolkit usage
  craving; // cravings resisted

  String get displayName {
    switch (this) {
      case AchievementCategory.streak:
        return 'Streak';
      case AchievementCategory.milestone:
        return 'Milestone';
      case AchievementCategory.resilience:
        return 'Resilience';
      case AchievementCategory.engagement:
        return 'Engagement';
      case AchievementCategory.craving:
        return 'Craving Control';
    }
  }
}

/// Mirrors GoalType for mode filtering, but lives in the domain layer
/// so achievements do not depend on the onboarding feature.
enum GoalTypeFilter {
  quitSmoking,
  reduceMasturbation;
}

/// Returned by [AchievementEngine.evaluate] when an achievement changes state.
class AchievementUpdate {
  final String achievementId;
  final int progressValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final bool justUnlocked; // true only the first time it transitions to unlocked

  const AchievementUpdate({
    required this.achievementId,
    required this.progressValue,
    required this.isUnlocked,
    this.unlockedAt,
    this.justUnlocked = false,
  });
}
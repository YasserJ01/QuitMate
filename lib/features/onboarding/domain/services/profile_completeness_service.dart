import '../../data/models/user_profile.dart';

/// Represents which optional profile fields are filled, gating downstream
/// features like money-saved cards, distress trends, and notifications.
class ProfileCompleteness {
  final bool hasMoneySavingsData; // CPD + costPerPack filled
  final bool hasHighRiskWindowData; // smokingWindows or timeOfDayPatterns filled
  final bool hasTriggerData; // triggers.isNotEmpty
  final bool hasValuesData; // values.isNotEmpty
  final bool hasDistressBaseline; // distressLevel != null
  final bool hasHealthMilestoneData; // quitDate + CPD filled
  final bool hasTimeReclaimData; // episodeDurationMinutes + episodesPerWeek filled
  final double fillPercentage; // 0.0–1.0 for progress indicator

  const ProfileCompleteness({
    required this.hasMoneySavingsData,
    required this.hasHighRiskWindowData,
    required this.hasTriggerData,
    required this.hasValuesData,
    required this.hasDistressBaseline,
    required this.hasHealthMilestoneData,
    required this.hasTimeReclaimData,
    required this.fillPercentage,
  });

  factory ProfileCompleteness.empty() {
    return const ProfileCompleteness(
      hasMoneySavingsData: false,
      hasHighRiskWindowData: false,
      hasTriggerData: false,
      hasValuesData: false,
      hasDistressBaseline: false,
      hasHealthMilestoneData: false,
      hasTimeReclaimData: false,
      fillPercentage: 0.0,
    );
  }
}

/// Pure Dart domain service that evaluates how complete a user's profile is.
/// Used by dashboard widgets, notification system, and profile nudge cards.
class ProfileCompletenessService {
  ProfileCompleteness evaluate(UserProfile profile) {
    int filled = 0;
    int total = 0;

    // Money savings data: CPD + costPerPack
    final hasMoneySavings = profile.cigarettesPerDay != null &&
        profile.costPerPack != null;
    total += 2;
    if (profile.cigarettesPerDay != null) filled++;
    if (profile.costPerPack != null) filled++;

    // High-risk window data
    final hasHighRiskWindow = profile.smokingWindows.isNotEmpty ||
        profile.timeOfDayPatterns.isNotEmpty;
    total += 1;
    if (hasHighRiskWindow) filled++;

    // Trigger data
    final hasTrigger = profile.triggers.isNotEmpty;
    total += 1;
    if (hasTrigger) filled++;

    // Values data
    final hasValues = profile.values.isNotEmpty;
    total += 1;
    if (hasValues) filled++;

    // Distress baseline
    final hasDistress = profile.distressLevel != null;
    total += 1;
    if (hasDistress) filled++;

    // Health milestone data
    final hasHealthMilestone =
        profile.quitDate != null && profile.cigarettesPerDay != null;
    total += 1;
    if (profile.quitDate != null) filled++;

    // Time reclaim data (reduction mode)
    final hasTimeReclaim = profile.episodeDurationMinutes != null &&
        profile.episodesPerWeek != null;
    total += 1;
    if (profile.episodeDurationMinutes != null) filled++;

    // Extra fields that count toward fill percentage
    total += 1;
    if (profile.cigarettesPerPack != null) filled++;
    total += 1;
    if (profile.yearsSmoking != null) filled++;
    total += 1;
    if (profile.confidenceToQuit != null || profile.confidenceToReduce != null) filled++;
    total += 1;
    if (profile.previousQuitAttempts != null || profile.previousReductionAttempts != null) filled++;

    final fillPercentage = total > 0 ? filled / total : 0.0;

    return ProfileCompleteness(
      hasMoneySavingsData: hasMoneySavings,
      hasHighRiskWindowData: hasHighRiskWindow,
      hasTriggerData: hasTrigger,
      hasValuesData: hasValues,
      hasDistressBaseline: hasDistress,
      hasHealthMilestoneData: hasHealthMilestone,
      hasTimeReclaimData: hasTimeReclaim,
      fillPercentage: fillPercentage.clamp(0.0, 1.0),
    );
  }
}

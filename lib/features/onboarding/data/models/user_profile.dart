import '../../domain/entities/goal_type.dart';

class UserProfile {
  int id;
  String userId;
  String? nickname;
  GoalType goalType;
  bool modeLocked;
  int longestStreakDays;
  int recoveryCount;
  DateTime? lastLapseAt;

  // Smoking profile
  int? cigarettesPerDay;
  int? cigarettesPerPack;
  double? costPerPack;
  int? ttfcMinutesIndex;
  int? yearsSmoking;
  String? reductionPlanJson;
  int? previousQuitAttempts;
  List<String> previousAids;
  int? confidenceToQuit;
  List<String> smokingWindows;

  // Reduction profile
  int? episodesPerWeek;
  int? episodeDurationMinutes;
  bool? pornInvolvementFlag;
  int? distressLevel;
  int? sleepEffectIndex;
  int? focusEffectIndex;
  int? relationshipEffectIndex;
  int? previousReductionAttempts;
  int? confidenceToReduce;
  int? frequencyTarget;
  List<String> timeOfDayPatterns;
  List<String> values;

  // Shared
  List<TriggerType> triggers;
  List<String> reasons;
  DateTime? quitDate;
  DateTime createdAt;
  DateTime? updatedAt;

  UserProfile({
    this.id = 0,
    required this.userId,
    this.nickname,
    required this.goalType,
    this.modeLocked = false,
    this.longestStreakDays = 0,
    this.recoveryCount = 0,
    this.lastLapseAt,
    this.cigarettesPerDay,
    this.cigarettesPerPack,
    this.costPerPack,
    this.ttfcMinutesIndex,
    this.yearsSmoking,
    this.reductionPlanJson,
    this.previousQuitAttempts,
    this.previousAids = const [],
    this.confidenceToQuit,
    this.smokingWindows = const [],
    this.episodesPerWeek,
    this.episodeDurationMinutes,
    this.pornInvolvementFlag,
    this.distressLevel,
    this.sleepEffectIndex,
    this.focusEffectIndex,
    this.relationshipEffectIndex,
    this.previousReductionAttempts,
    this.confidenceToReduce,
    this.frequencyTarget,
    this.timeOfDayPatterns = const [],
    this.values = const [],
    this.triggers = const [],
    this.reasons = const [],
    this.quitDate,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  double? get dailySmokingCost {
    if (costPerPack == null || cigarettesPerPack == null || cigarettesPerDay == null) {
      return null;
    }
    return (costPerPack! / cigarettesPerPack!) * cigarettesPerDay!;
  }

  int? get daysUntilQuit {
    if (quitDate == null) return null;
    return quitDate!.difference(DateTime.now()).inDays;
  }

  bool get hasQuitDatePassed {
    if (quitDate == null) return false;
    return DateTime.now().isAfter(quitDate!);
  }
}

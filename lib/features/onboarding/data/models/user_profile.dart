import 'package:isar/isar.dart';
import '../../domain/entities/goal_type.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String userId;

  String? nickname;

  @Enumerated(EnumType.name)
  late GoalType goalType;

  // Mode lock flag — set true after onboarding completes (BR-02)
  bool modeLocked = false;

  // Denormalized streak data for fast reads (SRS §13.6)
  int longestStreakDays = 0;
  int recoveryCount = 0;
  DateTime? lastLapseAt; // UTC — for post-lapse notification scheduling

  // ── Smoking profile (only set if goalType == quitSmoking) ─────────────
  int? cigarettesPerDay;
  int? cigarettesPerPack;
  double? costPerPack;
  int? ttfcMinutesIndex; // 0=≤5min, 1=6-30min, 2=31-60min, 3=>60min
  int? yearsSmoking;
  String? reductionPlanJson; // gradual reduction schedule as JSON string (FR-S07)
  int? previousQuitAttempts;
  List<String> previousAids = [];
  int? confidenceToQuit; // 1–10
  List<String> smokingWindows = []; // time-of-day risk windows

  // ── Reduction profile (only set if goalType == reduceMasturbation) ────
  int? episodesPerWeek;
  int? episodeDurationMinutes; // user estimate for time reclaimed calc
  bool? pornInvolvementFlag; // optional, user-volunteered (FR-M02 neutral label)
  int? distressLevel; // 1–10
  int? sleepEffectIndex; // 0=None, 1=Slight, 2=Moderate, 3=Severe
  int? focusEffectIndex;
  int? relationshipEffectIndex;
  int? previousReductionAttempts;
  int? confidenceToReduce; // 1–10
  int? frequencyTarget; // episodes/week goal (FR-M08)
  List<String> timeOfDayPatterns = []; // morning, afternoon, evening, etc.
  List<String> values = []; // personal motivation values (FR-M07)

  // ── Shared ────────────────────────────────────────────────────────────
  @Enumerated(EnumType.name)
  List<TriggerType> triggers = [];

  // Quit/start date (UTC)
  DateTime? quitDate;

  // Timestamps
  late DateTime createdAt;
  DateTime? updatedAt;

  UserProfile() {
    createdAt = DateTime.now();
  }

  // Computed properties
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

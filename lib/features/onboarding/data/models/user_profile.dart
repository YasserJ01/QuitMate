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

  // Smoking baseline
  int? cigarettesPerDay;
  double? costPerPack;
  int? cigarettesPerPack;

  // Masturbation baseline
  int? episodesPerWeek;

  // Triggers
  @Enumerated(EnumType.name)
  List<TriggerType> triggers = [];

  // Quit date
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
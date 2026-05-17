import 'package:isar/isar.dart';

part 'achievement_model.g.dart';

@collection
class AchievementModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String achievementId; // stable string ID from achievement catalogue

  late String name;
  late String description;
  late String iconEmoji;
  late String category; // AchievementCategory.name
  String? modeFilter; // GoalType.name or null (null = shared)
  late int progressValue;
  late int progressMax;
  late bool isUnlocked;
  DateTime? unlockedAt; // UTC

  @Index()
  late String userId; // owner of this achievement record
}
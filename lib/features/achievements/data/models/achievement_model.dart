class AchievementModel {
  int id;
  String userId;
  String achievementId;
  String name;
  String description;
  String iconEmoji;
  String category;
  String? modeFilter;
  int progressValue;
  int progressMax;
  bool isUnlocked;
  DateTime? unlockedAt;

  AchievementModel({
    this.id = 0,
    required this.userId,
    required this.achievementId,
    required this.name,
    required this.description,
    required this.iconEmoji,
    required this.category,
    this.modeFilter,
    required this.progressValue,
    required this.progressMax,
    required this.isUnlocked,
    this.unlockedAt,
  });
}

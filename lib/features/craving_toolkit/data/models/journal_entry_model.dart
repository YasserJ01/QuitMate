class JournalEntryModel {
  int id;
  String entryId;
  String userId;
  DateTime createdAt;
  DateTime? updatedAt;
  String content;
  String? moodTag;
  String? sourceExerciseId;
  String? sourceExerciseName;

  JournalEntryModel({
    this.id = 0,
    required this.entryId,
    required this.userId,
    DateTime? createdAt,
    this.updatedAt,
    required this.content,
    this.moodTag,
    this.sourceExerciseId,
    this.sourceExerciseName,
  }) : createdAt = createdAt ?? DateTime.now();
}

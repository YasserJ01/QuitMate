class ToolkitSessionModel {
  int id;
  String userId;
  String exerciseId;
  String exerciseName;
  String exerciseCategory;
  DateTime startedAt;
  DateTime? completedAt;
  int? feedbackRating;
  String mode;
  String? linkedJournalEntryId;

  ToolkitSessionModel({
    this.id = 0,
    required this.userId,
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseCategory,
    DateTime? startedAt,
    this.completedAt,
    this.feedbackRating,
    required this.mode,
    this.linkedJournalEntryId,
  }) : startedAt = startedAt ?? DateTime.now();

  bool get wasCompleted => completedAt != null;
}

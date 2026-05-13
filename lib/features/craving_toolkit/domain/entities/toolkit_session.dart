/// Domain entity for a single toolkit exercise session.
class ToolkitSession {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final String exerciseCategory;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? feedbackRating;
  final String mode;
  final String? linkedJournalEntryId;

  const ToolkitSession({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseCategory,
    required this.startedAt,
    this.completedAt,
    this.feedbackRating,
    required this.mode,
    this.linkedJournalEntryId,
  });

  bool get wasCompleted => completedAt != null;
}
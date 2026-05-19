class WeeklyReviewModel {
  int id;
  String userId;
  DateTime weekStart;
  int checkInsCount;
  int toolkitSessionsCount;
  int cravingsResisted;
  int lapseEvents;
  String? topTrigger;
  String? mostUsedExercise;
  String? motivationalSummary;
  DateTime generatedAt;

  WeeklyReviewModel({
    this.id = 0,
    required this.userId,
    required this.weekStart,
    required this.checkInsCount,
    required this.toolkitSessionsCount,
    required this.cravingsResisted,
    required this.lapseEvents,
    this.topTrigger,
    this.mostUsedExercise,
    this.motivationalSummary,
    DateTime? generatedAt,
  }) : generatedAt = generatedAt ?? DateTime.now();
}

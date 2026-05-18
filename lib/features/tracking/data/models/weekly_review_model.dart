import 'package:isar/isar.dart';

part 'weekly_review_model.g.dart';

@collection
class WeeklyReviewModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late DateTime weekStart; // Monday 00:00 UTC of the reviewed week

  late int checkInsCount;
  late int toolkitSessionsCount;
  late int cravingsResisted;
  late int lapseEvents;
  String? topTrigger;
  String? mostUsedExercise;
  String? motivationalSummary;
  late DateTime generatedAt;
}
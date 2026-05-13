import 'package:isar/isar.dart';

part 'toolkit_session_model.g.dart';

/// Append-only record of a single toolkit exercise session.
///
/// Written on exercise start, updated on completion/abandon.
/// Feeds the weekly summary and toolkit history.
@collection
class ToolkitSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late String exerciseId;

  /// Denormalised for export/display without a join.
  late String exerciseName;
  late String exerciseCategory;

  @Index()
  late DateTime startedAt; // UTC

  /// null = abandoned before completion.
  DateTime? completedAt;

  bool get wasCompleted => completedAt != null;

  /// 0 = helped, 1 = somewhat, 2 = notReally, null = no feedback given.
  int? feedbackRating;

  /// [GoalType.name] at the time the session was started.
  late String mode;

  /// Optional link to a [JournalEntryModel] created from this session.
  String? linkedJournalEntryId;
}
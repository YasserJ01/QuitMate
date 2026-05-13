import 'package:isar/isar.dart';

part 'lapse_recovery_session_model.g.dart';

/// Tracks a single pass through the multi-step lapse recovery flow.
///
/// Written when the user logs a lapse event and enters the
/// [LapseRecoveryScreen].  Used for recovery statistics.
@collection
class LapseRecoverySessionModel {
  Id id = Isar.autoIncrement;

  /// Stable UUID for cross-referencing.
  @Index(unique: true)
  late String sessionId;

  @Index()
  late String userId;

  late DateTime startedAt; // UTC

  /// null = abandoned mid-flow.
  DateTime? completedAt;

  /// Which action the user chose in Step 2.
  @Enumerated(EnumType.name)
  LapseRecoveryAction? chosenAction;

  /// Triggers selected in Step 1 (may be empty if skipped).
  List<String> selectedTriggers = [];

  /// Whether the user opened the toolkit from this flow.
  bool openedToolkit = false;

  /// Whether the user read the recovery guide.
  bool readRecoveryGuide = false;

  /// Optional freeform note logged during recovery.
  String? recoveryNote;

  /// [GoalType.name] at the time of the lapse.
  late String mode;
}

enum LapseRecoveryAction {
  identifiedTrigger,
  openedToolkit,
  readRecoveryGuide,
  skipped,
}
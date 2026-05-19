enum LapseRecoveryAction {
  identifiedTrigger,
  openedToolkit,
  readRecoveryGuide,
  skipped,
}

class LapseRecoverySessionModel {
  int id;
  String sessionId;
  String userId;
  DateTime startedAt;
  DateTime? completedAt;
  LapseRecoveryAction? chosenAction;
  List<String> selectedTriggers;
  bool openedToolkit;
  bool readRecoveryGuide;
  String? recoveryNote;
  String mode;

  LapseRecoverySessionModel({
    this.id = 0,
    required this.sessionId,
    required this.userId,
    DateTime? startedAt,
    this.completedAt,
    this.chosenAction,
    this.selectedTriggers = const [],
    this.openedToolkit = false,
    this.readRecoveryGuide = false,
    this.recoveryNote,
    required this.mode,
  }) : startedAt = startedAt ?? DateTime.now();
}

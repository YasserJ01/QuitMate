/// Domain entity for a lapse recovery session.
class LapseRecoverySession {
  final String id;
  final String userId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String? chosenAction;
  final List<String> selectedTriggers;
  final bool openedToolkit;
  final bool readRecoveryGuide;
  final String? recoveryNote;
  final String mode;

  const LapseRecoverySession({
    required this.id,
    required this.userId,
    required this.startedAt,
    this.completedAt,
    this.chosenAction,
    this.selectedTriggers = const [],
    this.openedToolkit = false,
    this.readRecoveryGuide = false,
    this.recoveryNote,
    required this.mode,
  });

  bool get wasCompleted => completedAt != null;
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/toolkit_models.dart';
import '../../data/repositories/toolkit_repository.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

// Repository provider
final toolkitRepositoryProvider = Provider<ToolkitRepository>((ref) {
  return ToolkitRepository();
});

// Statistics provider
final toolkitStatisticsProvider = FutureProvider.autoDispose<ToolkitStatistics>(
  (ref) async {
    final repository = ref.watch(toolkitRepositoryProvider);
    final userId = await ref.watch(currentUserIdProvider.future);

    if (userId == null) return ToolkitStatistics.empty();

    return await repository.calculateStatistics(userId);
  },
);

// ============= BREATHING EXERCISE STATE =============

class BreathingExerciseState {
  final BreathingPattern pattern;
  final int targetDuration; // in seconds
  final int elapsedSeconds;
  final int currentCycle;
  final String currentPhase; // 'inhale', 'hold', 'exhale', 'pause'
  final int phaseSecondsRemaining;
  final bool isRunning;
  final bool isCompleted;
  final BreathingSession? session;

  const BreathingExerciseState({
    required this.pattern,
    required this.targetDuration,
    this.elapsedSeconds = 0,
    this.currentCycle = 0,
    this.currentPhase = 'inhale',
    this.phaseSecondsRemaining = 4,
    this.isRunning = false,
    this.isCompleted = false,
    this.session,
  });

  BreathingExerciseState copyWith({
    BreathingPattern? pattern,
    int? targetDuration,
    int? elapsedSeconds,
    int? currentCycle,
    String? currentPhase,
    int? phaseSecondsRemaining,
    bool? isRunning,
    bool? isCompleted,
    BreathingSession? session,
  }) {
    return BreathingExerciseState(
      pattern: pattern ?? this.pattern,
      targetDuration: targetDuration ?? this.targetDuration,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      currentCycle: currentCycle ?? this.currentCycle,
      currentPhase: currentPhase ?? this.currentPhase,
      phaseSecondsRemaining:
          phaseSecondsRemaining ?? this.phaseSecondsRemaining,
      isRunning: isRunning ?? this.isRunning,
      isCompleted: isCompleted ?? this.isCompleted,
      session: session ?? this.session,
    );
  }

  String get phaseInstruction {
    switch (currentPhase) {
      case 'inhale':
        return 'Breathe In';
      case 'hold':
        return 'Hold';
      case 'exhale':
        return 'Breathe Out';
      case 'pause':
        return 'Pause';
      default:
        return '';
    }
  }

  double get progress {
    if (targetDuration == 0) return 0;
    return elapsedSeconds / targetDuration;
  }
}

class BreathingExerciseNotifier extends StateNotifier<BreathingExerciseState> {
  final ToolkitRepository _repository;
  final String _userId;

  BreathingExerciseNotifier(
    this._repository,
    this._userId,
    BreathingPattern pattern,
  ) : super(
        BreathingExerciseState(
          pattern: pattern,
          targetDuration: 60, // Default 1 minute
          phaseSecondsRemaining: pattern.inhaleSeconds,
        ),
      );

  void setDuration(int seconds) {
    state = state.copyWith(targetDuration: seconds);
  }

  Future<void> start() async {
    if (state.isRunning) return;

    // Create session - INITIALIZE ALL LATE FIELDS
    final session = BreathingSession()
      ..userId = _userId
      ..pattern = state.pattern
      ..durationSeconds = state.targetDuration
      ..cyclesCompleted =
          0 // ADD THIS - initialize the late field
      ..startTime = DateTime.now(); // ADD THIS - initialize the late field

    final savedSession = await _repository.addBreathingSession(session);

    state = state.copyWith(
      isRunning: true,
      session: savedSession,
      elapsedSeconds: 0,
      currentCycle: 0,
      currentPhase: 'inhale',
      phaseSecondsRemaining: state.pattern.inhaleSeconds,
    );

    _startTimer();
  }

  void pause() {
    state = state.copyWith(isRunning: false);
  }

  void resume() {
    state = state.copyWith(isRunning: true);
    _startTimer();
  }

  Future<void> complete(int effectivenessRating) async {
    if (state.session == null) return;

    final session = state.session!;
    session.endTime = DateTime.now();
    session.cyclesCompleted = state.currentCycle;
    session.effectivenessRating = effectivenessRating;

    await _repository.updateBreathingSession(session);

    state = state.copyWith(isRunning: false, isCompleted: true);
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!state.isRunning || mounted == false) return;

      final newElapsed = state.elapsedSeconds + 1;
      final newPhaseSeconds = state.phaseSecondsRemaining - 1;

      if (newElapsed >= state.targetDuration) {
        // Exercise complete
        state = state.copyWith(
          elapsedSeconds: newElapsed,
          isRunning: false,
          isCompleted: true,
        );
        return;
      }

      if (newPhaseSeconds <= 0) {
        // Move to next phase
        final nextPhaseData = _getNextPhase();
        state = state.copyWith(
          elapsedSeconds: newElapsed,
          currentPhase: nextPhaseData['phase'],
          phaseSecondsRemaining: nextPhaseData['seconds'],
          currentCycle: nextPhaseData['cycle'],
        );
      } else {
        state = state.copyWith(
          elapsedSeconds: newElapsed,
          phaseSecondsRemaining: newPhaseSeconds,
        );
      }

      _startTimer();
    });
  }

  Map<String, dynamic> _getNextPhase() {
    String nextPhase;
    int seconds;
    int cycle = state.currentCycle;

    switch (state.currentPhase) {
      case 'inhale':
        nextPhase = 'hold';
        seconds = state.pattern.holdSeconds;
        break;
      case 'hold':
        nextPhase = 'exhale';
        seconds = state.pattern.exhaleSeconds;
        break;
      case 'exhale':
        if (state.pattern.pauseSeconds > 0) {
          nextPhase = 'pause';
          seconds = state.pattern.pauseSeconds;
        } else {
          nextPhase = 'inhale';
          seconds = state.pattern.inhaleSeconds;
          cycle++;
        }
        break;
      case 'pause':
        nextPhase = 'inhale';
        seconds = state.pattern.inhaleSeconds;
        cycle++;
        break;
      default:
        nextPhase = 'inhale';
        seconds = state.pattern.inhaleSeconds;
    }

    return {'phase': nextPhase, 'seconds': seconds, 'cycle': cycle};
  }

  void reset() {
    state = BreathingExerciseState(
      pattern: state.pattern,
      targetDuration: state.targetDuration,
      phaseSecondsRemaining: state.pattern.inhaleSeconds,
    );
  }
}

final breathingExerciseProvider = StateNotifierProvider.autoDispose
    .family<
      BreathingExerciseNotifier,
      BreathingExerciseState,
      BreathingPattern
    >((ref, pattern) {
      final repository = ref.watch(toolkitRepositoryProvider);
      final userIdAsync = ref.watch(currentUserIdProvider);

      return userIdAsync.when(
        data: (userId) =>
            BreathingExerciseNotifier(repository, userId ?? '', pattern),
        loading: () => BreathingExerciseNotifier(repository, '', pattern),
        error: (_, __) => BreathingExerciseNotifier(repository, '', pattern),
      );
    });

// ============= CBT SESSION STATE =============

class CbtSessionState {
  final CbtTechnique technique;
  final CbtSession? session;
  final int currentStep;
  final bool isCompleted;
  final String? error;

  const CbtSessionState({
    required this.technique,
    this.session,
    this.currentStep = 0,
    this.isCompleted = false,
    this.error,
  });

  CbtSessionState copyWith({
    CbtTechnique? technique,
    CbtSession? session,
    int? currentStep,
    bool? isCompleted,
    String? error,
  }) {
    return CbtSessionState(
      technique: technique ?? this.technique,
      session: session ?? this.session,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
      error: error,
    );
  }
}

class CbtSessionNotifier extends StateNotifier<CbtSessionState> {
  final ToolkitRepository _repository;
  final String _userId;

  CbtSessionNotifier(this._repository, this._userId, CbtTechnique technique)
    : super(CbtSessionState(technique: technique));

  Future<void> start() async {
    final session = CbtSession()
      ..userId = _userId
      ..technique = state.technique;

    final savedSession = await _repository.addCbtSession(session);

    state = state.copyWith(session: savedSession);
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<void> updateThoughts({
    String? thoughtsBefore,
    String? thoughtsAfter,
    String? consequences,
    String? alternativeChosen,
  }) async {
    if (state.session == null) return;

    final session = state.session!;
    if (thoughtsBefore != null) session.thoughtsBefore = thoughtsBefore;
    if (thoughtsAfter != null) session.thoughtsAfter = thoughtsAfter;
    if (consequences != null) session.consequences = consequences;
    if (alternativeChosen != null)
      session.alternativeChosen = alternativeChosen;

    await _repository.updateCbtSession(session);
    state = state.copyWith(session: session);
  }

  Future<void> complete(bool wasHelpful, int helpfulnessRating) async {
    if (state.session == null) return;

    final session = state.session!;
    session.endTime = DateTime.now();
    session.wasHelpful = wasHelpful;
    session.helpfulnessRating = helpfulnessRating;

    await _repository.updateCbtSession(session);

    state = state.copyWith(session: session, isCompleted: true);
  }
}

final cbtSessionProvider = StateNotifierProvider.autoDispose
    .family<CbtSessionNotifier, CbtSessionState, CbtTechnique>((
      ref,
      technique,
    ) {
      final repository = ref.watch(toolkitRepositoryProvider);
      final userIdAsync = ref.watch(currentUserIdProvider);

      return userIdAsync.when(
        data: (userId) =>
            CbtSessionNotifier(repository, userId ?? '', technique),
        loading: () => CbtSessionNotifier(repository, '', technique),
        error: (_, __) => CbtSessionNotifier(repository, '', technique),
      );
    });

// ============= GROUNDING SESSION STATE =============

class GroundingSessionState {
  final GroundingExercise exercise;
  final GroundingSession? session;
  final int currentStep;
  final bool isCompleted;

  const GroundingSessionState({
    required this.exercise,
    this.session,
    this.currentStep = 0,
    this.isCompleted = false,
  });

  GroundingSessionState copyWith({
    GroundingExercise? exercise,
    GroundingSession? session,
    int? currentStep,
    bool? isCompleted,
  }) {
    return GroundingSessionState(
      exercise: exercise ?? this.exercise,
      session: session ?? this.session,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class GroundingSessionNotifier extends StateNotifier<GroundingSessionState> {
  final ToolkitRepository _repository;
  final String _userId;

  GroundingSessionNotifier(
    this._repository,
    this._userId,
    GroundingExercise exercise,
  ) : super(GroundingSessionState(exercise: exercise));

  Future<void> start() async {
    final session = GroundingSession()
      ..userId = _userId
      ..exercise = state.exercise;

    final savedSession = await _repository.addGroundingSession(session);

    state = state.copyWith(session: savedSession);
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<void> saveFiveSensesResponses({
    String? see,
    String? touch,
    String? hear,
    String? smell,
    String? taste,
  }) async {
    if (state.session == null) return;

    final session = state.session!;
    if (see != null) session.seeItems = see;
    if (touch != null) session.touchItems = touch;
    if (hear != null) session.hearItems = hear;
    if (smell != null) session.smellItems = smell;
    if (taste != null) session.tasteItems = taste;

    await _repository.updateGroundingSession(session);
    state = state.copyWith(session: session);
  }

  Future<void> complete(int effectivenessRating) async {
    if (state.session == null) return;

    final session = state.session!;
    session.endTime = DateTime.now();
    session.effectivenessRating = effectivenessRating;

    await _repository.updateGroundingSession(session);

    state = state.copyWith(session: session, isCompleted: true);
  }
}

final groundingSessionProvider = StateNotifierProvider.autoDispose
    .family<GroundingSessionNotifier, GroundingSessionState, GroundingExercise>(
      (ref, exercise) {
        final repository = ref.watch(toolkitRepositoryProvider);
        final userIdAsync = ref.watch(currentUserIdProvider);

        return userIdAsync.when(
          data: (userId) =>
              GroundingSessionNotifier(repository, userId ?? '', exercise),
          loading: () => GroundingSessionNotifier(repository, '', exercise),
          error: (_, __) => GroundingSessionNotifier(repository, '', exercise),
        );
      },
    );

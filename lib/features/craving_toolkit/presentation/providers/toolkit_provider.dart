import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/database/database_provider.dart';
import '../../data/models/toolkit_models.dart';
import '../../data/repositories/toolkit_repository.dart';
import '../../data/repositories/toolkit_repository_impl.dart';
import '../../domain/entities/toolkit_exercise.dart';
import '../../domain/entities/toolkit_session.dart';
import '../../domain/repositories/i_toolkit_repository.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// ─── Repository providers ──────────────────────────────────────────────────

final toolkitRepositoryProvider = Provider<ToolkitRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ToolkitRepository(db);
});

final toolkitExerciseRepoProvider = Provider<IToolkitRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ToolkitRepositoryImpl(db);
});

// ─── Exercise catalogue (mode-filtered) ────────────────────────────────────

final toolkitExercisesProvider = FutureProvider.autoDispose
    .family<List<ToolkitExercise>, String>((ref, mode) async {
  final repo = ref.watch(toolkitExerciseRepoProvider);
  return repo.getExercisesForMode(mode);
});

// ─── Favorites (stream — live updates on toggle) ───────────────────────────

final favoriteExercisesProvider = StreamProvider.autoDispose
    .family<List<ToolkitExercise>, String>((ref, mode) {
  final repo = ref.watch(toolkitExerciseRepoProvider);
  return repo.watchFavorites(mode);
});

// ─── Recents (last 3, any mode) ────────────────────────────────────────────

final recentExercisesProvider =
    FutureProvider.autoDispose<List<ToolkitExercise>>((ref) async {
  final repo = ref.watch(toolkitExerciseRepoProvider);
  return repo.getRecentExercises(limit: 3);
});

// ─── Current mode (derived from user profile) ──────────────────────────────

final currentModeProvider = FutureProvider.autoDispose<String?>((ref) async {
  final onboardingState = ref.watch(onboardingProvider);
  return onboardingState.goalType?.name;
});

// ─── Active session notifier ───────────────────────────────────────────────

class ToolkitSessionState {
  final ToolkitSession? activeSession;
  final ToolkitSession? lastCompletedSession;

  const ToolkitSessionState({this.activeSession, this.lastCompletedSession});

  ToolkitSessionState copyWith({
    ToolkitSession? activeSession,
    ToolkitSession? lastCompletedSession,
  }) =>
      ToolkitSessionState(
        activeSession: activeSession ?? this.activeSession,
        lastCompletedSession:
            lastCompletedSession ?? this.lastCompletedSession,
      );
}

class ToolkitSessionNotifier extends AutoDisposeNotifier<ToolkitSessionState> {
  @override
  ToolkitSessionState build() => const ToolkitSessionState();

  Future<void> startSession(
    ToolkitExercise exercise,
    String userId,
    String mode,
  ) async {
    final repo = ref.read(toolkitExerciseRepoProvider);
    final sessionId = await repo.startSession(
      exerciseId: exercise.id,
      userId: userId,
      mode: mode,
    );
    await repo.markExerciseUsed(exercise.id);
    ref.invalidate(recentExercisesProvider);

    state = state.copyWith(
      activeSession: ToolkitSession(
        id: sessionId,
        exerciseId: exercise.id,
        exerciseName: exercise.name,
        exerciseCategory: exercise.category.name,
        startedAt: DateTime.now().toUtc(),
        mode: mode,
      ),
    );
  }

  /// Field-level overload for screens that construct the exercise ID themselves.
  Future<void> startSessionById({
    required String exerciseId,
    required String exerciseName,
    required String exerciseCategory,
    required String userId,
    required String mode,
  }) async {
    final repo = ref.read(toolkitExerciseRepoProvider);
    final sessionId = await repo.startSession(
      exerciseId: exerciseId,
      userId: userId,
      mode: mode,
    );
    await repo.markExerciseUsed(exerciseId);
    ref.invalidate(recentExercisesProvider);

    state = state.copyWith(
      activeSession: ToolkitSession(
        id: sessionId,
        exerciseId: exerciseId,
        exerciseName: exerciseName,
        exerciseCategory: exerciseCategory,
        startedAt: DateTime.now().toUtc(),
        mode: mode,
      ),
    );
  }

  Future<void> endSession({required bool completed}) async {
    final session = state.activeSession;
    if (session == null) return;
    final repo = ref.read(toolkitExerciseRepoProvider);
    await repo.endSession(sessionId: session.id, completed: completed);
    state = state.copyWith(
      activeSession: null,
      lastCompletedSession: session,
    );
  }

  Future<void> recordFeedback(int rating) async {
    final session = state.lastCompletedSession;
    if (session == null) return;
    await ref.read(toolkitExerciseRepoProvider).recordFeedback(
          sessionId: session.id,
          rating: rating,
        );
  }

  Future<void> toggleFavorite(String exerciseId) async {
    await ref.read(toolkitExerciseRepoProvider).toggleFavorite(exerciseId);
  }
}

final toolkitSessionProvider =
    NotifierProvider.autoDispose<ToolkitSessionNotifier, ToolkitSessionState>(
  ToolkitSessionNotifier.new,
);

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

  const BreathingExerciseState({
    required this.pattern,
    required this.targetDuration,
    this.elapsedSeconds = 0,
    this.currentCycle = 0,
    this.currentPhase = 'inhale',
    this.phaseSecondsRemaining = 4,
    this.isRunning = false,
    this.isCompleted = false,
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
    final value = elapsedSeconds / targetDuration;
    return value.clamp(0.0, 1.0).toDouble();
  }
}

class BreathingExerciseNotifier extends StateNotifier<BreathingExerciseState> {
  BreathingExerciseNotifier(BreathingPattern pattern)
      : super(
          BreathingExerciseState(
            pattern: pattern,
            targetDuration: 60, // Default 1 minute
            phaseSecondsRemaining: pattern.inhaleSeconds,
          ),
        );

  void setDuration(int seconds) {
    state = state.copyWith(targetDuration: _alignDuration(seconds));
  }

  int _alignDuration(int seconds) {
    final cycleSeconds = state.pattern.totalCycleSeconds;
    if (cycleSeconds <= 0) {
      return seconds;
    }

    final remainder = seconds % cycleSeconds;
    return remainder == 0 ? seconds : seconds + (cycleSeconds - remainder);
  }

  Future<void> start() async {
    if (state.isRunning) return;

    final alignedDuration = _alignDuration(state.targetDuration);

    state = state.copyWith(
      isRunning: true,
      elapsedSeconds: 0,
      currentCycle: 0,
      currentPhase: 'inhale',
      phaseSecondsRemaining: state.pattern.inhaleSeconds,
      targetDuration: alignedDuration,
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
    state = state.copyWith(isRunning: false, isCompleted: true);
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () async {
      if (!mounted) return;
      if (!state.isRunning) return;

      final newElapsed = state.elapsedSeconds + 1;
      final newPhaseSeconds = state.phaseSecondsRemaining - 1;
      final targetReached = newElapsed >= state.targetDuration;

      if (newPhaseSeconds <= 0) {
        if (targetReached) {
          var completedCycles = state.currentCycle;
          final endsCycle = state.currentPhase == 'pause' ||
              (state.currentPhase == 'exhale' &&
                  state.pattern.pauseSeconds == 0);
          if (endsCycle) {
            completedCycles += 1;
          }

          // Exercise complete at end of current phase
          state = state.copyWith(
            elapsedSeconds: newElapsed,
            phaseSecondsRemaining: 0,
            currentCycle: completedCycles,
            isRunning: false,
            isCompleted: true,
          );
          return;
        }

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
        // Skip hold if holdSeconds is 0 (calm, energizing patterns)
        if (state.pattern.holdSeconds > 0) {
          nextPhase = 'hold';
          seconds = state.pattern.holdSeconds;
        } else {
          nextPhase = 'exhale';
          seconds = state.pattern.exhaleSeconds;
        }
        break;
      case 'hold':
        nextPhase = 'exhale';
        seconds = state.pattern.exhaleSeconds;
        break;
      case 'exhale':
        // Skip pause if pauseSeconds is 0
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
      return BreathingExerciseNotifier(pattern);
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
    final session = CbtSession(userId: _userId, technique: state.technique);

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
    if (alternativeChosen != null) {
      session.alternativeChosen = alternativeChosen;
    }

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
        error: (_, _) => CbtSessionNotifier(repository, '', technique),
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
    final session = GroundingSession(userId: _userId, exercise: state.exercise);

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
          error: (_, _) => GroundingSessionNotifier(repository, '', exercise),
        );
      },
    );

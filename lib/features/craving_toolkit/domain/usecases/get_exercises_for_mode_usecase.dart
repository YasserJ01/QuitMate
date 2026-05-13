import '../entities/toolkit_exercise.dart';
import '../repositories/i_toolkit_repository.dart';

/// Returns all exercises filtered to the given [mode].
///
/// Shared exercises (isSharedBothModes = true) are always included.
/// Mode-exclusive exercises are included only when their modeFilter matches.
class GetExercisesForModeUseCase {
  final IToolkitRepository _repository;

  const GetExercisesForModeUseCase(this._repository);

  Future<List<ToolkitExercise>> execute(String mode) =>
      _repository.getExercisesForMode(mode);
}
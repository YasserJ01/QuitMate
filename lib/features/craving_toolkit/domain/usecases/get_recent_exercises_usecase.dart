import '../entities/toolkit_exercise.dart';
import '../repositories/i_toolkit_repository.dart';

/// Returns the most recently used exercises (up to [limit]).
class GetRecentExercisesUseCase {
  final IToolkitRepository _repository;

  const GetRecentExercisesUseCase(this._repository);

  Future<List<ToolkitExercise>> execute({int limit = 3}) =>
      _repository.getRecentExercises(limit: limit);
}
import '../repositories/i_toolkit_repository.dart';

/// Starts a toolkit session, marks the exercise as recently used,
/// and returns the new session ID.
class RecordSessionUseCase {
  final IToolkitRepository _repository;

  const RecordSessionUseCase(this._repository);

  Future<String> execute({
    required String exerciseId,
    required String userId,
    required String mode,
  }) async {
    // Mark exercise as used (updates lastUsedAt for recents)
    await _repository.markExerciseUsed(exerciseId);

    // Create the session record
    return _repository.startSession(
      exerciseId: exerciseId,
      userId: userId,
      mode: mode,
    );
  }
}
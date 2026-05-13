import '../../domain/entities/toolkit_exercise.dart';
import '../../domain/entities/toolkit_session.dart';

/// Abstract interface for toolkit exercise and session persistence.
///
/// Implemented by [ToolkitRepositoryImpl] in the data layer.
abstract class IToolkitRepository {
  // ── Exercise catalogue ──────────────────────────────────────────────────

  Future<List<ToolkitExercise>> getAllExercises();
  Future<List<ToolkitExercise>> getExercisesForMode(String mode);
  Stream<List<ToolkitExercise>> watchFavorites(String mode);
  Future<List<ToolkitExercise>> getRecentExercises({int limit = 3});
  Future<void> toggleFavorite(String exerciseId);
  Future<void> markExerciseUsed(String exerciseId);

  // ── Sessions ────────────────────────────────────────────────────────────

  Future<String> startSession({
    required String exerciseId,
    required String userId,
    required String mode,
  });

  Future<void> endSession({
    required String sessionId,
    required bool completed,
  });

  Future<void> recordFeedback({
    required String sessionId,
    required int rating,
  });

  Future<List<ToolkitSession>> getSessionsForUser(
    String userId, {
    DateTime? since,
    int? limit,
  });
}
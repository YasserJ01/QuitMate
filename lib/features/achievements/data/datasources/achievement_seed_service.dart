import '../../domain/repositories/i_achievement_repository.dart';

/// Seeds all achievement definitions for the user's mode on first run.
///
/// Idempotent — checks achievement count before inserting.
class AchievementSeedService {
  final IAchievementRepository _repository;

  const AchievementSeedService(this._repository);

  Future<void> seedIfNeeded({
    required String userId,
    required String mode,
  }) async {
    final count = await _repository.getAchievementCount(userId);
    if (count > 0) return; // already seeded

    await _repository.seedAchievements(userId: userId, mode: mode);
  }
}
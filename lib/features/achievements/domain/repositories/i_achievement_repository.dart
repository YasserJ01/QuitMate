import '../entities/achievement.dart';

abstract class IAchievementRepository {
  /// Returns all achievements (both locked and unlocked) for the given user.
  Future<List<Achievement>> getAchievements(String userId);

  /// Returns only earned (unlocked) achievements, sorted newest-first.
  Future<List<Achievement>> getEarnedAchievements(String userId);

  /// Returns the count of achievements seeded for the user.
  Future<int> getAchievementCount(String userId);

  /// Applies a batch of engine-generated updates to persistent storage.
  Future<void> applyUpdates(
    String userId,
    List<AchievementUpdate> updates,
  );

  /// Seeds all achievement definitions for the given mode.
  /// Only called when no achievements exist for the user yet.
  Future<void> seedAchievements({
    required String userId,
    required String mode, // GoalType.name
  });
}
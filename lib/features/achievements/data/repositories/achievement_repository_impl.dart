import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/repositories/i_achievement_repository.dart';
import '../models/achievement_model.dart';

class AchievementRepositoryImpl implements IAchievementRepository {
  Future<Isar> get _db => IsarService.instance;

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    final isar = await _db;
    final models = await isar.achievementModels
        .filter()
        .userIdEqualTo(userId)
        .findAll();
    return models.map(_toDomain).toList();
  }

  @override
  Future<List<Achievement>> getEarnedAchievements(String userId) async {
    final isar = await _db;
    final models = await isar.achievementModels
        .filter()
        .userIdEqualTo(userId)
        .isUnlockedEqualTo(true)
        .findAll();
    return models
        .map(_toDomain)
        .where((a) => a.unlockedAt != null)
        .toList()
      ..sort((a, b) => b.unlockedAt!.compareTo(a.unlockedAt!));
  }

  @override
  Future<int> getAchievementCount(String userId) async {
    final isar = await _db;
    return isar.achievementModels
        .filter()
        .userIdEqualTo(userId)
        .count();
  }

  @override
  Future<void> applyUpdates(
    String userId,
    List<AchievementUpdate> updates,
  ) async {
    if (updates.isEmpty) return;
    final isar = await _db;

    final modelMap = <String, AchievementModel>{};
    for (final update in updates) {
      final model = await isar.achievementModels
          .filter()
          .userIdEqualTo(userId)
          .achievementIdEqualTo(update.achievementId)
          .findFirst();
      if (model != null) {
        modelMap[update.achievementId] = model;
      }
    }

    final toWrite = <AchievementModel>[];
    for (final update in updates) {
      final model = modelMap[update.achievementId];
      if (model == null) continue;
      model.progressValue = update.progressValue;
      model.isUnlocked = update.isUnlocked;
      if (update.unlockedAt != null) {
        model.unlockedAt = update.unlockedAt;
      }
      toWrite.add(model);
    }

    await isar.writeTxn(() async {
      await isar.achievementModels.putAll(toWrite);
    });
  }

  @override
  Future<void> seedAchievements({
    required String userId,
    required String mode,
  }) async {
    final existingCount = await getAchievementCount(userId);
    if (existingCount > 0) return; // already seeded — idempotent

    final definitions = _buildDefinitionsForMode(mode, userId);
    final isar = await _db;
    await isar.writeTxn(() async {
      await isar.achievementModels.putAll(definitions);
    });
  }

  // ── Helper: model → domain ──────────────────────────────────────────────

  Achievement _toDomain(AchievementModel m) {
    return Achievement(
      id: m.achievementId,
      name: m.name,
      description: m.description,
      iconEmoji: m.iconEmoji,
      category: AchievementCategory.values.firstWhere(
        (c) => c.name == m.category,
        orElse: () => AchievementCategory.streak,
      ),
      modeFilter: m.modeFilter != null
          ? GoalTypeFilter.values.firstWhere(
              (f) => f.name == m.modeFilter,
              orElse: () => GoalTypeFilter.quitSmoking,
            )
          : null,
      progressValue: m.progressValue,
      progressMax: m.progressMax,
      isUnlocked: m.isUnlocked,
      unlockedAt: m.unlockedAt,
    );
  }

  // ── Definition catalogue ────────────────────────────────────────────────

  static List<AchievementModel> _buildDefinitionsForMode(
    String mode,
    String userId,
  ) {
    final isSmoking = mode == 'quitSmoking';
    final definitions = <AchievementModel>[];

    void add(String id, String name, String desc, String emoji,
        AchievementCategory cat, int max,
        {String? modeFilter}) {
      definitions.add(AchievementModel()
        ..achievementId = id
        ..name = name
        ..description = desc
        ..iconEmoji = emoji
        ..category = cat.name
        ..modeFilter = modeFilter
        ..progressValue = 0
        ..progressMax = max
        ..isUnlocked = false
        ..unlockedAt = null
        ..userId = userId);
    }

    if (isSmoking) {
      // ── Smoking-specific ──────────────────────────────────────────────
      add('streak-day-1', 'First Smoke-Free Day',
          'You made it through your first day.', '🌅',
          AchievementCategory.streak, 1,
          modeFilter: 'quitSmoking');
      add('streak-day-7', 'One Week Smoke-Free',
          'Seven days. Your circulation is already improving.', '🌿',
          AchievementCategory.streak, 7,
          modeFilter: 'quitSmoking');
      add('streak-day-14', 'Two Weeks Strong',
          'Your lung function is increasing.', '🫁',
          AchievementCategory.streak, 14,
          modeFilter: 'quitSmoking');
      add('streak-day-30', 'One Month Free',
          'A month of choosing yourself every day.', '🎯',
          AchievementCategory.streak, 30,
          modeFilter: 'quitSmoking');
      add('streak-day-90', '90 Days',
          'Three months. Most withdrawal symptoms are long gone.', '🌟',
          AchievementCategory.streak, 90,
          modeFilter: 'quitSmoking');
      add('streak-day-180', 'Six Months',
          'Half a year smoke-free. Your risk of heart disease is falling.', '🏆',
          AchievementCategory.streak, 180,
          modeFilter: 'quitSmoking');
      add('streak-day-365', 'One Full Year',
          'One year. Your heart disease risk is now half that of a smoker.', '🎊',
          AchievementCategory.streak, 365,
          modeFilter: 'quitSmoking');
      add('smoke-money-10', 'First £10 Saved',
          "You've redirected your first £10 away from cigarettes.", '💰',
          AchievementCategory.milestone, 10,
          modeFilter: 'quitSmoking');
      add('smoke-money-100', '£100 Saved',
          "£100 reclaimed. That's yours now.", '💸',
          AchievementCategory.milestone, 100,
          modeFilter: 'quitSmoking');
      add('craving-resisted-1', 'First Craving Beaten',
          "You felt it and didn't act on it. That's huge.", '💪',
          AchievementCategory.craving, 1,
          modeFilter: 'quitSmoking');
      add('craving-resisted-10', 'Ten Cravings Beaten',
          'Ten times you chose your goal over the urge.', '🛡️',
          AchievementCategory.craving, 10,
          modeFilter: 'quitSmoking');
      add('craving-resisted-50', 'Fifty Strong',
          "Fifty cravings resisted. You've built real strength.", '⚡',
          AchievementCategory.craving, 50,
          modeFilter: 'quitSmoking');
    } else {
      // ── Reduction-specific ────────────────────────────────────────────
      add('streak-day-3', 'Three Days',
          'Three days of choosing your values.', '🌱',
          AchievementCategory.streak, 3,
          modeFilter: 'reduceMasturbation');
      add('streak-day-7', 'One Week',
          'Seven days of self-directed clarity.', '🌿',
          AchievementCategory.streak, 7,
          modeFilter: 'reduceMasturbation');
      add('streak-day-14', 'Two Weeks',
          'Two weeks. Your focus and sleep patterns are likely shifting.', '🧘',
          AchievementCategory.streak, 14,
          modeFilter: 'reduceMasturbation');
      add('streak-day-30', 'Thirty Days',
          'A month of aligning with your values every day.', '🎯',
          AchievementCategory.streak, 30,
          modeFilter: 'reduceMasturbation');
      add('streak-day-90', '90 Days',
          'Three months of self-chosen clarity.', '🌟',
          AchievementCategory.streak, 90,
          modeFilter: 'reduceMasturbation');
      add('urge-resisted-1', 'First Urge Surfed',
          'You rode the wave instead of acting on it.', '🌊',
          AchievementCategory.craving, 1,
          modeFilter: 'reduceMasturbation');
      add('urge-resisted-25', '25 Urges Surfed',
          '25 times you felt the pull and chose your values instead.', '⚡',
          AchievementCategory.craving, 25,
          modeFilter: 'reduceMasturbation');
    }

    // ── Shared (both modes) ─────────────────────────────────────────────
    add('recovery-1', 'Back on Course',
        'You noticed, you acknowledged, and you kept going.', '🔄',
        AchievementCategory.resilience, 1);
    add('recovery-3', 'Three Recoveries',
        "Resilience isn't absence of struggle — it's choosing to continue.", '🌱',
        AchievementCategory.resilience, 3);
    add('recovery-5', 'Five Recoveries',
        "Five times you chose to continue. That persistence is yours.", '💜',
        AchievementCategory.resilience, 5);
    add('checkin-7', 'Seven Check-Ins',
        'Seven days of staying connected to your goal.', '📅',
        AchievementCategory.engagement, 7);
    add('checkin-30', 'Thirty Check-Ins',
        'A month of showing up for yourself.', '📆',
        AchievementCategory.engagement, 30);
    add('toolkit-5', 'Toolkit Explorer',
        'Used the craving toolkit 5 times.', '🧰',
        AchievementCategory.engagement, 5);
    add('toolkit-20', 'Toolkit Regular',
        '20 toolkit sessions. You have real coping skills now.', '🔧',
        AchievementCategory.engagement, 20);

    return definitions;
  }
}
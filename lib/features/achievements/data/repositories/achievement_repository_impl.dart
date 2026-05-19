import 'package:drift/drift.dart';
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../../domain/entities/achievement.dart';
import '../../domain/repositories/i_achievement_repository.dart';

class AchievementRepositoryImpl implements IAchievementRepository {
  final drift_db.AppDatabase db;

  AchievementRepositoryImpl(this.db);

  @override
  Future<List<Achievement>> getAchievements(String userId) async {
    final rows = await (db.select(db.achievements)
      ..where((t) => t.userId.equals(userId))).get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<List<Achievement>> getEarnedAchievements(String userId) async {
    final rows = await (db.select(db.achievements)
      ..where((t) => t.userId.equals(userId))
      ..where((t) => t.isUnlocked.equals(true))).get();
    final achievements = rows.map(_toDomain).toList();
    achievements.removeWhere((a) => a.unlockedAt == null);
    achievements.sort((a, b) => b.unlockedAt!.compareTo(a.unlockedAt!));
    return achievements;
  }

  @override
  Future<int> getAchievementCount(String userId) async {
    final rows = await (db.select(db.achievements)
      ..where((t) => t.userId.equals(userId))).get();
    return rows.length;
  }

  @override
  Future<void> applyUpdates(
    String userId,
    List<AchievementUpdate> updates,
  ) async {
    if (updates.isEmpty) return;

    final achievementIds = updates.map((u) => u.achievementId).toSet();
    final rows = await (db.select(db.achievements)
      ..where((t) => t.userId.equals(userId))
      ..where((t) => t.achievementId.isIn(achievementIds))).get();

    final modelMap = <String, drift_db.DbAchievement>{};
    for (final row in rows) {
      modelMap[row.achievementId] = row;
    }

    await db.transaction(() async {
      for (final update in updates) {
        final row = modelMap[update.achievementId];
        if (row == null) continue;

        await (db.update(db.achievements)
          ..where((t) => t.id.equals(row.id))).write(drift_db.AchievementsCompanion(
            progressValue: Value(update.progressValue),
            isUnlocked: Value(update.isUnlocked),
            unlockedAt: update.unlockedAt != null
                ? Value(update.unlockedAt)
                : const Value.absent(),
          ));
      }
    });
  }

  @override
  Future<void> seedAchievements({
    required String userId,
    required String mode,
  }) async {
    final existingCount = await getAchievementCount(userId);
    if (existingCount > 0) return;

    final definitions = _buildDefinitionsForMode(mode, userId);
    await db.batch((b) {
      b.insertAll(db.achievements, definitions,
          mode: InsertMode.insertOrIgnore);
    });
  }

  Achievement _toDomain(drift_db.DbAchievement row) {
    return Achievement(
      id: row.achievementId,
      name: row.name,
      description: row.description,
      iconEmoji: row.iconEmoji,
      category: AchievementCategory.values.firstWhere(
        (c) => c.name == row.category,
        orElse: () => AchievementCategory.streak,
      ),
      modeFilter: row.modeFilter != null
          ? GoalTypeFilter.values.firstWhere(
              (f) => f.name == row.modeFilter,
              orElse: () => GoalTypeFilter.quitSmoking,
            )
          : null,
      progressValue: row.progressValue,
      progressMax: row.progressMax,
      isUnlocked: row.isUnlocked,
      unlockedAt: row.unlockedAt,
    );
  }

  // ── Definition catalogue ────────────────────────────────────────────────

  List<drift_db.AchievementsCompanion> _buildDefinitionsForMode(
    String mode,
    String userId,
  ) {
    final isSmoking = mode == 'quitSmoking';
    final definitions = <drift_db.AchievementsCompanion>[];

    void add(String id, String name, String desc, String emoji,
        AchievementCategory cat, int max,
        {String? modeFilter}) {
      definitions.add(drift_db.AchievementsCompanion(
        userId: Value(userId),
        achievementId: Value(id),
        name: Value(name),
        description: Value(desc),
        iconEmoji: Value(emoji),
        category: Value(cat.name),
        modeFilter: Value(modeFilter),
        progressValue: Value(0),
        progressMax: Value(max),
        isUnlocked: Value(false),
        unlockedAt: const Value(null),
      ));
    }

    if (isSmoking) {
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

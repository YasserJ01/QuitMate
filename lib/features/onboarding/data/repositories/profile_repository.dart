import 'package:drift/drift.dart' show Value, InsertMode;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../models/user_profile.dart';
import '../../../onboarding/domain/entities/goal_type.dart';

class ProfileRepository {
  final drift_db.AppDatabase db;

  ProfileRepository(this.db);

  Future<UserProfile?> getProfile(String userId) async {
    final row = await (db.select(db.userProfiles)
        ..where((t) => t.userId.equals(userId))).getSingleOrNull();
    if (row == null) return null;
    return _fromRow(row);
  }

  Future<void> saveProfile(UserProfile profile) async {
    final row = _toCompanion(profile);
    await db.into(db.userProfiles).insert(row, mode: InsertMode.insertOrReplace);
  }

  Future<void> updateProfile(String userId, UserProfile updatedProfile) async {
    final existing = await getProfile(userId);
    if (existing == null) return;

    updatedProfile.id = existing.id;
    updatedProfile.createdAt = existing.createdAt;
    updatedProfile.updatedAt = DateTime.now();

    final row = _toCompanion(updatedProfile);
    await (db.update(db.userProfiles)
        ..where((t) => t.userId.equals(userId))).write(row);
  }

  Future<void> deleteProfile(String userId) async {
    await (db.delete(db.userProfiles)
        ..where((t) => t.userId.equals(userId))).go();
  }

  // ── Mappers ──────────────────────────────────────────────────────────────

  UserProfile _fromRow(drift_db.DbUserProfile row) {
    return UserProfile(
      id: row.id,
      userId: row.userId,
      nickname: row.nickname,
      goalType: GoalType.values.byName(row.goalType),
      modeLocked: row.modeLocked,
      longestStreakDays: row.longestStreakDays,
      recoveryCount: row.recoveryCount,
      lastLapseAt: row.lastLapseAt,
      cigarettesPerDay: row.cigarettesPerDay,
      cigarettesPerPack: row.cigarettesPerPack,
      costPerPack: row.costPerPack,
      ttfcMinutesIndex: row.ttfcMinutesIndex,
      yearsSmoking: row.yearsSmoking,
      reductionPlanJson: row.reductionPlanJson,
      previousQuitAttempts: row.previousQuitAttempts,
      previousAids: row.previousAids ?? [],
      confidenceToQuit: row.confidenceToQuit,
      smokingWindows: row.smokingWindows ?? [],
      episodesPerWeek: row.episodesPerWeek,
      episodeDurationMinutes: row.episodeDurationMinutes,
      pornInvolvementFlag: row.pornInvolvementFlag,
      distressLevel: row.distressLevel,
      sleepEffectIndex: row.sleepEffectIndex,
      focusEffectIndex: row.focusEffectIndex,
      relationshipEffectIndex: row.relationshipEffectIndex,
      previousReductionAttempts: row.previousReductionAttempts,
      confidenceToReduce: row.confidenceToReduce,
      frequencyTarget: row.frequencyTarget,
      timeOfDayPatterns: row.timeOfDayPatterns ?? [],
      values: row.values ?? [],
      triggers: (row.triggers ?? [])
          .map((e) => TriggerType.values.byName(e))
          .toList(),
      reasons: row.reasons ?? [],
      quitDate: row.quitDate,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.UserProfilesCompanion _toCompanion(UserProfile p) {
    return drift_db.UserProfilesCompanion(
      userId: Value(p.userId),
      nickname: Value(p.nickname),
      goalType: Value(p.goalType.name),
      modeLocked: Value(p.modeLocked),
      longestStreakDays: Value(p.longestStreakDays),
      recoveryCount: Value(p.recoveryCount),
      lastLapseAt: Value(p.lastLapseAt),
      cigarettesPerDay: Value(p.cigarettesPerDay),
      cigarettesPerPack: Value(p.cigarettesPerPack),
      costPerPack: Value(p.costPerPack),
      ttfcMinutesIndex: Value(p.ttfcMinutesIndex),
      yearsSmoking: Value(p.yearsSmoking),
      reductionPlanJson: Value(p.reductionPlanJson),
      previousQuitAttempts: Value(p.previousQuitAttempts),
      previousAids: Value(p.previousAids),
      confidenceToQuit: Value(p.confidenceToQuit),
      smokingWindows: Value(p.smokingWindows),
      episodesPerWeek: Value(p.episodesPerWeek),
      episodeDurationMinutes: Value(p.episodeDurationMinutes),
      pornInvolvementFlag: Value(p.pornInvolvementFlag),
      distressLevel: Value(p.distressLevel),
      sleepEffectIndex: Value(p.sleepEffectIndex),
      focusEffectIndex: Value(p.focusEffectIndex),
      relationshipEffectIndex: Value(p.relationshipEffectIndex),
      previousReductionAttempts: Value(p.previousReductionAttempts),
      confidenceToReduce: Value(p.confidenceToReduce),
      frequencyTarget: Value(p.frequencyTarget),
      timeOfDayPatterns: Value(p.timeOfDayPatterns),
      values: Value(p.values),
      triggers: Value(p.triggers.map((e) => e.name).toList()),
      reasons: Value(p.reasons),
      quitDate: Value(p.quitDate),
      createdAt: Value(p.createdAt),
      updatedAt: Value(p.updatedAt),
    );
  }
}

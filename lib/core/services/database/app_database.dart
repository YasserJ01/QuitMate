import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// ─── Type Converters ────────────────────────────────────────────────────────

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return (jsonDecode(fromDb) as List).cast<String>();
  }
  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();
  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return (jsonDecode(fromDb) as List).cast<int>();
  }
  @override
  String toSql(List<int> value) => jsonEncode(value);
}

class TriggerTypeListConverter extends TypeConverter<List<String>, String> {
  const TriggerTypeListConverter();
  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return (jsonDecode(fromDb) as List).cast<String>();
  }
  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class PanicStepListConverter extends TypeConverter<List<Map<String, dynamic>>, String> {
  const PanicStepListConverter();
  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return (jsonDecode(fromDb) as List).cast<Map<String, dynamic>>();
  }
  @override
  String toSql(List<Map<String, dynamic>> value) => jsonEncode(value);
}

// ─── Table Definitions ──────────────────────────────────────────────────────

@DataClassName('DbUserProfile')
class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().unique()();
  TextColumn get nickname => text().nullable()();
  TextColumn get goalType => text()();
  BoolColumn get modeLocked => boolean().withDefault(const Constant(false))();
  IntColumn get longestStreakDays => integer().withDefault(const Constant(0))();
  IntColumn get recoveryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastLapseAt => dateTime().nullable()();

  // Smoking profile
  IntColumn get cigarettesPerDay => integer().nullable()();
  IntColumn get cigarettesPerPack => integer().nullable()();
  RealColumn get costPerPack => real().nullable()();
  IntColumn get ttfcMinutesIndex => integer().nullable()();
  IntColumn get yearsSmoking => integer().nullable()();
  TextColumn get reductionPlanJson => text().nullable()();
  IntColumn get previousQuitAttempts => integer().nullable()();
  TextColumn get previousAids => text().map(const StringListConverter()).nullable()();
  IntColumn get confidenceToQuit => integer().nullable()();
  TextColumn get smokingWindows => text().map(const StringListConverter()).nullable()();

  // Reduction profile
  IntColumn get episodesPerWeek => integer().nullable()();
  IntColumn get episodeDurationMinutes => integer().nullable()();
  BoolColumn get pornInvolvementFlag => boolean().nullable()();
  IntColumn get distressLevel => integer().nullable()();
  IntColumn get sleepEffectIndex => integer().nullable()();
  IntColumn get focusEffectIndex => integer().nullable()();
  IntColumn get relationshipEffectIndex => integer().nullable()();
  IntColumn get previousReductionAttempts => integer().nullable()();
  IntColumn get confidenceToReduce => integer().nullable()();
  IntColumn get frequencyTarget => integer().nullable()();
  TextColumn get timeOfDayPatterns => text().map(const StringListConverter()).nullable()();
  TextColumn get values => text().map(const StringListConverter()).nullable()();

  // Shared
  TextColumn get triggers => text().map(const TriggerTypeListConverter()).nullable()();
  TextColumn get reasons => text().map(const StringListConverter()).nullable()();
  DateTimeColumn get quitDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

@DataClassName('DbLogEntry')
class LogEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get mood => text().nullable()();
  TextColumn get triggers => text().map(const StringListConverter()).nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get quantity => integer().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  IntColumn get intensity => integer().nullable()();
  IntColumn get distressRating => integer().nullable()();
  TextColumn get location => text().nullable()();
  BoolColumn get wasResisted => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  
}

@DataClassName('DbCravingEntry')
class CravingEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get initialIntensity => text()();
  TextColumn get finalIntensity => text().nullable()();
  TextColumn get outcome => text().nullable()();
  TextColumn get triggers => text().map(const StringListConverter()).nullable()();
  TextColumn get copingStrategiesUsed => text().map(const StringListConverter()).nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get location => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  
}

@DataClassName('DbWeeklyReview')
class WeeklyReviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  DateTimeColumn get weekStart => dateTime()();
  IntColumn get checkInsCount => integer()();
  IntColumn get toolkitSessionsCount => integer()();
  IntColumn get cravingsResisted => integer()();
  IntColumn get lapseEvents => integer()();
  TextColumn get topTrigger => text().nullable()();
  TextColumn get mostUsedExercise => text().nullable()();
  TextColumn get motivationalSummary => text().nullable()();
  DateTimeColumn get generatedAt => dateTime()();

  
}

@DataClassName('DbAchievement')
class Achievements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get achievementId => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get iconEmoji => text()();
  TextColumn get category => text()();
  TextColumn get modeFilter => text().nullable()();
  IntColumn get progressValue => integer()();
  IntColumn get progressMax => integer()();
  BoolColumn get isUnlocked => boolean()();
  DateTimeColumn get unlockedAt => dateTime().nullable()();

  
}

@DataClassName('DbBreathingSession')
class BreathingSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get pattern => text()();
  IntColumn get durationSeconds => integer()();
  IntColumn get cyclesCompleted => integer()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get cravingId => integer().nullable()();
  IntColumn get effectivenessRating => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  
}

@DataClassName('DbCbtSession')
class CbtSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get technique => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get thoughtsBefore => text().nullable()();
  TextColumn get thoughtsAfter => text().nullable()();
  TextColumn get consequences => text().nullable()();
  TextColumn get alternativeChosen => text().nullable()();
  IntColumn get cravingId => integer().nullable()();
  BoolColumn get wasHelpful => boolean().nullable()();
  IntColumn get helpfulnessRating => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  
}

@DataClassName('DbGroundingSession')
class GroundingSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get exercise => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get seeItems => text().nullable()();
  TextColumn get touchItems => text().nullable()();
  TextColumn get hearItems => text().nullable()();
  TextColumn get smellItems => text().nullable()();
  TextColumn get tasteItems => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get cravingId => integer().nullable()();
  IntColumn get effectivenessRating => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  
}

@DataClassName('DbDistractionSession')
class DistractionSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get activity => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  BoolColumn get wasEffective => boolean().nullable()();
  IntColumn get effectivenessRating => integer().nullable()();
  IntColumn get cravingId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  
}

@DataClassName('DbToolkitExercise')
class ToolkitExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get exerciseId => text().unique()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastUsedAt => dateTime().nullable()();
  IntColumn get durationEstimateSeconds => integer()();
  BoolColumn get isSharedBothModes => boolean()();
  TextColumn get modeFilter => text().nullable()();
  TextColumn get shortDescription => text()();
  TextColumn get fullInstructions => text()();
  TextColumn get modeSpecificNote => text().nullable()();
  DateTimeColumn get seededAt => dateTime()();

  
}

@DataClassName('DbToolkitSession')
class ToolkitSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get exerciseId => text()();
  TextColumn get exerciseName => text()();
  TextColumn get exerciseCategory => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get feedbackRating => integer().nullable()();
  TextColumn get mode => text()();
  TextColumn get linkedJournalEntryId => text().nullable()();

  
}

@DataClassName('DbJournalEntry')
class JournalEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entryId => text().unique()();
  TextColumn get userId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get content => text()();
  TextColumn get moodTag => text().nullable()();
  TextColumn get sourceExerciseId => text().nullable()();
  TextColumn get sourceExerciseName => text().nullable()();

  
}

@DataClassName('DbScheduledNotification')
class ScheduledNotifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  DateTimeColumn get scheduledTime => dateTime()();
  BoolColumn get isSent => boolean().withDefault(const Constant(false))();
  DateTimeColumn get sentAt => dateTime().nullable()();
  BoolColumn get wasOpened => boolean().withDefault(const Constant(false))();
  DateTimeColumn get openedAt => dateTime().nullable()();
  BoolColumn get wasDismissed => boolean().withDefault(const Constant(false))();
  TextColumn get payload => text().nullable()();
  IntColumn get relatedStreakDays => integer().nullable()();
  IntColumn get relatedMoneySaved => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  
}

@DataClassName('DbNotificationPreference')
class NotificationPreferences extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().unique()();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get frequency => text()();
  BoolColumn get quietHoursEnabled => boolean().withDefault(const Constant(true))();
  IntColumn get quietHoursStart => integer().withDefault(const Constant(22))();
  IntColumn get quietHoursEnd => integer().withDefault(const Constant(8))();
  BoolColumn get dailyCheckInEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get encouragementEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get milestoneEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get cravingTipsEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get microChallengesEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get progressUpdatesEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get streakRemindersEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get healthFactsEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get motivationalQuotesEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get preferredHours => text().map(const IntListConverter()).nullable()();
  DateTimeColumn get permissionDeniedAt => dateTime().nullable()();
  TextColumn get userMode => text().nullable()();
  BoolColumn get quitDatePrepEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

@DataClassName('DbNotificationHistory')
class NotificationHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  DateTimeColumn get sentAt => dateTime()();
  BoolColumn get wasOpened => boolean().withDefault(const Constant(false))();
  DateTimeColumn get openedAt => dateTime().nullable()();

  
}

@DataClassName('DbRelapsePlan')
class RelapsePlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().unique()();
  TextColumn get customSteps => text().map(const StringListConverter()).nullable()();
  TextColumn get panicSteps => text().map(const PanicStepListConverter()).nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get nextReviewDate => dateTime().nullable()();
  TextColumn get personalRecoveryNote => text().nullable()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

@DataClassName('DbRelapseContact')
class RelapseContacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get relationship => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get displayOrder => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  
}

@DataClassName('DbLapseRecoverySession')
class LapseRecoverySessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sessionId => text().unique()();
  TextColumn get userId => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get chosenAction => text().nullable()();
  TextColumn get selectedTriggers => text().map(const StringListConverter()).nullable()();
  BoolColumn get openedToolkit => boolean().withDefault(const Constant(false))();
  BoolColumn get readRecoveryGuide => boolean().withDefault(const Constant(false))();
  TextColumn get recoveryNote => text().nullable()();
  TextColumn get mode => text()();

  
}

// ─── Database Class ─────────────────────────────────────────────────────────

@DriftDatabase(tables: [
  UserProfiles,
  LogEntries,
  CravingEntries,
  WeeklyReviews,
  Achievements,
  BreathingSessions,
  CbtSessions,
  GroundingSessions,
  DistractionSessions,
  ToolkitExercises,
  ToolkitSessions,
  JournalEntries,
  ScheduledNotifications,
  NotificationPreferences,
  NotificationHistory,
  RelapsePlans,
  RelapseContacts,
  LapseRecoverySessions,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static Future<AppDatabase> open() async {
    final db = LazyDatabase(() async {
      final folder = await getApplicationDocumentsDirectory();
      final file = File(p.join(folder.path, 'quitmate.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
    return AppDatabase(db);
  }

  // ── Utility: clear all data ──────────────────────────────────────────────

  Future<void> clearAllData() {
    return transaction(() async {
      await delete(userProfiles).go();
      await delete(logEntries).go();
      await delete(cravingEntries).go();
      await delete(weeklyReviews).go();
      await delete(achievements).go();
      await delete(breathingSessions).go();
      await delete(cbtSessions).go();
      await delete(groundingSessions).go();
      await delete(distractionSessions).go();
      await delete(toolkitExercises).go();
      await delete(toolkitSessions).go();
      await delete(journalEntries).go();
      await delete(scheduledNotifications).go();
      await delete(notificationPreferences).go();
      await delete(notificationHistory).go();
      await delete(relapsePlans).go();
      await delete(relapseContacts).go();
      await delete(lapseRecoverySessions).go();
    });
  }
}

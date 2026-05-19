import 'package:drift/drift.dart' show Value, OrderingTerm, Expression;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../../domain/entities/toolkit_exercise.dart';
import '../../domain/entities/toolkit_session.dart';
import '../../domain/repositories/i_toolkit_repository.dart';

class ToolkitRepositoryImpl implements IToolkitRepository {
  final drift_db.AppDatabase db;

  ToolkitRepositoryImpl(this.db);

  @override
  Future<List<ToolkitExercise>> getAllExercises() async {
    final rows = await db.select(db.toolkitExercises).get();
    return rows.map(_toEntity).toList();
  }

  @override
  Future<List<ToolkitExercise>> getExercisesForMode(String mode) async {
    final rows = await (db.select(db.toolkitExercises)
      ..where((t) => Expression.or([t.isSharedBothModes.equals(true), t.modeFilter.equals(mode)]))).get();
    return rows.map(_toEntity).toList();
  }

  @override
  Stream<List<ToolkitExercise>> watchFavorites(String mode) {
    return (db.select(db.toolkitExercises)
      ..where((t) => t.isFavorite.equals(true)))
        .watch()
        .map((rows) => rows
            .where((m) => m.isSharedBothModes || m.modeFilter == mode)
            .map(_toEntity)
            .toList());
  }

  @override
  Future<List<ToolkitExercise>> getRecentExercises({int limit = 3}) async {
    final rows = await (db.select(db.toolkitExercises)
      ..where((t) => t.lastUsedAt.isNotNull())
      ..orderBy([(t) => OrderingTerm.desc(t.lastUsedAt)])
      ..limit(limit)).get();
    return rows.map(_toEntity).toList();
  }

  @override
  Future<void> toggleFavorite(String exerciseId) async {
    final row = await (db.select(db.toolkitExercises)
        ..where((t) => t.exerciseId.equals(exerciseId))).getSingleOrNull();
    if (row != null) {
      await (db.update(db.toolkitExercises)
          ..where((t) => t.id.equals(row.id))).write(drift_db.ToolkitExercisesCompanion(
        isFavorite: Value(!row.isFavorite),
      ));
    }
  }

  @override
  Future<void> markExerciseUsed(String exerciseId) async {
    final row = await (db.select(db.toolkitExercises)
        ..where((t) => t.exerciseId.equals(exerciseId))).getSingleOrNull();
    if (row != null) {
      await (db.update(db.toolkitExercises)
          ..where((t) => t.id.equals(row.id))).write(drift_db.ToolkitExercisesCompanion(
        lastUsedAt: Value(DateTime.now().toUtc()),
      ));
    }
  }

  @override
  Future<String> startSession({
    required String exerciseId,
    required String userId,
    required String mode,
  }) async {
    final exercise = await (db.select(db.toolkitExercises)
        ..where((t) => t.exerciseId.equals(exerciseId))).getSingleOrNull();

    final companion = drift_db.ToolkitSessionsCompanion(
      userId: Value(userId),
      exerciseId: Value(exerciseId),
      exerciseName: Value(exercise?.name ?? 'Unknown'),
      exerciseCategory: Value(exercise?.category ?? 'unknown'),
      startedAt: Value(DateTime.now().toUtc()),
      mode: Value(mode),
    );

    final id = await db.into(db.toolkitSessions).insert(companion);
    return id.toString();
  }

  @override
  Future<void> endSession({
    required String sessionId,
    required bool completed,
  }) async {
    final id = int.tryParse(sessionId);
    if (id == null) return;

    await (db.update(db.toolkitSessions)
        ..where((t) => t.id.equals(id))).write(drift_db.ToolkitSessionsCompanion(
      completedAt: completed ? Value(DateTime.now().toUtc()) : const Value(null),
    ));
  }

  @override
  Future<void> recordFeedback({
    required String sessionId,
    required int rating,
  }) async {
    final id = int.tryParse(sessionId);
    if (id == null) return;

    await (db.update(db.toolkitSessions)
        ..where((t) => t.id.equals(id))).write(drift_db.ToolkitSessionsCompanion(
      feedbackRating: Value(rating),
    ));
  }

  @override
  Future<List<ToolkitSession>> getSessionsForUser(
    String userId, {
    DateTime? since,
    int? limit,
  }) async {
    final q = db.select(db.toolkitSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startedAt)]);
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (since != null) {
      rows = rows.where((r) => !r.startedAt.isBefore(since)).toList();
    }
    return rows.map(_sessionToEntity).toList();
  }

  @override
  Future<List<ToolkitSession>> getRecentSessions({
    required String userId,
    int days = 7,
  }) async {
    final since = DateTime.now().toUtc().subtract(Duration(days: days));
    final q = db.select(db.toolkitSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startedAt)]);
    var rows = await q.get();
    rows = rows.where((r) => !r.startedAt.isBefore(since)).toList();
    return rows.map(_sessionToEntity).toList();
  }

  @override
  Future<Map<String, dynamic>> getWeeklySummary({
    required String userId,
  }) async {
    final sessions = await getRecentSessions(userId: userId, days: 7);

    final completedSessions = sessions.where((s) => s.wasCompleted).toList();
    final exerciseNames = sessions.map((s) => s.exerciseName).toSet().toList();

    final exerciseCounts = <String, int>{};
    for (final session in sessions) {
      exerciseCounts[session.exerciseName] =
          (exerciseCounts[session.exerciseName] ?? 0) + 1;
    }
    String? mostUsed;
    int maxCount = 0;
    for (final entry in exerciseCounts.entries) {
      if (entry.value > maxCount) {
        maxCount = entry.value;
        mostUsed = entry.key;
      }
    }

    double avgRating = 0;
    final ratedSessions =
        completedSessions.where((s) => s.feedbackRating != null).toList();
    if (ratedSessions.isNotEmpty) {
      avgRating = ratedSessions
              .map((s) => s.feedbackRating!)
              .reduce((a, b) => a + b) /
          ratedSessions.length;
    }

    return {
      'totalSessionsThisWeek': sessions.length,
      'completedSessionsThisWeek': completedSessions.length,
      'mostUsedExercise': mostUsed ?? 'None',
      'exercisesUsed': exerciseNames,
      'averageFeedbackRating': avgRating,
    };
  }

  ToolkitExercise _toEntity(drift_db.DbToolkitExercise m) => ToolkitExercise(
        id: m.exerciseId,
        name: m.name,
        category: ExerciseCategory.values.firstWhere(
          (c) => c.name == m.category,
          orElse: () => ExerciseCategory.breathing,
        ),
        durationEstimateSeconds: m.durationEstimateSeconds,
        isSharedBothModes: m.isSharedBothModes,
        modeFilter: m.modeFilter,
        isFavorite: m.isFavorite,
        lastUsedAt: m.lastUsedAt,
        shortDescription: m.shortDescription,
        fullInstructions: m.fullInstructions,
        modeSpecificNote: m.modeSpecificNote,
      );

  ToolkitSession _sessionToEntity(drift_db.DbToolkitSession m) => ToolkitSession(
        id: m.id.toString(),
        exerciseId: m.exerciseId,
        exerciseName: m.exerciseName,
        exerciseCategory: m.exerciseCategory,
        startedAt: m.startedAt,
        completedAt: m.completedAt,
        feedbackRating: m.feedbackRating,
        mode: m.mode,
        linkedJournalEntryId: m.linkedJournalEntryId,
      );
}

import 'package:drift/drift.dart' show Value, OrderingTerm, Expression;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../../domain/entities/toolkit_exercise.dart';
import '../../domain/entities/toolkit_session.dart';
import '../../domain/entities/toolkit_statistics.dart';
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

  @override
  Future<ToolkitStatistics> calculateStatistics(String userId) async {
    final sessions = await getSessionsForUser(userId);

    if (sessions.isEmpty) {
      // Still surface cravings-resisted-with-toolkit even with no sessions.
      final resisted = await _cravingsResistedWithToolkit(userId);
      if (resisted == 0) return ToolkitStatistics.empty();
      return ToolkitStatistics(
        byCategory: const {},
        totalSessions: 0,
        completedSessions: 0,
        mostEffectiveCategory: null,
        cravingsResistedWithToolkit: resisted,
      );
    }

    // Group sessions by their exercise category. Unknown categories are
    // skipped defensively rather than crashing the whole stats screen.
    final grouped = <ExerciseCategory, List<ToolkitSession>>{};
    for (final s in sessions) {
      final category = _categoryFromName(s.exerciseCategory);
      if (category == null) continue;
      grouped.putIfAbsent(category, () => []).add(s);
    }

    final byCategory = <ExerciseCategory, CategoryStat>{};
    for (final entry in grouped.entries) {
      final list = entry.value;
      final completed = list.where((s) => s.wasCompleted).length;

      final rated =
          list.where((s) => s.feedbackRating != null).map((s) => s.feedbackRating!);
      final averageRating = rated.isEmpty
          ? 0.0
          : rated.reduce((a, b) => a + b) / rated.length;

      final usage = <String, int>{};
      for (final s in list) {
        usage[s.exerciseName] = (usage[s.exerciseName] ?? 0) + 1;
      }

      byCategory[entry.key] = CategoryStat(
        category: entry.key,
        total: list.length,
        completed: completed,
        averageRating: averageRating,
        exerciseUsage: usage,
      );
    }

    // Most effective = highest average rating among categories that have at
    // least one rated session.
    ExerciseCategory? mostEffective;
    double highest = 0;
    for (final stat in byCategory.values) {
      if (stat.averageRating > highest) {
        highest = stat.averageRating;
        mostEffective = stat.category;
      }
    }

    return ToolkitStatistics(
      byCategory: byCategory,
      totalSessions: sessions.length,
      completedSessions: sessions.where((s) => s.wasCompleted).length,
      mostEffectiveCategory: mostEffective,
      cravingsResistedWithToolkit: await _cravingsResistedWithToolkit(userId),
    );
  }

  Future<int> _cravingsResistedWithToolkit(String userId) async {
    final cravingRows = await (db.select(db.cravingEntries)
          ..where((t) => t.userId.equals(userId)))
        .get();
    return cravingRows
        .where((r) => (r.copingStrategiesUsed?.isNotEmpty ?? false))
        .length;
  }

  ExerciseCategory? _categoryFromName(String name) {
    for (final c in ExerciseCategory.values) {
      if (c.name == name) return c;
    }
    return null;
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

import 'package:isar/isar.dart';

import '../../../../core/services/database/isar_service.dart';
import '../../domain/entities/toolkit_exercise.dart';
import '../../domain/entities/toolkit_session.dart';
import '../../domain/repositories/i_toolkit_repository.dart';
import '../models/toolkit_exercise_model.dart';
import '../models/toolkit_session_model.dart';

class ToolkitRepositoryImpl implements IToolkitRepository {
  Future<Isar> get _db async => await IsarService.instance;

  // ── Exercise catalogue ──────────────────────────────────────────────────

  @override
  Future<List<ToolkitExercise>> getAllExercises() async {
    final isar = await _db;
    final models = await isar.toolkitExerciseModels.where().findAll();
    return models.map(_toEntity).toList();
  }

  @override
  Future<List<ToolkitExercise>> getExercisesForMode(String mode) async {
    final isar = await _db;
    final models = await isar.toolkitExerciseModels
        .filter()
        .isSharedBothModesEqualTo(true)
        .or()
        .modeFilterEqualTo(mode)
        .findAll();
    return models.map(_toEntity).toList();
  }

  @override
  Stream<List<ToolkitExercise>> watchFavorites(String mode) {
    // Isar watch on favorites — filters in-memory for mode
    return _db.asStream().asyncMap((isar) async {
      final models = await isar.toolkitExerciseModels
          .filter()
          .isFavoriteEqualTo(true)
          .findAll();
      return models
          .where((m) => m.isSharedBothModes || m.modeFilter == mode)
          .map(_toEntity)
          .toList();
    });
  }

  @override
  Future<List<ToolkitExercise>> getRecentExercises({int limit = 3}) async {
    final isar = await _db;
    final models = await isar.toolkitExerciseModels
        .filter()
        .lastUsedAtIsNotNull()
        .sortByLastUsedAtDesc()
        .limit(limit)
        .findAll();
    return models.map(_toEntity).toList();
  }

  @override
  Future<void> toggleFavorite(String exerciseId) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.toolkitExerciseModels
          .filter()
          .exerciseIdEqualTo(exerciseId)
          .findFirst();
      if (model != null) {
        model.isFavorite = !model.isFavorite;
        await isar.toolkitExerciseModels.put(model);
      }
    });
  }

  @override
  Future<void> markExerciseUsed(String exerciseId) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.toolkitExerciseModels
          .filter()
          .exerciseIdEqualTo(exerciseId)
          .findFirst();
      if (model != null) {
        model.lastUsedAt = DateTime.now().toUtc();
        await isar.toolkitExerciseModels.put(model);
      }
    });
  }

  // ── Sessions ────────────────────────────────────────────────────────────

  @override
  Future<String> startSession({
    required String exerciseId,
    required String userId,
    required String mode,
  }) async {
    final isar = await _db;
    final exercise = await isar.toolkitExerciseModels
        .filter()
        .exerciseIdEqualTo(exerciseId)
        .findFirst();

    final model = ToolkitSessionModel()
      ..userId = userId
      ..exerciseId = exerciseId
      ..exerciseName = exercise?.name ?? 'Unknown'
      ..exerciseCategory = exercise?.category ?? 'unknown'
      ..startedAt = DateTime.now().toUtc()
      ..mode = mode;

    await isar.writeTxn(() => isar.toolkitSessionModels.put(model));
    return model.id.toString();
  }

  @override
  Future<void> endSession({
    required String sessionId,
    required bool completed,
  }) async {
    final isar = await _db;
    final id = int.tryParse(sessionId);
    if (id == null) return;

    await isar.writeTxn(() async {
      final model = await isar.toolkitSessionModels.get(id);
      if (model != null) {
        model.completedAt = completed ? DateTime.now().toUtc() : null;
        await isar.toolkitSessionModels.put(model);
      }
    });
  }

  @override
  Future<void> recordFeedback({
    required String sessionId,
    required int rating,
  }) async {
    final isar = await _db;
    final id = int.tryParse(sessionId);
    if (id == null) return;

    await isar.writeTxn(() async {
      final model = await isar.toolkitSessionModels.get(id);
      if (model != null) {
        model.feedbackRating = rating;
        await isar.toolkitSessionModels.put(model);
      }
    });
  }

  @override
  Future<List<ToolkitSession>> getSessionsForUser(
    String userId, {
    DateTime? since,
    int? limit,
  }) async {
    final isar = await _db;
    // Use dynamic to bypass Isar's type-state QueryBuilder — the generic
    // parameter changes after .sortBy*() / .filter() / .limit().
    dynamic query = isar.toolkitSessionModels
        .filter()
        .userIdEqualTo(userId)
        .sortByStartedAtDesc();

    if (since != null) {
      query = query.filter().startedAtGreaterThan(since);
    }
    if (limit != null) {
      query = query.limit(limit);
    }

    final models = await query.findAll();
    return models.map(_sessionToEntity).toList();
  }

  // ── Mappers ─────────────────────────────────────────────────────────────

  ToolkitExercise _toEntity(ToolkitExerciseModel m) => ToolkitExercise(
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

  ToolkitSession _sessionToEntity(ToolkitSessionModel m) => ToolkitSession(
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
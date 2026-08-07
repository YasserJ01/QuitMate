import 'package:drift/drift.dart' show Value, OrderingTerm;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../models/toolkit_models.dart';

class ToolkitRepository {
  final drift_db.AppDatabase db;

  ToolkitRepository(this.db);

  // ============= BREATHING SESSIONS =============

  Future<BreathingSession> addBreathingSession(BreathingSession session) async {
    final companion = _breathingToCompanion(session);
    final id = await db.into(db.breathingSessions).insert(companion);
    return session.copyWith(id: id);
  }

  Future<List<BreathingSession>> getBreathingSessions(
    String userId, {
    DateTime? startDate,
    int? limit,
  }) async {
    final q = db.select(db.breathingSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.startTime.isBefore(startDate)).toList();
    }
    return rows.map(_breathingFromRow).toList();
  }

  Future<void> updateBreathingSession(BreathingSession session) async {
    final companion = _breathingToCompanion(session);
    await (db.update(db.breathingSessions)
        ..where((t) => t.id.equals(session.id))).write(companion);
  }

  // ============= CBT SESSIONS =============

  Future<CbtSession> addCbtSession(CbtSession session) async {
    final companion = _cbtToCompanion(session);
    final id = await db.into(db.cbtSessions).insert(companion);
    return session.copyWith(id: id);
  }

  Future<List<CbtSession>> getCbtSessions(
    String userId, {
    DateTime? startDate,
    int? limit,
  }) async {
    final q = db.select(db.cbtSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.startTime.isBefore(startDate)).toList();
    }
    return rows.map(_cbtFromRow).toList();
  }

  Future<void> updateCbtSession(CbtSession session) async {
    final companion = _cbtToCompanion(session);
    await (db.update(db.cbtSessions)
        ..where((t) => t.id.equals(session.id))).write(companion);
  }

  // ============= GROUNDING SESSIONS =============

  Future<GroundingSession> addGroundingSession(GroundingSession session) async {
    final companion = _groundingToCompanion(session);
    final id = await db.into(db.groundingSessions).insert(companion);
    return session.copyWith(id: id);
  }

  Future<List<GroundingSession>> getGroundingSessions(
    String userId, {
    DateTime? startDate,
    int? limit,
  }) async {
    final q = db.select(db.groundingSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.startTime.isBefore(startDate)).toList();
    }
    return rows.map(_groundingFromRow).toList();
  }

  Future<void> updateGroundingSession(GroundingSession session) async {
    final companion = _groundingToCompanion(session);
    await (db.update(db.groundingSessions)
        ..where((t) => t.id.equals(session.id))).write(companion);
  }

  // ============= DISTRACTION SESSIONS =============

  Future<DistractionSession> addDistractionSession(
      DistractionSession session) async {
    final companion = _distractionToCompanion(session);
    final id = await db.into(db.distractionSessions).insert(companion);
    return session.copyWith(id: id);
  }

  Future<List<DistractionSession>> getDistractionSessions(
    String userId, {
    DateTime? startDate,
    int? limit,
  }) async {
    final q = db.select(db.distractionSessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.startTime.isBefore(startDate)).toList();
    }
    return rows.map(_distractionFromRow).toList();
  }

  Future<void> updateDistractionSession(DistractionSession session) async {
    final companion = _distractionToCompanion(session);
    await (db.update(db.distractionSessions)
        ..where((t) => t.id.equals(session.id))).write(companion);
  }

  // ============= STATISTICS =============
  //
  // Toolkit statistics are now computed from the unified ToolkitSessions table
  // by ToolkitRepositoryImpl.calculateStatistics — the single source of truth
  // across all exercise types. The legacy per-type aggregation that lived here
  // only saw grounding/CBT sessions and has been removed.

  // ── Mappers ──────────────────────────────────────────────────────────────

  BreathingSession _breathingFromRow(drift_db.DbBreathingSession row) {
    return BreathingSession(
      id: row.id,
      userId: row.userId,
      pattern: BreathingPattern.values.byName(row.pattern),
      durationSeconds: row.durationSeconds,
      cyclesCompleted: row.cyclesCompleted,
      startTime: row.startTime,
      endTime: row.endTime,
      cravingId: row.cravingId,
      effectivenessRating: row.effectivenessRating,
      createdAt: row.createdAt,
    );
  }

  drift_db.BreathingSessionsCompanion _breathingToCompanion(BreathingSession s) {
    return drift_db.BreathingSessionsCompanion(
      userId: Value(s.userId),
      pattern: Value(s.pattern.name),
      durationSeconds: Value(s.durationSeconds),
      cyclesCompleted: Value(s.cyclesCompleted),
      startTime: Value(s.startTime),
      endTime: Value(s.endTime),
      cravingId: Value(s.cravingId),
      effectivenessRating: Value(s.effectivenessRating),
      createdAt: Value(s.createdAt),
    );
  }

  CbtSession _cbtFromRow(drift_db.DbCbtSession row) {
    return CbtSession(
      id: row.id,
      userId: row.userId,
      technique: CbtTechnique.values.byName(row.technique),
      startTime: row.startTime,
      endTime: row.endTime,
      thoughtsBefore: row.thoughtsBefore,
      thoughtsAfter: row.thoughtsAfter,
      consequences: row.consequences,
      alternativeChosen: row.alternativeChosen,
      cravingId: row.cravingId,
      wasHelpful: row.wasHelpful,
      helpfulnessRating: row.helpfulnessRating,
      createdAt: row.createdAt,
    );
  }

  drift_db.CbtSessionsCompanion _cbtToCompanion(CbtSession s) {
    return drift_db.CbtSessionsCompanion(
      userId: Value(s.userId),
      technique: Value(s.technique.name),
      startTime: Value(s.startTime),
      endTime: Value(s.endTime),
      thoughtsBefore: Value(s.thoughtsBefore),
      thoughtsAfter: Value(s.thoughtsAfter),
      consequences: Value(s.consequences),
      alternativeChosen: Value(s.alternativeChosen),
      cravingId: Value(s.cravingId),
      wasHelpful: Value(s.wasHelpful),
      helpfulnessRating: Value(s.helpfulnessRating),
      createdAt: Value(s.createdAt),
    );
  }

  GroundingSession _groundingFromRow(drift_db.DbGroundingSession row) {
    return GroundingSession(
      id: row.id,
      userId: row.userId,
      exercise: GroundingExercise.values.byName(row.exercise),
      startTime: row.startTime,
      endTime: row.endTime,
      seeItems: row.seeItems,
      touchItems: row.touchItems,
      hearItems: row.hearItems,
      smellItems: row.smellItems,
      tasteItems: row.tasteItems,
      notes: row.notes,
      cravingId: row.cravingId,
      effectivenessRating: row.effectivenessRating,
      createdAt: row.createdAt,
    );
  }

  drift_db.GroundingSessionsCompanion _groundingToCompanion(GroundingSession s) {
    return drift_db.GroundingSessionsCompanion(
      userId: Value(s.userId),
      exercise: Value(s.exercise.name),
      startTime: Value(s.startTime),
      endTime: Value(s.endTime),
      seeItems: Value(s.seeItems),
      touchItems: Value(s.touchItems),
      hearItems: Value(s.hearItems),
      smellItems: Value(s.smellItems),
      tasteItems: Value(s.tasteItems),
      notes: Value(s.notes),
      cravingId: Value(s.cravingId),
      effectivenessRating: Value(s.effectivenessRating),
      createdAt: Value(s.createdAt),
    );
  }

  DistractionSession _distractionFromRow(drift_db.DbDistractionSession row) {
    return DistractionSession(
      id: row.id,
      userId: row.userId,
      activity: DistractionActivity.values.byName(row.activity),
      startTime: row.startTime,
      endTime: row.endTime,
      wasEffective: row.wasEffective,
      effectivenessRating: row.effectivenessRating,
      cravingId: row.cravingId,
      createdAt: row.createdAt,
    );
  }

  drift_db.DistractionSessionsCompanion _distractionToCompanion(DistractionSession s) {
    return drift_db.DistractionSessionsCompanion(
      userId: Value(s.userId),
      activity: Value(s.activity.name),
      startTime: Value(s.startTime),
      endTime: Value(s.endTime),
      wasEffective: Value(s.wasEffective),
      effectivenessRating: Value(s.effectivenessRating),
      cravingId: Value(s.cravingId),
      createdAt: Value(s.createdAt),
    );
  }
}

extension on BreathingSession {
  BreathingSession copyWith({int? id}) => BreathingSession(
        id: id ?? this.id,
        userId: userId,
        pattern: pattern,
        durationSeconds: durationSeconds,
        cyclesCompleted: cyclesCompleted,
        startTime: startTime,
        endTime: endTime,
        cravingId: cravingId,
        effectivenessRating: effectivenessRating,
        createdAt: createdAt,
      );
}

extension on CbtSession {
  CbtSession copyWith({int? id}) => CbtSession(
        id: id ?? this.id,
        userId: userId,
        technique: technique,
        startTime: startTime,
        endTime: endTime,
        thoughtsBefore: thoughtsBefore,
        thoughtsAfter: thoughtsAfter,
        consequences: consequences,
        alternativeChosen: alternativeChosen,
        cravingId: cravingId,
        wasHelpful: wasHelpful,
        helpfulnessRating: helpfulnessRating,
        createdAt: createdAt,
      );
}

extension on GroundingSession {
  GroundingSession copyWith({int? id}) => GroundingSession(
        id: id ?? this.id,
        userId: userId,
        exercise: exercise,
        startTime: startTime,
        endTime: endTime,
        seeItems: seeItems,
        touchItems: touchItems,
        hearItems: hearItems,
        smellItems: smellItems,
        tasteItems: tasteItems,
        notes: notes,
        cravingId: cravingId,
        effectivenessRating: effectivenessRating,
        createdAt: createdAt,
      );
}

extension on DistractionSession {
  DistractionSession copyWith({int? id}) => DistractionSession(
        id: id ?? this.id,
        userId: userId,
        activity: activity,
        startTime: startTime,
        endTime: endTime,
        wasEffective: wasEffective,
        effectivenessRating: effectivenessRating,
        cravingId: cravingId,
        createdAt: createdAt,
      );
}

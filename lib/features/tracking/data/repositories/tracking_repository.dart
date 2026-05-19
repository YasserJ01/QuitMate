import 'package:drift/drift.dart' show Value, OrderingTerm;
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../models/log_entry.dart';
import '../models/craving_entry.dart';

class TrackingRepository {
  final drift_db.AppDatabase db;

  TrackingRepository(this.db);

  // ============= LOG ENTRIES =============

  Future<LogEntry> addLogEntry(LogEntry entry) async {
    final companion = _logEntryToCompanion(entry);
    final id = await db.into(db.logEntries).insert(companion);
    return entry.copyWith(id: id);
  }

  Future<List<LogEntry>> getLogEntries(
    String userId, {
    LogType? type,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    final q = db.select(db.logEntries);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.timestamp)]);
    if (type != null) {
      q.where((t) => t.type.equals(type.name));
    }
    if (limit != null) {
      q.limit(limit);
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.timestamp.isBefore(startDate)).toList();
    }
    if (endDate != null) {
      rows = rows.where((r) => r.timestamp.isBefore(endDate)).toList();
    }
    return rows.map(_logEntryFromRow).toList();
  }

  Future<LogEntry?> getLogEntry(int id) async {
    final row = await (db.select(db.logEntries)
        ..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _logEntryFromRow(row);
  }

  Future<void> updateLogEntry(LogEntry entry) async {
    entry.updatedAt = DateTime.now();
    final companion = _logEntryToCompanion(entry);
    await (db.update(db.logEntries)
        ..where((t) => t.id.equals(entry.id))).write(companion);
  }

  Future<void> deleteLogEntry(int id) async {
    await (db.delete(db.logEntries)
        ..where((t) => t.id.equals(id))).go();
  }

  Future<int> getLogCountForDate(
    String userId,
    DateTime date, {
    LogType? type,
  }) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final q = db.select(db.logEntries);
    q.where((t) => t.userId.equals(userId));
    if (type != null) {
      q.where((t) => t.type.equals(type.name));
    }
    var rows = await q.get();
    rows = rows.where((r) => !r.timestamp.isBefore(startOfDay) && r.timestamp.isBefore(endOfDay)).toList();
    return rows.length;
  }

  Future<List<LogEntry>> getLogsForToday(String userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    return await getLogEntries(userId, startDate: startOfDay);
  }

  // ============= CRAVING ENTRIES =============

  Future<CravingEntry> addCravingEntry(CravingEntry entry) async {
    final companion = _cravingEntryToCompanion(entry);
    final id = await db.into(db.cravingEntries).insert(companion);
    return entry.copyWith(id: id);
  }

  Future<List<CravingEntry>> getCravingEntries(
    String userId, {
    DateTime? startDate,
    DateTime? endDate,
    bool? onlyOngoing,
  }) async {
    final q = db.select(db.cravingEntries);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startTime)]);
    if (onlyOngoing == true) {
      q.where((t) => t.endTime.isNull());
    }
    var rows = await q.get();
    if (startDate != null) {
      rows = rows.where((r) => !r.startTime.isBefore(startDate)).toList();
    }
    if (endDate != null) {
      rows = rows.where((r) => r.startTime.isBefore(endDate)).toList();
    }
    return rows.map(_cravingEntryFromRow).toList();
  }

  Future<CravingEntry?> getCravingEntry(int id) async {
    final row = await (db.select(db.cravingEntries)
        ..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _cravingEntryFromRow(row);
  }

  Future<void> updateCravingEntry(CravingEntry entry) async {
    entry.updatedAt = DateTime.now();
    final companion = _cravingEntryToCompanion(entry);
    await (db.update(db.cravingEntries)
        ..where((t) => t.id.equals(entry.id))).write(companion);
  }

  Future<void> deleteCravingEntry(int id) async {
    await (db.delete(db.cravingEntries)
        ..where((t) => t.id.equals(id))).go();
  }

  Future<CravingEntry?> getOngoingCraving(String userId) async {
    final entries = await getCravingEntries(userId, onlyOngoing: true);
    return entries.isNotEmpty ? entries.first : null;
  }

  Future<int> getCravingsResistedCount(
    String userId, {
    DateTime? startDate,
  }) async {
    final entries = await getCravingEntries(userId, startDate: startDate);
    return entries.where((e) => e.wasSuccessfullyResisted).length;
  }

  // ============= BULK OPERATIONS =============

  Future<void> deleteAllEntriesForUser(String userId) async {
    await db.transaction(() async {
      await (db.delete(db.logEntries)
          ..where((t) => t.userId.equals(userId))).go();
      await (db.delete(db.cravingEntries)
          ..where((t) => t.userId.equals(userId))).go();
    });
  }

  Future<Map<String, dynamic>> exportData(String userId) async {
    final logs = await getLogEntries(userId);
    final cravings = await getCravingEntries(userId);

    return {
      'exportDate': DateTime.now().toIso8601String(),
      'userId': userId,
      'logs': logs.map((e) => _logEntryToMap(e)).toList(),
      'cravings': cravings.map((e) => _cravingEntryToMap(e)).toList(),
    };
  }

  // ── Mappers ──────────────────────────────────────────────────────────────

  LogEntry _logEntryFromRow(drift_db.DbLogEntry row) {
    return LogEntry(
      id: row.id,
      userId: row.userId,
      type: LogType.values.byName(row.type),
      timestamp: row.timestamp,
      mood: row.mood != null ? MoodType.values.byName(row.mood!) : null,
      triggers: row.triggers ?? [],
      notes: row.notes,
      quantity: row.quantity,
      durationSeconds: row.durationSeconds,
      intensity: row.intensity,
      distressRating: row.distressRating,
      location: row.location,
      wasResisted: row.wasResisted,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.LogEntriesCompanion _logEntryToCompanion(LogEntry e) {
    return drift_db.LogEntriesCompanion(
      userId: Value(e.userId),
      type: Value(e.type.name),
      timestamp: Value(e.timestamp),
      mood: Value(e.mood?.name),
      triggers: Value(e.triggers),
      notes: Value(e.notes),
      quantity: Value(e.quantity),
      durationSeconds: Value(e.durationSeconds),
      intensity: Value(e.intensity),
      distressRating: Value(e.distressRating),
      location: Value(e.location),
      wasResisted: Value(e.wasResisted),
      createdAt: Value(e.createdAt),
      updatedAt: Value(e.updatedAt),
    );
  }

  CravingEntry _cravingEntryFromRow(drift_db.DbCravingEntry row) {
    return CravingEntry(
      id: row.id,
      userId: row.userId,
      startTime: row.startTime,
      endTime: row.endTime,
      initialIntensity: CravingIntensity.values.byName(row.initialIntensity),
      finalIntensity: row.finalIntensity != null
          ? CravingIntensity.values.byName(row.finalIntensity!)
          : null,
      outcome: row.outcome != null
          ? CravingOutcome.values.byName(row.outcome!)
          : null,
      triggers: row.triggers ?? [],
      copingStrategiesUsed: row.copingStrategiesUsed ?? [],
      notes: row.notes,
      location: row.location,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.CravingEntriesCompanion _cravingEntryToCompanion(CravingEntry e) {
    return drift_db.CravingEntriesCompanion(
      userId: Value(e.userId),
      startTime: Value(e.startTime),
      endTime: Value(e.endTime),
      initialIntensity: Value(e.initialIntensity.name),
      finalIntensity: Value(e.finalIntensity?.name),
      outcome: Value(e.outcome?.name),
      triggers: Value(e.triggers),
      copingStrategiesUsed: Value(e.copingStrategiesUsed),
      notes: Value(e.notes),
      location: Value(e.location),
      createdAt: Value(e.createdAt),
      updatedAt: Value(e.updatedAt),
    );
  }

  Map<String, dynamic> _logEntryToMap(LogEntry entry) {
    return {
      'id': entry.id,
      'type': entry.type.name,
      'timestamp': entry.timestamp.toIso8601String(),
      'mood': entry.mood?.name,
      'triggers': entry.triggers,
      'notes': entry.notes,
      'quantity': entry.quantity,
      'durationSeconds': entry.durationSeconds,
      'intensity': entry.intensity,
      'location': entry.location,
      'wasResisted': entry.wasResisted,
    };
  }

  Map<String, dynamic> _cravingEntryToMap(CravingEntry entry) {
    return {
      'id': entry.id,
      'startTime': entry.startTime.toIso8601String(),
      'endTime': entry.endTime?.toIso8601String(),
      'initialIntensity': entry.initialIntensity.name,
      'finalIntensity': entry.finalIntensity?.name,
      'outcome': entry.outcome?.name,
      'triggers': entry.triggers,
      'copingStrategies': entry.copingStrategiesUsed,
      'notes': entry.notes,
      'location': entry.location,
      'duration': entry.durationMinutes,
    };
  }
}

extension on LogEntry {
  LogEntry copyWith({int? id}) {
    return LogEntry(
      id: id ?? this.id,
      userId: userId,
      type: type,
      timestamp: timestamp,
      mood: mood,
      triggers: triggers,
      notes: notes,
      quantity: quantity,
      durationSeconds: durationSeconds,
      intensity: intensity,
      distressRating: distressRating,
      location: location,
      wasResisted: wasResisted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension on CravingEntry {
  CravingEntry copyWith({int? id}) {
    return CravingEntry(
      id: id ?? this.id,
      userId: userId,
      startTime: startTime,
      endTime: endTime,
      initialIntensity: initialIntensity,
      finalIntensity: finalIntensity,
      outcome: outcome,
      triggers: triggers,
      copingStrategiesUsed: copingStrategiesUsed,
      notes: notes,
      location: location,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

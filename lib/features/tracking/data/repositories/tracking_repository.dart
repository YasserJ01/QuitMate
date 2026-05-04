import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../models/log_entry.dart';
import '../models/craving_entry.dart';

class TrackingRepository {
  // ============= LOG ENTRIES =============

  Future<LogEntry> addLogEntry(LogEntry entry) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.logEntrys.put(entry);
    });
    return entry;
  }

  Future<List<LogEntry>> getLogEntries(
      String userId, {
        LogType? type,
        DateTime? startDate,
        DateTime? endDate,
        int? limit,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.logEntrys.filter().userIdEqualTo(userId);

    if (type != null) {
      query = query.typeEqualTo(type);
    }

    if (startDate != null) {
      query = query.timestampGreaterThan(startDate);
    }

    if (endDate != null) {
      query = query.timestampLessThan(endDate);
    }

    var results = query.sortByTimestampDesc();

    if (limit != null) {
      return await results.limit(limit).findAll();
    }

    return await results.findAll();
  }

  Future<LogEntry?> getLogEntry(int id) async {
    final isar = await IsarService.instance;
    return await isar.logEntrys.get(id);
  }

  Future<void> updateLogEntry(LogEntry entry) async {
    final isar = await IsarService.instance;
    entry.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.logEntrys.put(entry);
    });
  }

  Future<void> deleteLogEntry(int id) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.logEntrys.delete(id);
    });
  }

  Future<int> getLogCountForDate(
      String userId,
      DateTime date, {
        LogType? type,
      }) async {
    final isar = await IsarService.instance;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    var query = isar.logEntrys
        .filter()
        .userIdEqualTo(userId)
        .timestampBetween(startOfDay, endOfDay);

    if (type != null) {
      query = query.typeEqualTo(type);
    }

    return await query.count();
  }

  Future<List<LogEntry>> getLogsForToday(String userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    return await getLogEntries(
      userId,
      startDate: startOfDay,
    );
  }

  // ============= CRAVING ENTRIES =============

  Future<CravingEntry> addCravingEntry(CravingEntry entry) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.cravingEntrys.put(entry);
    });
    return entry;
  }

  Future<List<CravingEntry>> getCravingEntries(
      String userId, {
        DateTime? startDate,
        DateTime? endDate,
        bool? onlyOngoing,
      }) async {
    final isar = await IsarService.instance;

    var query = isar.cravingEntrys.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.startTimeGreaterThan(startDate);
    }

    if (endDate != null) {
      query = query.startTimeLessThan(endDate);
    }

    if (onlyOngoing == true) {
      query = query.endTimeIsNull();
    }

    return await query.sortByStartTimeDesc().findAll();
  }

  Future<CravingEntry?> getCravingEntry(int id) async {
    final isar = await IsarService.instance;
    return await isar.cravingEntrys.get(id);
  }

  Future<void> updateCravingEntry(CravingEntry entry) async {
    final isar = await IsarService.instance;
    entry.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.cravingEntrys.put(entry);
    });
  }

  Future<void> deleteCravingEntry(int id) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.cravingEntrys.delete(id);
    });
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
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.logEntrys.filter().userIdEqualTo(userId).deleteAll();
      await isar.cravingEntrys.filter().userIdEqualTo(userId).deleteAll();
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
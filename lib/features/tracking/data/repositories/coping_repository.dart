import 'package:drift/drift.dart' as drift;
import '../../../../core/services/database/app_database.dart';
import '../../../../core/services/database/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final copingRepositoryProvider = Provider<CopingRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CopingRepository(db);
});

class CopingVictoryData {
  final String userId;
  final DateTime timestamp;
  final int intensityBefore;
  final int intensityAfter;
  final String moodAfter;
  final String strategyType;
  final String strategyValue;
  final String? customStrategy;
  final String? contactName;
  final String? contactPhone;

  const CopingVictoryData({
    required this.userId,
    required this.timestamp,
    required this.intensityBefore,
    required this.intensityAfter,
    required this.moodAfter,
    required this.strategyType,
    required this.strategyValue,
    this.customStrategy,
    this.contactName,
    this.contactPhone,
  });
}

class CopingRepository {
  final AppDatabase _db;

  CopingRepository(this._db);

  Future<int> saveVictory(CopingVictoryData data) {
    return _db.into(_db.copingVictories).insert(CopingVictoriesCompanion(
      userId: drift.Value(data.userId),
      timestamp: drift.Value(data.timestamp),
      intensityBefore: drift.Value(data.intensityBefore),
      intensityAfter: drift.Value(data.intensityAfter),
      moodAfter: drift.Value(data.moodAfter),
      strategyType: drift.Value(data.strategyType),
      strategyValue: drift.Value(data.strategyValue),
      customStrategy: drift.Value(data.customStrategy),
      contactName: drift.Value(data.contactName),
      contactPhone: drift.Value(data.contactPhone),
      createdAt: drift.Value(DateTime.now()),
    ));
  }

  Future<List<DbCopingVictory>> getVictories(String userId) {
    return (_db.select(_db.copingVictories)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => drift.OrderingTerm.desc(t.timestamp)]))
        .get();
  }

  Stream<List<DbCopingVictory>> watchVictories(String userId) {
    return (_db.select(_db.copingVictories)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => drift.OrderingTerm.desc(t.timestamp)]))
        .watch();
  }

  Future<Map<String, int>> getStrategyStats(String userId) async {
    final victories = await getVictories(userId);
    final stats = <String, int>{};
    for (final v in victories) {
      final key = v.strategyValue == 'called' && v.contactName != null
          ? 'called:${v.contactName}'
          : v.strategyValue;
      stats[key] = (stats[key] ?? 0) + 1;
    }
    return stats;
  }

  Future<int> getTotalVictories(String userId) async {
    return (_db.select(_db.copingVictories)
          ..where((t) => t.userId.equals(userId)))
        .get()
        .then((list) => list.length);
  }

  Future<List<DbCopingVictory>> getRecentVictories(String userId, {int limit = 7}) async {
    final all = await getVictories(userId);
    return all.take(limit).toList();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/database/app_database.dart';
import '../../data/repositories/coping_repository.dart';
import '../providers/tracking_provider.dart';

final copingVictoriesProvider = FutureProvider.family<List<DbCopingVictory>, String>((ref, userId) {
  return ref.watch(copingRepositoryProvider).getVictories(userId);
});

final copingStatsProvider = FutureProvider.family<Map<String, int>, String>((ref, userId) {
  return ref.watch(copingRepositoryProvider).getStrategyStats(userId);
});

final copingTotalProvider = FutureProvider.family<int, String>((ref, userId) {
  return ref.watch(copingRepositoryProvider).getTotalVictories(userId);
});

final copingRecentProvider = FutureProvider.family<List<DbCopingVictory>, String>((ref, userId) {
  return ref.watch(copingRepositoryProvider).getRecentVictories(userId);
});

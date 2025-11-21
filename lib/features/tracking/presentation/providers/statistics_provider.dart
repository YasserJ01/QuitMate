import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/statistics.dart';
import '../../data/models/log_entry.dart';
import '../../services/statistics_calculator.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import 'tracking_provider.dart';

// Statistics state
class StatisticsState {
  final Statistics statistics;
  final TimeRange timeRange;
  final bool isLoading;
  final String? error;

  const StatisticsState({
    required this.statistics,
    this.timeRange = TimeRange.all,
    this.isLoading = false,
    this.error,
  });

  StatisticsState copyWith({
    Statistics? statistics,
    TimeRange? timeRange,
    bool? isLoading,
    String? error,
  }) {
    return StatisticsState(
      statistics: statistics ?? this.statistics,
      timeRange: timeRange ?? this.timeRange,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class StatisticsNotifier extends StateNotifier<StatisticsState> {
  final Ref _ref;

  StatisticsNotifier(this._ref)
      : super(StatisticsState(statistics: Statistics.empty()));

  Future<void> loadStatistics({TimeRange? timeRange}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final userId = await _ref.read(currentUserIdProvider.future);
      if (userId == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'No user found',
        );
        return;
      }

      // Get profile
      final profileRepo = _ref.read(profileRepositoryProvider);
      final profile = await profileRepo.getProfile(userId);

      if (profile == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Profile not found',
        );
        return;
      }

      // Get logs and cravings
      final trackingRepo = _ref.read(trackingRepositoryProvider);
      final range = timeRange ?? state.timeRange;
      final startDate = range != TimeRange.all ? range.getStartDate() : null;

      final logs = await trackingRepo.getLogEntries(
        userId,
        startDate: startDate,
      );
      final cravings = await trackingRepo.getCravingEntries(
        userId,
        startDate: startDate,
      );

      // Calculate statistics
      final stats = StatisticsCalculator.calculateStatistics(
        logs: logs,
        cravings: cravings,
        profile: profile,
        startDate: startDate,
      );

      state = state.copyWith(
        statistics: stats,
        timeRange: range,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load statistics: $e',
      );
    }
  }

  void setTimeRange(TimeRange range) {
    loadStatistics(timeRange: range);
  }

  void refresh() {
    loadStatistics();
  }
}

final statisticsProvider = StateNotifierProvider.autoDispose<StatisticsNotifier, StatisticsState>(
      (ref) {
    final notifier = StatisticsNotifier(ref);
    notifier.loadStatistics();
    return notifier;
  },
);

// Chart data providers
final dailyChartDataProvider = FutureProvider.autoDispose.family<
List<ChartDataPoint>,
({TimeRange range, LogType? type})
>((ref, params) async {
final userId = await ref.watch(currentUserIdProvider.future);
if (userId == null) return [];

final repository = ref.watch(trackingRepositoryProvider);
final logs = await repository.getLogEntries(userId);

return StatisticsCalculator.generateDailyChartData(
logs,
params.range,
filterByType: params.type,
);
});

final triggerFrequencyDataProvider = FutureProvider.autoDispose.family<
List<MapEntry<String, int>>,
TimeRange
>((ref, range) async {
final userId = await ref.watch(currentUserIdProvider.future);
if (userId == null) return [];

final repository = ref.watch(trackingRepositoryProvider);
final logs = await repository.getLogEntries(userId);

return StatisticsCalculator.generateTriggerFrequencyData(logs, range);
});

final hourlyDistributionDataProvider = FutureProvider.autoDispose.family<
Map<int, int>,
TimeRange
>((ref, range) async {
final userId = await ref.watch(currentUserIdProvider.future);
if (userId == null) return {};

final repository = ref.watch(trackingRepositoryProvider);
final logs = await repository.getLogEntries(userId);

return StatisticsCalculator.generateHourlyDistributionData(logs, range);
});

// Next milestone provider
final nextMilestoneProvider = Provider.autoDispose<Map<String, dynamic>>((ref) {
final stats = ref.watch(statisticsProvider).statistics;
return StatisticsCalculator.getNextMilestone(stats.currentStreak);
});

// // Progress percentage provider
// final progressPercentageProvider = Provider.autoDispose<double>((ref) async* {
// final userId = await ref.watch(currentUserIdProvider.future);
// if (userId == null) {
// yield 0.0;
// return;
// }
//
// final profileRepo = ref.watch(profileRepositoryProvider);
// final profile = await profileRepo.getProfile(userId);
//
// if (profile == null) {
// yield 0.0;
// return;
// }
//
// final stats = ref.watch(statisticsProvider).statistics;
// yield StatisticsCalculator.calculateProgressPercentage(profile, stats);
// });
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/log_entry.dart';
import '../../data/models/craving_entry.dart';
import '../../data/repositories/tracking_repository.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// Repository provider
final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  return TrackingRepository();
});

// Current user ID provider
final currentUserIdProvider = FutureProvider<String?>((ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  return await secureStorage.getUserId();
});

// ============= LOG ENTRY PROVIDERS =============

// All logs provider
final logsProvider = StreamProvider.autoDispose<List<LogEntry>>((ref) async* {
  final repository = ref.watch(trackingRepositoryProvider);
  final userId = await ref.watch(currentUserIdProvider.future);

  if (userId == null) {
    yield [];
    return;
  }

  // Initial load
  yield await repository.getLogEntries(userId);

  // Poll for updates every 5 seconds (you can adjust this)
  while (true) {
    await Future.delayed(const Duration(seconds: 5));
    yield await repository.getLogEntries(userId);
  }
});

// Today's logs provider
final todaysLogsProvider =
    FutureProvider.autoDispose<List<LogEntry>>((ref) async {
  final repository = ref.watch(trackingRepositoryProvider);
  final userId = await ref.watch(currentUserIdProvider.future);

  if (userId == null) return [];

  return await repository.getLogsForToday(userId);
});

// Logs by type provider
final logsByTypeProvider =
    FutureProvider.autoDispose.family<List<LogEntry>, LogType>(
  (ref, type) async {
    final repository = ref.watch(trackingRepositoryProvider);
    final userId = await ref.watch(currentUserIdProvider.future);

    if (userId == null) return [];

    return await repository.getLogEntries(userId, type: type);
  },
);

// Logs by date range provider
final logsByDateRangeProvider = FutureProvider.autoDispose
    .family<List<LogEntry>, ({DateTime? start, DateTime? end})>(
        (ref, params) async {
  final repository = ref.watch(trackingRepositoryProvider);
  final userId = await ref.watch(currentUserIdProvider.future);

  if (userId == null) return [];

  return await repository.getLogEntries(
    userId,
    startDate: params.start,
    endDate: params.end,
  );
});

// ============= CRAVING ENTRY PROVIDERS =============

// All cravings provider
final cravingsProvider =
    FutureProvider.autoDispose<List<CravingEntry>>((ref) async {
  final repository = ref.watch(trackingRepositoryProvider);
  final userId = await ref.watch(currentUserIdProvider.future);

  if (userId == null) return [];

  return await repository.getCravingEntries(userId);
});

// Ongoing craving provider
final ongoingCravingProvider =
    FutureProvider.autoDispose<CravingEntry?>((ref) async {
  final repository = ref.watch(trackingRepositoryProvider);
  final userId = await ref.watch(currentUserIdProvider.future);

  if (userId == null) return null;

  return await repository.getOngoingCraving(userId);
});

// ============= QUICK LOG STATE NOTIFIER =============

class QuickLogState {
  final bool isLogging;
  final String? error;
  final LogEntry? lastLog;

  const QuickLogState({
    this.isLogging = false,
    this.error,
    this.lastLog,
  });

  QuickLogState copyWith({
    bool? isLogging,
    String? error,
    LogEntry? lastLog,
  }) {
    return QuickLogState(
      isLogging: isLogging ?? this.isLogging,
      error: error,
      lastLog: lastLog ?? this.lastLog,
    );
  }
}

class QuickLogNotifier extends StateNotifier<QuickLogState> {
  final TrackingRepository _repository;
  final String _userId;

  QuickLogNotifier(this._repository, this._userId)
      : super(const QuickLogState());

// Quick log cigarette (≤5 seconds requirement)
  Future<bool> logCigarette({
    int quantity = 1,
    List<String>? triggers,
    MoodType? mood,
  }) async {
    try {
      if (!mounted) return false;
      state = state.copyWith(isLogging: true, error: null);

      final entry = LogEntry()
        ..userId = _userId
        ..type = LogType.cigaretteSmoked
        ..quantity = quantity
        ..triggers = triggers ?? []
        ..mood = mood;

      final saved = await _repository.addLogEntry(entry);

      if (!mounted) return true;
      state = state.copyWith(
        isLogging: false,
        lastLog: saved,
      );

      return true;
    } catch (e) {
      if (!mounted) return false;
      state = state.copyWith(
        isLogging: false,
        error: 'Failed to log: $e',
      );
      return false;
    }
  }

// Quick log episode
  Future<bool> logEpisode({
    List<String>? triggers,
    MoodType? mood,
    int? durationSeconds,
  }) async {
    try {
      if (!mounted) return false;
      state = state.copyWith(isLogging: true, error: null);

      final entry = LogEntry()
        ..userId = _userId
        ..type = LogType.urgeEpisode
        ..triggers = triggers ?? []
        ..mood = mood
        ..durationSeconds = durationSeconds;

      final saved = await _repository.addLogEntry(entry);

      if (!mounted) return true;
      state = state.copyWith(
        isLogging: false,
        lastLog: saved,
      );

      return true;
    } catch (e) {
      if (!mounted) return false;
      state = state.copyWith(
        isLogging: false,
        error: 'Failed to log: $e',
      );
      return false;
    }
  }

// Quick log craving
  Future<bool> logCraving({
    required CravingIntensity intensity,
    List<String>? triggers,
  }) async {
    try {
      if (!mounted) return false;
      state = state.copyWith(isLogging: true, error: null);

      final entry = LogEntry()
        ..userId = _userId
        ..type = LogType.cravingLogged
        ..intensity = intensity.value
        ..triggers = triggers ?? [];

      await _repository.addLogEntry(entry);

      if (!mounted) return true;
      state = state.copyWith(isLogging: false);

      return true;
    } catch (e) {
      if (!mounted) return false;
      state = state.copyWith(
        isLogging: false,
        error: 'Failed to log: $e',
      );
      return false;
    }
  }

// Start craving tracking (for Feature C integration)
  Future<CravingEntry?> startCravingTracking({
    required CravingIntensity intensity,
    List<String>? triggers,
  }) async {
    try {
      final entry = CravingEntry()
        ..userId = _userId
        ..initialIntensity = intensity
        ..triggers = triggers ?? [];

      return await _repository.addCravingEntry(entry);
    } catch (e) {
      if (!mounted) return null;
      state = state.copyWith(error: 'Failed to start tracking: $e');
      return null;
    }
  }

// End craving tracking
  Future<bool> endCravingTracking(
    int cravingId, {
    required CravingOutcome outcome,
    CravingIntensity? finalIntensity,
    List<String>? copingStrategies,
  }) async {
    try {
      final entry = await _repository.getCravingEntry(cravingId);
      if (entry == null) return false;

      entry.endTime = DateTime.now();
      entry.outcome = outcome;
      entry.finalIntensity = finalIntensity;
      if (copingStrategies != null) {
        entry.copingStrategiesUsed = copingStrategies;
      }

      await _repository.updateCravingEntry(entry);
      return true;
    } catch (e) {
      if (!mounted) return false;
      state = state.copyWith(error: 'Failed to end tracking: $e');
      return false;
    }
  }

  void clearError() {
    if (!mounted) return;
    state = state.copyWith(error: null);
  }
}

final quickLogProvider =
    StateNotifierProvider<QuickLogNotifier, QuickLogState>(
  (ref) {
    final repository = ref.watch(trackingRepositoryProvider);
    final userIdAsync = ref.watch(currentUserIdProvider);

    return userIdAsync.when(
      data: (userId) => QuickLogNotifier(repository, userId ?? ''),
      loading: () => QuickLogNotifier(repository, ''),
      error: (_, _) => QuickLogNotifier(repository, ''),
    );
  },
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/log_entry.dart';
import '../providers/tracking_provider.dart';

/// Whether the user has completed a daily check-in today.
final hasCheckedInTodayProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return false;

  final repo = ref.watch(trackingRepositoryProvider);
  final todayLogs = await repo.getLogsForToday(userId);
  return todayLogs.any((l) => l.type == LogType.dailyCheckin);
});

/// Whether the user dismissed the check-in banner today (in-memory only).
final dismissedCheckinTodayProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// Check-in notifier — handles submission of daily check-in data.
class CheckInNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  /// Submit a daily check-in. Writes primary event + any secondary events.
  /// After submission, invalidates stats and triggers achievement evaluation.
  Future<void> submit({
    required int moodScore, // 1–5 (MoodType.value)
    required bool hadCraving,
    int? distressRating, // reduction mode only (1–10)
    bool? actedOnUrge, // reduction mode only
    bool? smokedToday, // smoking mode only
    String? cravingLevel, // smoking: 'low' / 'medium' / 'high'
  }) async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    final trackingRepo = ref.read(trackingRepositoryProvider);

    // Write primary check-in event
    final mood = MoodType.values.firstWhere(
      (m) => m.value == moodScore,
      orElse: () => MoodType.neutral,
    );

    // Write primary check-in event
    final entry = LogEntry()
      ..userId = userId
      ..type = LogType.dailyCheckin
      ..timestamp = DateTime.now().toUtc()
      ..mood = mood
      ..distressRating = distressRating
      ..wasResisted = actedOnUrge == false;

    await trackingRepo.addLogEntry(entry);

    // Write secondary events
    if (smokedToday == true) {
      final smokeEntry = LogEntry()
        ..userId = userId
        ..type = LogType.cigaretteSmoked
        ..timestamp = DateTime.now().toUtc();
      await trackingRepo.addLogEntry(smokeEntry);
    }

    if (hadCraving) {
      final cravingEntry = LogEntry()
        ..userId = userId
        ..type = LogType.cravingLogged
        ..timestamp = DateTime.now().toUtc();
      await trackingRepo.addLogEntry(cravingEntry);
    }

    // Invalidate related providers
    ref.invalidate(hasCheckedInTodayProvider);
    ref.invalidate(dismissedCheckinTodayProvider);
  }
}

final checkInProvider =
    NotifierProvider.autoDispose<CheckInNotifier, void>(CheckInNotifier.new);
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/notification_models.dart';
import '../../data/repositories/notification_repository.dart';
import '../../services/notification_manager.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// ─── Infrastructure providers ────────────────────────────────────────────────

final notificationRepositoryProvider = Provider<NotificationRepository>((_) {
  return NotificationRepository();
});

/// Initialises once, cached for the lifetime of the app.
final notificationManagerProvider =
FutureProvider<NotificationManager>((ref) async {
  return NotificationManager.initialize(
    notificationRepo: ref.watch(notificationRepositoryProvider),
    trackingRepo: ref.watch(trackingRepositoryProvider),
    profileRepo: ref.watch(profileRepositoryProvider),
  );
});

// ─── Preferences ─────────────────────────────────────────────────────────────

final notificationPreferencesProvider =
FutureProvider.autoDispose<NotificationPreferences>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return NotificationPreferences()..userId = '';
  return ref.watch(notificationRepositoryProvider).getPreferences(userId);
});

// ─── Pending notifications ────────────────────────────────────────────────────

final pendingNotificationsProvider =
FutureProvider.autoDispose<List<ScheduledNotification>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];
  return ref.watch(notificationRepositoryProvider).getPending(userId);
});

// ─── History ─────────────────────────────────────────────────────────────────

final notificationHistoryProvider =
FutureProvider.autoDispose<List<NotificationHistory>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];
  return ref.watch(notificationRepositoryProvider).getHistory(userId, limit: 50);
});

// ─── Analytics ───────────────────────────────────────────────────────────────

final notificationStatsProvider =
FutureProvider.autoDispose<NotificationStats>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return const NotificationStats.empty();

  final repo = ref.watch(notificationRepositoryProvider);
  final stats = await repo.historyStats(userId);
  final rate = await repo.openRate(userId);

  return NotificationStats(typeCounts: stats, openRatePercent: rate);
});

// ─── Preferences state notifier ──────────────────────────────────────────────

class NotificationPreferencesNotifier
    extends AutoDisposeAsyncNotifier<NotificationPreferences> {
  @override
  Future<NotificationPreferences> build() async {
    final manager = await ref.watch(notificationManagerProvider.future);
    final userId = ref.watch(currentUserIdProvider).valueOrNull ?? '';
    
    if (userId.isEmpty) {
      return NotificationPreferences()..userId = '';
    }
    
    return manager.getPreferences(userId);
  }

  Future<void> setEnabled(bool value) => _update((p) {
    p.notificationsEnabled = value;
  });

  Future<void> setFrequency(NotificationFrequency frequency) =>
      _update((p) => p.frequency = frequency);

  Future<void> setQuietHoursEnabled(bool value) =>
      _update((p) => p.quietHoursEnabled = value);

  Future<void> setQuietHoursStart(int hour) =>
      _update((p) => p.quietHoursStart = hour);

  Future<void> setQuietHoursEnd(int hour) =>
      _update((p) => p.quietHoursEnd = hour);

  Future<void> setPreferredHours(List<int> hours) =>
      _update((p) => p.preferredHours = hours);

  Future<void> setTypeEnabled(NotificationType type, bool value) =>
      _update((p) {
        switch (type) {
          case NotificationType.dailyCheckIn:
            p.dailyCheckInEnabled = value;
          case NotificationType.encouragement:
            p.encouragementEnabled = value;
          case NotificationType.milestone:
            p.milestoneEnabled = value;
          case NotificationType.cravingTip:
            p.cravingTipsEnabled = value;
          case NotificationType.microChallenge:
            p.microChallengesEnabled = value;
          case NotificationType.progressUpdate:
            p.progressUpdatesEnabled = value;
          case NotificationType.streakReminder:
            p.streakRemindersEnabled = value;
          case NotificationType.healthFact:
            p.healthFactsEnabled = value;
          case NotificationType.motivationalQuote:
            p.motivationalQuotesEnabled = value;
        }
      });

  Future<void> _update(void Function(NotificationPreferences) mutate) async {
    final current = state.valueOrNull;
    if (current == null) return;
    
    mutate(current);
    state = AsyncValue.data(current);
    
    try {
      final manager = await ref.read(notificationManagerProvider.future);
      await manager.savePreferences(current);
    } catch (e, s) {
      // Surface error but keep local state so UI stays responsive
      state = AsyncValue.error(e, s);
    }
  }
}

final notificationPreferencesNotifierProvider =
    AsyncNotifierProvider.autoDispose<NotificationPreferencesNotifier,
    NotificationPreferences>(NotificationPreferencesNotifier.new);

// ─── Value objects ────────────────────────────────────────────────────────────

class NotificationStats {
  final Map<NotificationType, int> typeCounts;
  final double openRatePercent;

  const NotificationStats({
    required this.typeCounts,
    required this.openRatePercent,
  });

  const NotificationStats.empty()
      : typeCounts = const {},
        openRatePercent = 0;

  int get totalSent => typeCounts.values.fold(0, (a, b) => a + b);
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/notification_models.dart';
import '../../data/repositories/notification_repository.dart';
import '../../services/notification_manager.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// Repository provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository();
});

// Notification manager provider
final notificationManagerProvider = FutureProvider<NotificationManager>((ref) async {
  final notificationRepo = ref.watch(notificationRepositoryProvider);
  final trackingRepo = ref.watch(trackingRepositoryProvider);
  final profileRepo = ref.watch(profileRepositoryProvider);

  return await NotificationManager.initialize(
    notificationRepo: notificationRepo,
    trackingRepo: trackingRepo,
    profileRepo: profileRepo,
  );
});

// Preferences provider
final notificationPreferencesProvider = FutureProvider.autoDispose<NotificationPreferences>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) {
    return NotificationPreferences()..userId = '';
  }

  final repository = ref.watch(notificationRepositoryProvider);
  return await repository.getPreferences(userId);
});

// Pending notifications provider
final pendingNotificationsProvider = FutureProvider.autoDispose<List<ScheduledNotification>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];

  final repository = ref.watch(notificationRepositoryProvider);
  return await repository.getPendingNotifications(userId);
});

// Notification history provider
final notificationHistoryProvider = FutureProvider.autoDispose<List<NotificationHistory>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];

  final repository = ref.watch(notificationRepositoryProvider);
  return await repository.getHistory(userId, limit: 50);
});

// Notification stats provider
final notificationStatsProvider = FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) {
    return {
      'stats': <NotificationType, int>{},
      'openRate': 0.0,
    };
  }

  final repository = ref.watch(notificationRepositoryProvider);
  final stats = await repository.getHistoryStats(userId);
  final openRate = await repository.getOpenRate(userId);

  return {
    'stats': stats,
    'openRate': openRate,
  };
});

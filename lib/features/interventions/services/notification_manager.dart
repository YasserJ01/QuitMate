import 'package:quitmate/features/interventions/services/notification_scheduler_service.dart';
import 'package:quitmate/features/interventions/services/push_notification_service.dart';
import '../data/repositories/notification_repository.dart';
import '../data/models/notification_models.dart';
import '../../tracking/data/repositories/tracking_repository.dart';
import '../../onboarding/data/repositories/profile_repository.dart';

class NotificationManager {
  final NotificationSchedulerService _scheduler;
  final PushNotificationService _pushNotifications;
  final NotificationRepository _repository;

  NotificationManager({
    required NotificationSchedulerService scheduler,
    required PushNotificationService pushNotifications,
    required NotificationRepository repository,
  })  : _scheduler = scheduler,
        _pushNotifications = pushNotifications,
        _repository = repository;

  // Factory constructor for easy initialization
  static Future<NotificationManager> initialize({
    required NotificationRepository notificationRepo,
    required TrackingRepository trackingRepo,
    required ProfileRepository profileRepo,
  }) async {
    final pushNotifications = PushNotificationService();
    await pushNotifications.initialize();

    final scheduler = NotificationSchedulerService(
      notificationRepo: notificationRepo,
      trackingRepo: trackingRepo,
      profileRepo: profileRepo,
      pushNotifications: pushNotifications,
    );

    return NotificationManager(
      scheduler: scheduler,
      pushNotifications: pushNotifications,
      repository: notificationRepo,
    );
  }

  // ============= INITIALIZATION =============

  Future<bool> requestPermissions() async {
    return await _pushNotifications.requestPermissions();
  }

  // ============= SCHEDULING =============

  Future<void> scheduleNotifications(String userId) async {
    await _scheduler.scheduleNotifications(userId);
  }

  Future<void> schedulePreventiveNotifications(String userId) async {
    await _scheduler.schedulePreventiveNotifications(userId);
  }

  Future<void> rescheduleOnPreferencesChange(String userId) async {
    await _scheduler.onPreferencesChanged(userId);
  }

  // ============= EVENT-TRIGGERED NOTIFICATIONS =============

  Future<void> onCravingLogged(String userId) async {
    await _scheduler.onCravingLogged(userId);
  }

  Future<void> onCravingResisted(String userId) async {
    await _scheduler.onCravingResisted(userId);
  }

  Future<void> onStreakMilestone(String userId, int streakDays) async {
    await _scheduler.onStreakMilestone(userId, streakDays);
  }

  Future<void> checkInactivity(String userId, DateTime lastOpenedAt) async {
    await _scheduler.checkInactivity(userId, lastOpenedAt);
  }

  // ============= PREFERENCES =============

  Future<NotificationPreferences> getPreferences(String userId) async {
    return await _repository.getPreferences(userId);
  }

  Future<void> savePreferences(NotificationPreferences preferences) async {
    await _repository.savePreferences(preferences);
    await rescheduleOnPreferencesChange(preferences.userId);
  }

  Future<void> enableNotifications(String userId, bool enabled) async {
    final prefs = await getPreferences(userId);
    prefs.notificationsEnabled = enabled;
    await savePreferences(prefs);
  }

  Future<void> setFrequency(String userId, NotificationFrequency frequency) async {
    final prefs = await getPreferences(userId);
    prefs.frequency = frequency;
    await savePreferences(prefs);
  }

  Future<void> setQuietHours(
      String userId, {
        required bool enabled,
        int? startHour,
        int? endHour,
      }) async {
    final prefs = await getPreferences(userId);
    prefs.quietHoursEnabled = enabled;
    if (startHour != null) prefs.quietHoursStart = startHour;
    if (endHour != null) prefs.quietHoursEnd = endHour;
    await savePreferences(prefs);
  }

  // ============= HISTORY & ANALYTICS =============

  Future<List<NotificationHistory>> getHistory(String userId, {int? limit}) async {
    return await _repository.getHistory(userId, limit: limit);
  }

  Future<Map<NotificationType, int>> getHistoryStats(String userId) async {
    return await _repository.getHistoryStats(userId);
  }

  Future<double> getOpenRate(String userId) async {
    return await _repository.getOpenRate(userId);
  }

  Future<List<ScheduledNotification>> getPendingNotifications(String userId) async {
    return await _repository.getPendingNotifications(userId);
  }

  // ============= MANUAL ACTIONS =============

  Future<void> sendImmediateNotification({
    required String userId,
    required String title,
    required String body,
    NotificationType type = NotificationType.encouragement,
  }) async {
    final notification = ScheduledNotification()
      ..userId = userId
      ..type = type
      ..title = title
      ..body = body
      ..scheduledTime = DateTime.now();

    final saved = await _repository.scheduleNotification(notification);

    await _pushNotifications.showImmediateNotification(
      id: saved.id,
      title: title,
      body: body,
    );

    await _repository.markAsSent(saved.id);
  }

  Future<void> cancelAllNotifications() async {
    await _pushNotifications.cancelAllNotifications();
  }

  // ============= NOTIFICATION INTERACTION =============

  Future<void> markNotificationAsOpened(int notificationId) async {
    await _repository.markAsOpened(notificationId);
  }
}

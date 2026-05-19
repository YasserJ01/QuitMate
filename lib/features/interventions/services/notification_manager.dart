import '../data/models/notification_models.dart';
import '../data/repositories/notification_repository.dart';
import '../services/notification_scheduler_service.dart';
import '../services/push_notification_service.dart';
import '../../tracking/data/repositories/tracking_repository.dart';
import '../../onboarding/data/repositories/profile_repository.dart';

/// High-level facade that wires together the scheduler, platform push service
/// and the repository.  All public methods are the only entry-points the UI
/// and Riverpod providers should call.
class NotificationManager {
  final NotificationSchedulerService _scheduler;
  final PushNotificationService _push;
  final NotificationRepository _repo;

  NotificationManager._({
    required NotificationSchedulerService scheduler,
    required PushNotificationService push,
    required NotificationRepository repo,
  })  : _scheduler = scheduler,
        _push = push,
        _repo = repo;

  // ─── Factory / bootstrap ─────────────────────────────────────────────────

  static Future<NotificationManager> initialize({
    required NotificationRepository notificationRepo,
    required TrackingRepository trackingRepo,
    required ProfileRepository profileRepo,
  }) async {
    final push = PushNotificationService();
    await push.initialize();

    final scheduler = NotificationSchedulerService(
      notificationRepo: notificationRepo,
      trackingRepo: trackingRepo,
      profileRepo: profileRepo,
      pushNotifications: push,
    );

    return NotificationManager._(
      scheduler: scheduler,
      push: push,
      repo: notificationRepo,
    );
  }

  // ─── Permissions ─────────────────────────────────────────────────────────

  Future<bool> requestPermissions() => _push.requestPermissions();
  Future<bool> hasPermissions() => _push.hasPermission();

  /// Requests notification permission only if appropriate:
  /// - Not already granted
  /// - Not recently denied (within 7 days)
  ///
  /// Call this after the first log event or at day 2 opener — NOT on cold start.
  Future<bool> requestPermissionsIfAppropriate(String userId) async {
    // Do not request if already granted
    if (await _push.hasPermission()) return true;

    // Do not request if recently denied
    final prefs = await _repo.getPreferences(userId);
    if (prefs.permissionDeniedAt != null) {
      final daysSinceDenial =
          DateTime.now().difference(prefs.permissionDeniedAt!).inDays;
      if (daysSinceDenial < 7) return false;
    }

    // Request
    final granted = await _push.requestPermissions();
    if (!granted) {
      prefs.permissionDeniedAt = DateTime.now().toUtc();
      await _repo.savePreferences(prefs);
    } else {
      await scheduleAll(userId);
    }

    return granted;
  }

  /// Stream of notification taps — subscribe to handle deep-links.
  Stream<NotificationTapPayload> get onTap => _push.onNotificationTap;

  // ─── Scheduling ──────────────────────────────────────────────────────────

  /// Schedule (or reschedule) the next 7 days of notifications.
  Future<void> scheduleAll(String userId) =>
      _scheduler.scheduleForNextDays(userId);

  Future<void> schedulePreventive(String userId) =>
      _scheduler.schedulePreventive(userId);

  // ─── Event hooks (call from tracking / craving features) ─────────────────

  Future<void> onCravingLogged(String userId) =>
      _scheduler.onCravingLogged(userId);

  Future<void> onCravingResisted(String userId) =>
      _scheduler.onCravingResisted(userId);

  Future<void> onStreakMilestone(String userId, int streakDays) =>
      _scheduler.onStreakMilestone(userId, streakDays);

  Future<void> onInactivityDetected(String userId, DateTime lastOpened) =>
      _scheduler.onInactivityDetected(userId, lastOpened);

  Future<void> scheduleQuitDatePrep(String userId, DateTime quitDate) =>
      _scheduler.scheduleQuitDatePrep(userId, quitDate);

  Future<void> scheduleBedtimeReminder(String userId, int bedtimeHour) =>
      _scheduler.scheduleBedtimeReminder(userId, bedtimeHour);

  // ─── Preferences ─────────────────────────────────────────────────────────

  Future<NotificationPreferences> getPreferences(String userId) =>
      _repo.getPreferences(userId);

  Future<void> savePreferences(NotificationPreferences prefs) async {
    await _repo.savePreferences(prefs);
    // Reschedule immediately so changes take effect.
    await scheduleAll(prefs.userId);
  }

  Future<void> setEnabled(String userId, {required bool enabled}) async {
    final prefs = await getPreferences(userId);
    prefs.notificationsEnabled = enabled;
    await savePreferences(prefs);
  }

  Future<void> setFrequency(
      String userId, NotificationFrequency frequency) async {
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

  // ─── Manual / immediate ──────────────────────────────────────────────────

  Future<void> sendImmediate({
    required String userId,
    required String title,
    required String body,
    NotificationType type = NotificationType.encouragement,
    String? payload,
  }) async {
    final n = ScheduledNotification(
      userId: userId,
      type: type,
      title: title,
      body: body,
      scheduledTime: DateTime.now(),
      payload: payload,
    );

    final saved = await _repo.save(n);
    await _push.showImmediate(
      id: saved.id,
      title: title,
      body: body,
      payload: payload,
    );
    await _repo.markSent(saved.id);
  }

  Future<void> cancelAll() => _push.cancelAll();

  // ─── History / analytics ─────────────────────────────────────────────────

  Future<List<NotificationHistory>> getHistory(String userId, {int? limit}) =>
      _repo.getHistory(userId, limit: limit);

  Future<Map<NotificationType, int>> historyStats(String userId) =>
      _repo.historyStats(userId);

  Future<double> openRate(String userId) => _repo.openRate(userId);

  Future<List<ScheduledNotification>> getPending(String userId) =>
      _repo.getPending(userId);

  Future<void> markOpened(int notificationId) =>
      _repo.markOpened(notificationId);
}
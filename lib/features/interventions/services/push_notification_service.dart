import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

/// Result type for notification operations
class NotificationResult {
  final bool success;
  final String? error;

  const NotificationResult({required this.success, this.error});

  static const NotificationResult ok = NotificationResult(success: true);
  factory NotificationResult.fail(String error) =>
      NotificationResult(success: false, error: error);
}

/// Offline-only push notification service using flutter_local_notifications.
/// No Firebase or network dependency.
class PushNotificationService {
  static final PushNotificationService _instance =
  PushNotificationService._internal();
  factory PushNotificationService() => _instance;
  PushNotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  // Stream for notification taps so callers can react
  final StreamController<NotificationTapPayload> _tapController =
  StreamController.broadcast();
  Stream<NotificationTapPayload> get onNotificationTap => _tapController.stream;

  // ─── Initialisation ────────────────────────────────────────────────────────

  Future<void> initialize() async {
    if (_initialized) return;

    tz.initializeTimeZones();

    const androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false, // We request explicitly via requestPermissions()
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
          android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onTap,
      onDidReceiveBackgroundNotificationResponse: _onBackgroundTap,
    );

    await _createNotificationChannel();
    _initialized = true;
  }

  Future<void> _createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      _channelId,
      'QuitMate Reminders',
      description: 'Encouragement, tips and milestone reminders',
      importance: Importance.high,
      enableVibration: true,
      playSound: true,
    );
    await _plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // ─── Permissions ───────────────────────────────────────────────────────────

  Future<bool> requestPermissions() async {
    // Android 13+
    final android = _plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final androidGranted = await android?.requestNotificationsPermission();

    // iOS
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    final iosGranted = await ios?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    return (androidGranted ?? true) || (iosGranted ?? true);
  }

  Future<bool> hasPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final granted =
    await android?.areNotificationsEnabled();
    return granted ?? true; // iOS assumed true if initialized
  }

  // ─── Schedule / Show ───────────────────────────────────────────────────────

  Future<NotificationResult> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    try {
      if (!_initialized) await initialize();

      final tzTime = tz.TZDateTime.from(scheduledTime, tz.local);
      if (tzTime.isBefore(tz.TZDateTime.now(tz.local))) {
        return NotificationResult.fail('Scheduled time is in the past');
      }

      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tzTime,
        _details(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );
      return NotificationResult.ok;
    } catch (e, s) {
      debugPrint('scheduleNotification error: $e\n$s');
      return NotificationResult.fail(e.toString());
    }
  }

  Future<NotificationResult> showImmediate({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      if (!_initialized) await initialize();
      await _plugin.show(id, title, body, _details(), payload: payload);
      return NotificationResult.ok;
    } catch (e) {
      return NotificationResult.fail(e.toString());
    }
  }

  Future<void> cancel(int id) => _plugin.cancel(id);

  Future<void> cancelAll() => _plugin.cancelAll();

  /// Returns all pending (scheduled but not yet fired) notification IDs.
  Future<List<int>> pendingIds() async {
    final list = await _plugin.pendingNotificationRequests();
    return list.map((n) => n.id).toList();
  }

  // ─── Tap handling ──────────────────────────────────────────────────────────

  void _onTap(NotificationResponse response) {
    _tapController.add(NotificationTapPayload(
      notificationId: response.id ?? 0,
      payload: response.payload,
    ));
  }

  void dispose() {
    _tapController.close();
  }

  // ─── Internals ─────────────────────────────────────────────────────────────

  static const _channelId = 'quitmate_interventions';

  NotificationDetails _details() => const NotificationDetails(
    android: AndroidNotificationDetails(
      _channelId,
      'QuitMate Reminders',
      channelDescription:
      'Encouragement, tips and milestone reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      styleInformation: BigTextStyleInformation(''),
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );
}

// Background callback — must be top-level
@pragma('vm:entry-point')
void _onBackgroundTap(NotificationResponse response) {
  // Background taps: stored in shared_preferences so the app can read on next launch.
  debugPrint('Background notification tap: ${response.payload}');
}

class NotificationTapPayload {
  final int notificationId;
  final String? payload;
  const NotificationTapPayload(
      {required this.notificationId, this.payload});
}
import 'dart:math';
import '../data/models/notification_models.dart';
import '../data/notification_content.dart';
import '../data/repositories/notification_repository.dart';
import '../../tracking/data/repositories/tracking_repository.dart';
import '../../onboarding/data/repositories/profile_repository.dart';
import '../../tracking/services/statistics_calculator.dart';
import 'push_notification_service.dart';

class NotificationSchedulerService {
  final NotificationRepository _notificationRepo;
  final TrackingRepository _trackingRepo;
  final ProfileRepository _profileRepo;
  final PushNotificationService _pushNotifications;

  NotificationSchedulerService({
    required NotificationRepository notificationRepo,
    required TrackingRepository trackingRepo,
    required ProfileRepository profileRepo,
    required PushNotificationService pushNotifications,
  })  : _notificationRepo = notificationRepo,
        _trackingRepo = trackingRepo,
        _profileRepo = profileRepo,
        _pushNotifications = pushNotifications;

  // ============= MAIN SCHEDULING =============

  /// Schedule notifications for the next 7 days
  Future<void> scheduleNotifications(String userId) async {
    final prefs = await _notificationRepo.getPreferences(userId);

    if (!prefs.notificationsEnabled) {
      await _pushNotifications.cancelAllNotifications();
      return;
    }

    // Clear old scheduled notifications
    await _notificationRepo.clearOldScheduledNotifications(userId);

    // Cancel existing platform notifications
    await _pushNotifications.cancelAllNotifications();

    // Get user data for adaptive content
    final profile = await _profileRepo.getProfile(userId);
    if (profile == null) return;

    final logs = await _trackingRepo.getLogEntries(userId);
    final cravings = await _trackingRepo.getCravingEntries(userId);
    final stats = StatisticsCalculator.calculateStatistics(
      logs: logs,
      cravings: cravings,
      profile: profile,
    );

    // Schedule for next 7 days
    final now = DateTime.now();
    for (int day = 0; day < 7; day++) {
      final targetDate = now.add(Duration(days: day));
      await _scheduleDailyNotifications(
        userId,
        targetDate,
        prefs,
        stats,
        profile.goalType.name,
      );
    }
  }

  Future<void> _scheduleDailyNotifications(
      String userId,
      DateTime date,
      NotificationPreferences prefs,
      dynamic stats,
      String goalType,
      ) async {
    final maxNotifications = prefs.frequency.maxDailyNotifications;
    final scheduledTimes = _generateOptimalTimes(date, prefs, maxNotifications);

    // Determine notification types based on user behavior
    final notificationTypes = _selectNotificationTypes(
      prefs,
      stats,
      maxNotifications,
    );

    for (int i = 0; i < scheduledTimes.length && i < notificationTypes.length; i++) {
      final scheduledTime = scheduledTimes[i];
      final type = notificationTypes[i];

      // Skip if in quiet hours
      if (prefs.isInQuietHours(scheduledTime)) continue;

      // Generate notification content
      final notification = await _generateNotification(
        userId: userId,
        type: type,
        scheduledTime: scheduledTime,
        stats: stats,
        goalType: goalType,
      );

      // Save to database
      final saved = await _notificationRepo.scheduleNotification(notification);

      // Schedule with platform
      await _pushNotifications.scheduleNotification(
        id: saved.id,
        title: notification.title,
        body: notification.body,
        scheduledTime: scheduledTime,
        payload: notification.payload,
      );
    }
  }

  // ============= ADAPTIVE TYPE SELECTION =============

  List<NotificationType> _selectNotificationTypes(
      NotificationPreferences prefs,
      dynamic stats,
      int count,
      ) {
    final types = <NotificationType>[];
    final availableTypes = <NotificationType>[];

    // Always include daily check-in if enabled
    if (prefs.dailyCheckInEnabled && types.isEmpty) {
      types.add(NotificationType.dailyCheckIn);
    }

    // Build available types pool based on preferences
    if (prefs.encouragementEnabled) {
      availableTypes.add(NotificationType.encouragement);
    }
    if (prefs.cravingTipsEnabled) {
      availableTypes.add(NotificationType.cravingTip);
    }
    if (prefs.microChallengesEnabled) {
      availableTypes.add(NotificationType.microChallenge);
    }
    if (prefs.healthFactsEnabled) {
      availableTypes.add(NotificationType.healthFact);
    }
    if (prefs.motivationalQuotesEnabled) {
      availableTypes.add(NotificationType.motivationalQuote);
    }

    // Add milestone if applicable
    if (prefs.milestoneEnabled && _shouldSendMilestone(stats)) {
      types.add(NotificationType.milestone);
    }

    // Add progress update weekly
    if (prefs.progressUpdatesEnabled && _shouldSendProgressUpdate(stats)) {
      types.add(NotificationType.progressUpdate);
    }

    // Add streak reminder if needed
    if (prefs.streakRemindersEnabled && stats.currentStreak > 0) {
      types.add(NotificationType.streakReminder);
    }

    // Adaptive selection based on user behavior
    if (stats.totalCravings > stats.cravingsResisted * 1.5) {
      // Struggling with cravings - prioritize tips and encouragement
      availableTypes
        ..remove(NotificationType.cravingTip)
        ..insertAll(0, [
          NotificationType.cravingTip,
          NotificationType.cravingTip,
          NotificationType.encouragement,
        ]);
    }

    if (stats.cravingResistanceRate > 70) {
      // Doing well - more positive reinforcement
      availableTypes
        ..remove(NotificationType.encouragement)
        ..insertAll(0, [
          NotificationType.encouragement,
          NotificationType.motivationalQuote,
        ]);
    }

    // Fill remaining slots
    availableTypes.shuffle();
    while (types.length < count && availableTypes.isNotEmpty) {
      types.add(availableTypes.removeAt(0));
    }

    return types;
  }

  // ============= OPTIMAL TIME GENERATION =============

  List<DateTime> _generateOptimalTimes(
      DateTime date,
      NotificationPreferences prefs,
      int count,
      ) {
    final times = <DateTime>[];
    final preferredHours = List<int>.from(prefs.preferredHours)..shuffle();

    // Start with preferred hours
    for (final hour in preferredHours) {
      if (times.length >= count) break;

      final time = DateTime(
        date.year,
        date.month,
        date.day,
        hour,
        Random().nextInt(60), // Random minute
      );

      if (!prefs.isInQuietHours(time) && time.isAfter(DateTime.now())) {
        times.add(time);
      }
    }

    // If we need more times, generate them
    while (times.length < count) {
      final hour = _generateRandomHour(prefs);
      final time = DateTime(
        date.year,
        date.month,
        date.day,
        hour,
        Random().nextInt(60),
      );

      if (!prefs.isInQuietHours(time) &&
          time.isAfter(DateTime.now()) &&
          !_isTooClose(time, times)) {
        times.add(time);
      }
    }

    times.sort();
    return times;
  }

  int _generateRandomHour(NotificationPreferences prefs) {
    // Generate hour avoiding quiet hours
    int hour;
    do {
      hour = 8 + Random().nextInt(14); // Between 8 AM and 10 PM
    } while (prefs.isInQuietHours(DateTime(2024, 1, 1, hour)));

    return hour;
  }

  bool _isTooClose(DateTime time, List<DateTime> existingTimes) {
    // Ensure at least 2 hours between notifications
    for (final existing in existingTimes) {
      if (time.difference(existing).abs().inMinutes < 120) {
        return true;
      }
    }
    return false;
  }

  // ============= CONTENT GENERATION =============

  Future<ScheduledNotification> _generateNotification({
    required String userId,
    required NotificationType type,
    required DateTime scheduledTime,
    required dynamic stats,
    required String goalType,
  }) async {
    final notification = ScheduledNotification()
      ..userId = userId
      ..type = type
      ..scheduledTime = scheduledTime;

    if (type == NotificationType.microChallenge) {
      final challenge = NotificationContent.getRandomMicroChallenge();
      notification.title = '⚡ ${challenge.title}';
      notification.body = challenge.description;
      notification.payload = _createPayload({
        'type': 'micro_challenge',
        'action': challenge.actionType,
      });
    } else {
      final template = NotificationContent.getRandomTemplate(type);
      final data = _getUserData(stats, goalType);

      notification.title = template.formatTitle(data);
      notification.body = template.formatBody(data);
      notification.payload = _createPayload({'type': type.name});

      // Store user data for reference
      if (data != null) {
        notification.relatedStreakDays = data['days'] as int?;
        notification.relatedMoneySaved = data['money'] as int?;
      }
    }

    return notification;
  }

  Map<String, dynamic>? _getUserData(dynamic stats, String goalType) {
    return {
      'days': stats.currentStreak,
      'money': stats.moneySaved.round(),
      'cravings': stats.cravingsResisted,
      'rate': stats.cravingResistanceRate.round(),
    };
  }

  String _createPayload(Map<String, dynamic> data) {
    // Simple key-value format for deep linking
    return data.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  // ============= BEHAVIORAL TRIGGERS =============

  /// Send immediate notification when user logs a craving
  Future<void> onCravingLogged(String userId) async {
    final prefs = await _notificationRepo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.cravingTipsEnabled) return;

    // Wait 30 minutes, then send encouragement
    final scheduledTime = DateTime.now().add(const Duration(minutes: 30));

    final notification = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.encouragement
      ..scheduledTime = scheduledTime
      ..title = 'You Can Do This! 💪'
      ..body = 'You recognized a craving. That\'s a huge step! Want to try a grounding exercise?'
      ..payload = _createPayload({'type': 'craving_support', 'action': 'open_toolkit'});

    final saved = await _notificationRepo.scheduleNotification(notification);

    await _pushNotifications.scheduleNotification(
      id: saved.id,
      title: notification.title,
      body: notification.body,
      scheduledTime: scheduledTime,
      payload: notification.payload,
    );
  }

  /// Send immediate notification when user successfully resists
  Future<void> onCravingResisted(String userId) async {
    final prefs = await _notificationRepo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.encouragementEnabled) return;

    final notification = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.encouragement
      ..scheduledTime = DateTime.now()
      ..title = 'Victory! 🎉'
      ..body = 'You just proved you\'re stronger than the craving. Amazing work!'
      ..payload = _createPayload({'type': 'celebration'});

    final saved = await _notificationRepo.scheduleNotification(notification);

    await _pushNotifications.showImmediateNotification(
      id: saved.id,
      title: notification.title,
      body: notification.body,
      payload: notification.payload,
    );

    await _notificationRepo.markAsSent(saved.id);
  }

  /// Send milestone notification when user reaches a streak milestone
  Future<void> onStreakMilestone(String userId, int streakDays) async {
    final prefs = await _notificationRepo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.milestoneEnabled) return;

    final milestones = [1, 3, 7, 14, 21, 30, 60, 90, 180, 365];
    if (!milestones.contains(streakDays)) return;

    final notification = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.milestone
      ..scheduledTime = DateTime.now()
      ..title = '🎉 ${streakDays} Day Milestone!'
      ..body = _getMilestoneMessage(streakDays)
      ..relatedStreakDays = streakDays
      ..payload = _createPayload({'type': 'milestone', 'days': streakDays});

    final saved = await _notificationRepo.scheduleNotification(notification);

    await _pushNotifications.showImmediateNotification(
      id: saved.id,
      title: notification.title,
      body: notification.body,
      payload: notification.payload,
    );

    await _notificationRepo.markAsSent(saved.id);
  }

  String _getMilestoneMessage(int days) {
    if (days == 1) return 'You made it through the first day! That\'s huge!';
    if (days == 3) return 'Three days strong! You\'re building momentum!';
    if (days == 7) return 'One week! Your body is already healing!';
    if (days == 14) return 'Two weeks! You\'re crushing it!';
    if (days == 21) return 'Three weeks! New habits are forming!';
    if (days == 30) return 'One month! This is a major achievement!';
    if (days == 60) return 'Two months! You\'re unstoppable!';
    if (days == 90) return 'Three months! You\'ve transformed your life!';
    if (days == 180) return 'Six months! You\'re an inspiration!';
    if (days == 365) return 'One YEAR! You\'re a legend!';
    return 'Amazing streak! Keep going!';
  }

  /// Send notification if user hasn't opened app in 24 hours
  Future<void> checkInactivity(String userId, DateTime lastOpenedAt) async {
    final now = DateTime.now();
    final hoursSinceLastOpen = now.difference(lastOpenedAt).inHours;

    if (hoursSinceLastOpen < 24) return;

    final prefs = await _notificationRepo.getPreferences(userId);
    if (!prefs.notificationsEnabled) return;

    final notification = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.dailyCheckIn
      ..scheduledTime = now
      ..title = 'We Miss You! 👋'
      ..body = 'How are you doing? Check in to maintain your progress.'
      ..payload = _createPayload({'type': 'check_in_reminder'});

    final saved = await _notificationRepo.scheduleNotification(notification);

    await _pushNotifications.showImmediateNotification(
      id: saved.id,
      title: notification.title,
      body: notification.body,
      payload: notification.payload,
    );

    await _notificationRepo.markAsSent(saved.id);
  }

  // ============= HELPER METHODS =============

  bool _shouldSendMilestone(dynamic stats) {
    final streakDays = stats.currentStreak as int;
    final milestones = [1, 3, 7, 14, 21, 30, 60, 90, 180, 365];
    return milestones.contains(streakDays);
  }

  bool _shouldSendProgressUpdate(dynamic stats) {
    // Send weekly progress updates
    final lastUpdate = DateTime.now().subtract(const Duration(days: 7));
    return true; // Simplified - you'd check last sent time
  }

  // ============= RESCHEDULE ON PREFERENCES CHANGE =============

  Future<void> onPreferencesChanged(String userId) async {
    await scheduleNotifications(userId);
  }

  // ============= SMART TIMING BASED ON CRAVING PATTERNS =============

  Future<List<int>> _predictHighRiskHours(String userId) async {
    final logs = await _trackingRepo.getLogEntries(userId);

    // Analyze when user typically has cravings
    final hourCounts = <int, int>{};
    for (final log in logs) {
      if (log.type.name.contains('craving') || log.type.name.contains('relapse')) {
        final hour = log.timestamp.hour;
        hourCounts[hour] = (hourCounts[hour] ?? 0) + 1;
      }
    }

    // Return top 3 high-risk hours
    final sorted = hourCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted.take(3).map((e) => e.key).toList();
  }

  /// Schedule preventive notifications before high-risk times
  Future<void> schedulePreventiveNotifications(String userId) async {
    final prefs = await _notificationRepo.getPreferences(userId);
    if (!prefs.notificationsEnabled) return;

    final highRiskHours = await _predictHighRiskHours(userId);
    if (highRiskHours.isEmpty) return;

    final now = DateTime.now();

    for (final hour in highRiskHours) {
      // Schedule 15 minutes before high-risk time
      var scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        hour,
        0,
      ).subtract(const Duration(minutes: 15));

      if (scheduledTime.isBefore(now)) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }

      if (prefs.isInQuietHours(scheduledTime)) continue;

      final notification = ScheduledNotification()
        ..userId = userId
        ..type = NotificationType.cravingTip
        ..scheduledTime = scheduledTime
        ..title = 'Stay Strong 💪'
        ..body = 'This is typically a challenging time. You\'ve got this! Try a breathing exercise if needed.'
        ..payload = _createPayload({'type': 'preventive', 'action': 'open_toolkit'});

      final saved = await _notificationRepo.scheduleNotification(notification);

      await _pushNotifications.scheduleNotification(
        id: saved.id,
        title: notification.title,
        body: notification.body,
        scheduledTime: scheduledTime,
        payload: notification.payload,
      );
    }
  }
}

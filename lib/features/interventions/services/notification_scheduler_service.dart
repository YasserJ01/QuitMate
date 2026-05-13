import 'dart:math';

import '../data/models/notification_models.dart';
import '../data/notification_content.dart';
import '../data/repositories/notification_repository.dart';
import '../../tracking/data/repositories/tracking_repository.dart';
import '../../onboarding/data/repositories/profile_repository.dart';
import '../../tracking/services/statistics_calculator.dart';
import '../../tracking/data/models/statistics.dart';
import 'push_notification_service.dart';

/// Business-logic layer that decides *what* to send and *when*.
///
/// Scheduling strategy
/// ───────────────────
/// 1. On each call to [scheduleForNextDays] we wipe all pending platform
///    notifications and reschedule from scratch for the next N days.
/// 2. The number of notifications per day is controlled by the user's
///    [NotificationPreferences.frequency] setting.
/// 3. Quiet hours are always respected.
/// 4. The *type* of notification is chosen adaptively based on recent stats.
/// 5. Event-triggered notifications (craving logged, milestone reached, etc.)
///    are sent immediately and do not count towards the daily quota.
class NotificationSchedulerService {
  final NotificationRepository _repo;
  final TrackingRepository _trackingRepo;
  final ProfileRepository _profileRepo;
  final PushNotificationService _push;

  static final _rng = Random();

  NotificationSchedulerService({
    required NotificationRepository notificationRepo,
    required TrackingRepository trackingRepo,
    required ProfileRepository profileRepo,
    required PushNotificationService pushNotifications,
  })  : _repo = notificationRepo,
        _trackingRepo = trackingRepo,
        _profileRepo = profileRepo,
        _push = pushNotifications;

  // ─── Main entry point ────────────────────────────────────────────────────

  /// Schedule notifications for the next [days] days.
  ///
  /// Calling this replaces **all** existing scheduled platform notifications.
  Future<void> scheduleForNextDays(String userId, {int days = 7}) async {
    final prefs = await _repo.getPreferences(userId);

    if (!prefs.notificationsEnabled) {
      await _push.cancelAll();
      return;
    }

    // Housekeeping
    await _repo.pruneOld(userId);
    await _cancelFutureNotifications(userId);

    // Gather adaptive context
    final profile = await _profileRepo.getProfile(userId);
    if (profile == null) return;

    final logs = await _trackingRepo.getLogEntries(userId);
    final cravings = await _trackingRepo.getCravingEntries(userId);
    final stats = StatisticsCalculator.calculateStatistics(
      logs: logs,
      cravings: cravings,
      profile: profile,
    );

    for (var day = 0; day < days; day++) {
      final date = DateTime.now().add(Duration(days: day));
      await _scheduleDayBatch(userId, date, prefs, stats);
    }
  }

  Future<void> _cancelFutureNotifications(String userId) async {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day)
        .add(const Duration(days: 1));
    final pending = await _repo.getPending(userId);

    for (final n in pending) {
      if (n.scheduledTime.isAfter(tomorrow)) {
        await _push.cancel(n.id);
        await _repo.delete(n.id);
      }
    }
  }

  // ─── Per-day batch ───────────────────────────────────────────────────────

  Future<void> _scheduleDayBatch(
      String userId,
      DateTime date,
      NotificationPreferences prefs,
      Statistics stats,
      ) async {
    final types =
    _selectTypes(prefs, stats, prefs.frequency.maxPerDay, prefs.userMode);
    final times = _generateTimes(date, prefs, types.length);

    for (var i = 0; i < times.length && i < types.length; i++) {
      final scheduledTime = times[i];
      if (prefs.isInQuietHours(scheduledTime)) continue;

      final notification = await _buildNotification(
        userId: userId,
        type: types[i],
        scheduledTime: scheduledTime,
        stats: stats,
      );

      final saved = await _repo.save(notification);
      await _push.scheduleNotification(
        id: saved.id,
        title: saved.title,
        body: saved.body,
        scheduledTime: scheduledTime,
        payload: saved.payload,
      );
    }
  }

  // ─── Adaptive type selection ─────────────────────────────────────────────

  List<NotificationType> _selectTypes(
      NotificationPreferences prefs,
      Statistics stats,
      int count,
      String? mode,
      ) {
    final selected = <NotificationType>[];

    // Guaranteed slot: daily check-in (first notification of the day)
    if (prefs.dailyCheckInEnabled) {
      selected.add(NotificationType.dailyCheckIn);
    }

    // Priority-weighted pool
    final pool = <NotificationType>[];

    void addIf(bool enabled, NotificationType type, [int weight = 1]) {
      if (enabled) {
        for (var i = 0; i < weight; i++) {
          pool.add(type);
        }
      }
    }

    // Struggling with cravings? Prioritise tips + encouragement
    final resistanceRate = stats.cravingResistanceRate.toDouble();
    final cravingWeight = resistanceRate < 50 ? 3 : 1;

    addIf(prefs.cravingTipsEnabled, NotificationType.cravingTip, cravingWeight);
    addIf(prefs.encouragementEnabled, NotificationType.encouragement,
        resistanceRate > 70 ? 2 : 1);
    addIf(prefs.microChallengesEnabled, NotificationType.microChallenge);
    addIf(prefs.healthFactsEnabled, NotificationType.healthFact);
    addIf(prefs.motivationalQuotesEnabled, NotificationType.motivationalQuote);

    // Mode-specific weighting
    final isSmoking = mode != null && mode.toLowerCase() == 'quitsmoking';
    if (isSmoking && prefs.healthFactsEnabled) {
      pool.add(NotificationType.healthFact);
      pool.add(NotificationType.healthFact); // higher weight for smoking
    }
    if (!isSmoking && mode != null && prefs.encouragementEnabled) {
      pool.add(NotificationType.encouragement);
      pool.add(NotificationType.encouragement); // higher weight for reduction
    }

    // Milestone (only if today is a milestone day)
    if (prefs.milestoneEnabled && _isMilestoneDay(stats)) {
      selected.add(NotificationType.milestone);
    }

    // Weekly progress update
    if (prefs.progressUpdatesEnabled &&
        DateTime.now().weekday == DateTime.monday) {
      selected.add(NotificationType.progressUpdate);
    }

    // Streak reminder (last slot of the day, if streaking)
    final streak = stats.currentStreak;
    if (prefs.streakRemindersEnabled && streak > 0) {
      selected.add(NotificationType.streakReminder);
    }

    // Fill remaining slots from weighted pool
    pool.shuffle(_rng);
    while (selected.length < count && pool.isNotEmpty) {
      selected.add(pool.removeAt(0));
    }

    return selected.take(count).toList();
  }

  // ─── Time generation ─────────────────────────────────────────────────────

  List<DateTime> _generateTimes(
      DateTime date,
      NotificationPreferences prefs,
      int count,
      ) {
    final times = <DateTime>[];
    final candidates = List<int>.from(prefs.preferredHours)..shuffle(_rng);

    for (final hour in candidates) {
      if (times.length >= count) break;
      final t = _candidate(date, hour);
      if (_acceptable(t, prefs, times)) times.add(t);
    }

    // Backfill with random hours if preferred slots ran out
    var attempts = 0;
    while (times.length < count && attempts < 50) {
      attempts++;
      final hour = 8 + _rng.nextInt(14); // 08:00–21:59
      final t = _candidate(date, hour);
      if (_acceptable(t, prefs, times)) times.add(t);
    }

    times.sort();
    return times;
  }

  DateTime _candidate(DateTime date, int hour) => DateTime(
    date.year,
    date.month,
    date.day,
    hour,
    _rng.nextInt(60),
  );

  bool _acceptable(
      DateTime t,
      NotificationPreferences prefs,
      List<DateTime> existing,
      ) {
    if (!t.isAfter(DateTime.now())) return false;
    if (prefs.isInQuietHours(t)) return false;
    // Minimum 90-minute gap between notifications
    return existing.every(
          (e) => t.difference(e).abs().inMinutes >= 90,
    );
  }

  // ─── Notification builder ────────────────────────────────────────────────

  Future<ScheduledNotification> _buildNotification({
    required String userId,
    required NotificationType type,
    required DateTime scheduledTime,
    required Statistics stats,
  }) async {
    final n = ScheduledNotification()
      ..userId = userId
      ..type = type
      ..scheduledTime = scheduledTime;

    if (type == NotificationType.microChallenge) {
      final challenge = NotificationContent.randomMicroChallenge();
      n
        ..title = '⚡ ${challenge.title}'
        ..body = challenge.description
        ..payload = _payload({
          'type': 'micro_challenge',
          'action': challenge.actionType,
        });
    } else {
      // Use mode-specific templates when available
      final prefs = await _repo.getPreferences(userId);
      final template = NotificationContent.randomTemplateForMode(
        type,
        prefs.userMode,
      );
      final data = _userData(stats);
      n
        ..title = template.formatTitle(data)
        ..body = template.formatBody(data)
        ..payload = _payload({'type': type.name})
        ..relatedStreakDays = data['days'] as int?
        ..relatedMoneySaved = data['money'] as int?;
    }

    return n;
  }

  Map<String, dynamic> _userData(Statistics stats) => {
    'days': stats.currentStreak,
    'money': stats.moneySaved.round(),
    'cravings': stats.cravingsResisted,
    'rate': stats.cravingResistanceRate.round(),
  };

  String _payload(Map<String, dynamic> data) =>
      data.entries.map((e) => '${e.key}=${e.value}').join('&');

  // ─── Event-triggered notifications ──────────────────────────────────────

  /// Call when the user logs a craving — sends supportive tip after 30 min.
  Future<void> onCravingLogged(String userId) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.cravingTipsEnabled) return;

    final scheduledTime = DateTime.now().add(const Duration(minutes: 30));
    final n = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.cravingTip
      ..scheduledTime = scheduledTime
      ..title = 'You can do this! 💪'
      ..body =
          "You recognised a craving — that's a huge step. Want to try a breathing exercise?"
      ..payload = _payload({'type': 'craving_support', 'action': 'open_toolkit'});

    final saved = await _repo.save(n);
    await _push.scheduleNotification(
      id: saved.id,
      title: saved.title,
      body: saved.body,
      scheduledTime: scheduledTime,
      payload: saved.payload,
    );
  }

  /// Call when the user successfully resists a craving — immediate celebration.
  Future<void> onCravingResisted(String userId) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.encouragementEnabled) return;

    final n = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.encouragement
      ..scheduledTime = DateTime.now()
      ..title = 'Victory! 🎉'
      ..body = "You just proved you're stronger than the craving. Amazing!"
      ..payload = _payload({'type': 'celebration'});

    final saved = await _repo.save(n);
    await _push.showImmediate(
      id: saved.id,
      title: saved.title,
      body: saved.body,
      payload: saved.payload,
    );
    await _repo.markSent(saved.id);
  }

  /// Call when the user hits a recognised streak milestone.
  Future<void> onStreakMilestone(String userId, int streakDays) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.milestoneEnabled) return;

    if (!_milestones.contains(streakDays)) return;

    final n = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.milestone
      ..scheduledTime = DateTime.now()
      ..title = '🎉 $streakDays day milestone!'
      ..body = _milestoneMessage(streakDays)
      ..relatedStreakDays = streakDays
      ..payload = _payload({'type': 'milestone', 'days': streakDays});

    final saved = await _repo.save(n);
    await _push.showImmediate(
      id: saved.id,
      title: saved.title,
      body: saved.body,
      payload: saved.payload,
    );
    await _repo.markSent(saved.id);
  }

  /// Call when the app detects [lastOpenedAt] was > 24 h ago.
  Future<void> onInactivityDetected(
      String userId, DateTime lastOpenedAt) async {
    final hoursSince = DateTime.now().difference(lastOpenedAt).inHours;
    if (hoursSince < 24) return;

    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled) return;

    final n = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.dailyCheckIn
      ..scheduledTime = DateTime.now()
      ..title = 'We miss you! 👋'
      ..body = "How are you doing? Check in to keep your progress safe."
      ..payload = _payload({'type': 'check_in_reminder'});

    final saved = await _repo.save(n);
    await _push.showImmediate(
      id: saved.id,
      title: saved.title,
      body: saved.body,
      payload: saved.payload,
    );
    await _repo.markSent(saved.id);
  }

  // ── Quit-date preparation (smoking mode) ───────────────────────────────

  /// Schedule T-3 and T-1 day preparation notifications before the quit date.
  /// Called from onboarding when the user sets their quit date.
  Future<void> scheduleQuitDatePrep(String userId, DateTime quitDate) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.milestoneEnabled) return;
    if (!prefs.quitDatePrepEnabled) return;

    final threeDaysBefore = quitDate.subtract(const Duration(days: 3));
    final oneDayBefore = quitDate.subtract(const Duration(days: 1));

    if (threeDaysBefore.isAfter(DateTime.now())) {
      final n = ScheduledNotification()
        ..userId = userId
        ..type = NotificationType.milestone
        ..scheduledTime = threeDaysBefore
        ..title = '3 days until your quit date 🗓️'
        ..body =
            'Getting ready? Remove cigarettes, tell a friend, prep your toolkit.'
        ..payload = _payload({'type': 'quit_prep', 'days': '3'});

      final saved = await _repo.save(n);
      await _push.scheduleNotification(
        id: saved.id,
        title: saved.title,
        body: saved.body,
        scheduledTime: threeDaysBefore,
        payload: saved.payload,
      );
    }

    if (oneDayBefore.isAfter(DateTime.now())) {
      final n = ScheduledNotification()
        ..userId = userId
        ..type = NotificationType.milestone
        ..scheduledTime = oneDayBefore
        ..title = 'Tomorrow is your quit day 🌟'
        ..body =
            "You have got everything you need. We will be here with you."
        ..payload = _payload({'type': 'quit_prep', 'days': '1'});

      final saved = await _repo.save(n);
      await _push.scheduleNotification(
        id: saved.id,
        title: saved.title,
        body: saved.body,
        scheduledTime: oneDayBefore,
        payload: saved.payload,
      );
    }
  }

  // ── Bedtime reminder (reduction mode) ──────────────────────────────────

  /// Schedule a daily notification 30 minutes before the user's bedtime.
  /// Called from onboarding when the user reports bedtime as a high-risk window.
  Future<void> scheduleBedtimeReminder(String userId, int bedtimeHour) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.cravingTipsEnabled) return;

    final reminderHour = (bedtimeHour - 1).clamp(0, 23);
    final now = DateTime.now();
    var scheduledTime = DateTime(now.year, now.month, now.day, reminderHour, 30);
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    final n = ScheduledNotification()
      ..userId = userId
      ..type = NotificationType.cravingTip
      ..scheduledTime = scheduledTime
      ..title = 'Wind-down time 🌙'
      ..body =
          'Consider a device-free wind-down routine. Your environment shapes your habits.'
      ..payload = _payload({'type': 'bedtime_reminder'});

    final saved = await _repo.save(n);
    await _push.scheduleNotification(
      id: saved.id,
      title: saved.title,
      body: saved.body,
      scheduledTime: scheduledTime,
      payload: saved.payload,
    );
  }

  /// Schedule preventive notifications 15 minutes before historically risky hours.
  Future<void> schedulePreventive(String userId) async {
    final prefs = await _repo.getPreferences(userId);
    if (!prefs.notificationsEnabled || !prefs.cravingTipsEnabled) return;

    final highRiskHours = await _highRiskHours(userId);
    final now = DateTime.now();

    for (final hour in highRiskHours) {
      var t = DateTime(now.year, now.month, now.day, hour)
          .subtract(const Duration(minutes: 15));
      if (t.isBefore(now)) t = t.add(const Duration(days: 1));
      if (prefs.isInQuietHours(t)) continue;

      final n = ScheduledNotification()
        ..userId = userId
        ..type = NotificationType.cravingTip
        ..scheduledTime = t
        ..title = 'Stay strong 💪'
        ..body =
            "This is typically a challenging time. Try a breathing exercise if needed."
        ..payload = _payload({'type': 'preventive', 'action': 'open_toolkit'});

      final saved = await _repo.save(n);
      await _push.scheduleNotification(
        id: saved.id,
        title: saved.title,
        body: saved.body,
        scheduledTime: t,
        payload: saved.payload,
      );
    }
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

  static const _milestones = [1, 3, 7, 14, 21, 30, 60, 90, 180, 365];

  bool _isMilestoneDay(Statistics stats) =>
      _milestones.contains(stats.currentStreak);

  String _milestoneMessage(int days) => switch (days) {
    1 => "You made it through the first day! That's huge!",
    3 => "Three days strong! You're building momentum!",
    7 => "One week! Your body is already healing!",
    14 => "Two weeks! You're crushing it!",
    21 => "Three weeks! New habits are forming!",
    30 => "One month! This is a major achievement!",
    60 => "Two months! You're unstoppable!",
    90 => "Three months! You've transformed your life!",
    180 => "Six months! You're an inspiration!",
    365 => "One YEAR! You're a legend!",
    _ => "Amazing streak! Keep going!",
  };

  Future<List<int>> _highRiskHours(String userId) async {
    final logs = await _trackingRepo.getLogEntries(userId);
    final counts = <int, int>{};

    for (final log in logs) {
      final typeName = log.type.name.toLowerCase();
      if (typeName.contains('craving') || typeName.contains('relapse')) {
        final h = log.timestamp.hour;
        counts[h] = (counts[h] ?? 0) + 1;
      }
    }

    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(3).map((e) => e.key).toList();
  }
}

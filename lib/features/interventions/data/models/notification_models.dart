import 'package:isar/isar.dart';

part 'notification_models.g.dart';

// ─── Enums ──────────────────────────────────────────────────────────────────

enum NotificationType {
  dailyCheckIn,
  encouragement,
  milestone,
  cravingTip,
  microChallenge,
  progressUpdate,
  streakReminder,
  healthFact,
  motivationalQuote;

  String get displayName => switch (this) {
    dailyCheckIn => 'Daily Check-in',
    encouragement => 'Encouragement',
    milestone => 'Milestone',
    cravingTip => 'Craving Tip',
    microChallenge => 'Micro Challenge',
    progressUpdate => 'Progress Update',
    streakReminder => 'Streak Reminder',
    healthFact => 'Health Fact',
    motivationalQuote => 'Motivation',
  };
}

enum NotificationFrequency {
  /// 1–2 per day
  low,

  /// 3–4 per day
  medium,

  /// 5–6 per day
  high;

  String get displayName => switch (this) {
    low => 'Low (1–2 daily)',
    medium => 'Medium (3–4 daily)',
    high => 'High (5–6 daily)',
  };

  int get maxPerDay => switch (this) {
    low => 2,
    medium => 4,
    high => 6,
  };
}

// ─── ScheduledNotification ──────────────────────────────────────────────────

@collection
class ScheduledNotification {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late NotificationType type;

  late String title;
  late String body;

  late DateTime scheduledTime;

  bool isSent = false;
  DateTime? sentAt;

  bool wasOpened = false;
  DateTime? openedAt;
  bool wasDismissed = false;

  /// JSON/query-string payload for deep-linking inside the app.
  String? payload;

  /// Denormalised stats stored at scheduling time for analytics.
  int? relatedStreakDays;
  int? relatedMoneySaved;

  late DateTime createdAt;

  ScheduledNotification() {
    createdAt = DateTime.now();
  }

  bool get isPending => !isSent && scheduledTime.isAfter(DateTime.now());
  bool get isOverdue => !isSent && scheduledTime.isBefore(DateTime.now());
}

// ─── NotificationPreferences ────────────────────────────────────────────────

@collection
class NotificationPreferences {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String userId;

  bool notificationsEnabled = true;

  @Enumerated(EnumType.name)
  NotificationFrequency frequency = NotificationFrequency.medium;

  // Quiet hours
  bool quietHoursEnabled = true;
  int quietHoursStart = 22; // 10 PM
  int quietHoursEnd = 8; // 8 AM

  // Per-type toggles
  bool dailyCheckInEnabled = true;
  bool encouragementEnabled = true;
  bool milestoneEnabled = true;
  bool cravingTipsEnabled = true;
  bool microChallengesEnabled = true;
  bool progressUpdatesEnabled = true;
  bool streakRemindersEnabled = true;
  bool healthFactsEnabled = true;
  bool motivationalQuotesEnabled = true;

  /// Hours-of-day the user prefers to receive messages (0–23).
  List<int> preferredHours = const [9, 12, 15, 18, 20];

  late DateTime createdAt;
  DateTime? updatedAt;

  NotificationPreferences() {
    createdAt = DateTime.now();
  }

  bool isTypeEnabled(NotificationType type) => switch (type) {
    NotificationType.dailyCheckIn => dailyCheckInEnabled,
    NotificationType.encouragement => encouragementEnabled,
    NotificationType.milestone => milestoneEnabled,
    NotificationType.cravingTip => cravingTipsEnabled,
    NotificationType.microChallenge => microChallengesEnabled,
    NotificationType.progressUpdate => progressUpdatesEnabled,
    NotificationType.streakReminder => streakRemindersEnabled,
    NotificationType.healthFact => healthFactsEnabled,
    NotificationType.motivationalQuote => motivationalQuotesEnabled,
  };

  /// Returns true when [time] falls inside the user's quiet-hours window.
  bool isInQuietHours(DateTime time) {
    if (!quietHoursEnabled) return false;
    final h = time.hour;
    return quietHoursStart < quietHoursEnd
    // same-day range e.g. 09:00–17:00
        ? h >= quietHoursStart && h < quietHoursEnd
    // overnight range e.g. 22:00–08:00
        : h >= quietHoursStart || h < quietHoursEnd;
  }
}

// ─── NotificationHistory ────────────────────────────────────────────────────

@collection
class NotificationHistory {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late NotificationType type;

  late String title;
  late String body;

  late DateTime sentAt;
  bool wasOpened = false;
  DateTime? openedAt;

  NotificationHistory();

  factory NotificationHistory.fromScheduled(ScheduledNotification n) =>
      NotificationHistory()
        ..userId = n.userId
        ..type = n.type
        ..title = n.title
        ..body = n.body
        ..sentAt = n.sentAt ?? DateTime.now()
        ..wasOpened = n.wasOpened
        ..openedAt = n.openedAt;
}

// ─── Value objects (not persisted) ──────────────────────────────────────────

class NotificationTemplate {
  final NotificationType type;
  final String title;
  final String body;
  final bool requiresUserData;

  const NotificationTemplate({
    required this.type,
    required this.title,
    required this.body,
    this.requiresUserData = false,
  });

  String formatTitle(Map<String, dynamic>? data) =>
      requiresUserData && data != null ? _replace(title, data) : title;

  String formatBody(Map<String, dynamic>? data) =>
      requiresUserData && data != null ? _replace(body, data) : body;

  String _replace(String text, Map<String, dynamic> data) {
    var result = text;
    data.forEach((k, v) => result = result.replaceAll('{$k}', '$v'));
    return result;
  }
}

class MicroChallenge {
  final String title;
  final String description;
  final int durationMinutes;

  /// 'breathing' | 'grounding' | 'physical' | 'mindful'
  final String actionType;

  const MicroChallenge({
    required this.title,
    required this.description,
    required this.durationMinutes,
    required this.actionType,
  });
}
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
  low,
  medium,
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

class ScheduledNotification {
  int id;
  String userId;
  NotificationType type;
  String title;
  String body;
  DateTime scheduledTime;
  bool isSent;
  DateTime? sentAt;
  bool wasOpened;
  DateTime? openedAt;
  bool wasDismissed;
  String? payload;
  int? relatedStreakDays;
  int? relatedMoneySaved;
  DateTime createdAt;

  ScheduledNotification({
    this.id = 0,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.scheduledTime,
    this.isSent = false,
    this.sentAt,
    this.wasOpened = false,
    this.openedAt,
    this.wasDismissed = false,
    this.payload,
    this.relatedStreakDays,
    this.relatedMoneySaved,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  bool get isPending => !isSent && scheduledTime.isAfter(DateTime.now());
  bool get isOverdue => !isSent && scheduledTime.isBefore(DateTime.now());
}

class NotificationPreferences {
  int id;
  String userId;
  bool notificationsEnabled;
  NotificationFrequency frequency;
  bool quietHoursEnabled;
  int quietHoursStart;
  int quietHoursEnd;
  bool dailyCheckInEnabled;
  bool encouragementEnabled;
  bool milestoneEnabled;
  bool cravingTipsEnabled;
  bool microChallengesEnabled;
  bool progressUpdatesEnabled;
  bool streakRemindersEnabled;
  bool healthFactsEnabled;
  bool motivationalQuotesEnabled;
  List<int> preferredHours;
  DateTime? permissionDeniedAt;
  String? userMode;
  bool quitDatePrepEnabled;
  DateTime createdAt;
  DateTime? updatedAt;

  NotificationPreferences({
    this.id = 0,
    required this.userId,
    this.notificationsEnabled = true,
    this.frequency = NotificationFrequency.medium,
    this.quietHoursEnabled = true,
    this.quietHoursStart = 22,
    this.quietHoursEnd = 8,
    this.dailyCheckInEnabled = true,
    this.encouragementEnabled = true,
    this.milestoneEnabled = true,
    this.cravingTipsEnabled = true,
    this.microChallengesEnabled = true,
    this.progressUpdatesEnabled = true,
    this.streakRemindersEnabled = true,
    this.healthFactsEnabled = true,
    this.motivationalQuotesEnabled = true,
    this.preferredHours = const [9, 12, 15, 18, 20],
    this.permissionDeniedAt,
    this.userMode,
    this.quitDatePrepEnabled = true,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

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

  bool isInQuietHours(DateTime time) {
    if (!quietHoursEnabled) return false;
    final h = time.hour;
    if (quietHoursStart == quietHoursEnd) return false;
    return quietHoursStart < quietHoursEnd
        ? h >= quietHoursStart && h < quietHoursEnd
        : h >= quietHoursStart || h < quietHoursEnd;
  }
}

class NotificationHistory {
  int id;
  String userId;
  NotificationType type;
  String title;
  String body;
  DateTime sentAt;
  bool wasOpened;
  DateTime? openedAt;

  NotificationHistory({
    this.id = 0,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    DateTime? sentAt,
    this.wasOpened = false,
    this.openedAt,
  }) : sentAt = sentAt ?? DateTime.now();

  factory NotificationHistory.fromScheduled(ScheduledNotification n) =>
      NotificationHistory(
        userId: n.userId,
        type: n.type,
        title: n.title,
        body: n.body,
        sentAt: n.sentAt ?? DateTime.now(),
        wasOpened: n.wasOpened,
        openedAt: n.openedAt,
      );
}

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
  final String actionType;

  const MicroChallenge({
    required this.title,
    required this.description,
    required this.durationMinutes,
    required this.actionType,
  });
}

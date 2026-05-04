import 'package:isar/isar.dart';

part 'notification_models.g.dart';

// ============= NOTIFICATION TYPES =============

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

  String get displayName {
    switch (this) {
      case NotificationType.dailyCheckIn:
        return 'Daily Check-in';
      case NotificationType.encouragement:
        return 'Encouragement';
      case NotificationType.milestone:
        return 'Milestone';
      case NotificationType.cravingTip:
        return 'Craving Tip';
      case NotificationType.microChallenge:
        return 'Micro Challenge';
      case NotificationType.progressUpdate:
        return 'Progress Update';
      case NotificationType.streakReminder:
        return 'Streak Reminder';
      case NotificationType.healthFact:
        return 'Health Fact';
      case NotificationType.motivationalQuote:
        return 'Motivation';
    }
  }
}

enum NotificationFrequency {
  low,      // 1-2 per day
  medium,   // 3-4 per day
  high;     // 5-6 per day

  String get displayName {
    switch (this) {
      case NotificationFrequency.low:
        return 'Low (1-2 daily)';
      case NotificationFrequency.medium:
        return 'Medium (3-4 daily)';
      case NotificationFrequency.high:
        return 'High (5-6 daily)';
    }
  }

  int get maxDailyNotifications {
    switch (this) {
      case NotificationFrequency.low:
        return 2;
      case NotificationFrequency.medium:
        return 4;
      case NotificationFrequency.high:
        return 6;
    }
  }
}

// ============= SCHEDULED NOTIFICATION =============

@collection
class ScheduledNotification {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late NotificationType type;

  late String title;
  late String body;

  // Scheduling
  late DateTime scheduledTime;
  bool isSent = false;
  DateTime? sentAt;

  // User interaction
  bool wasOpened = false;
  DateTime? openedAt;
  bool wasDismissed = false;

  // Adaptive content
  String? payload; // JSON data for deep linking
  int? relatedStreakDays;
  int? relatedMoneySaved;

  late DateTime createdAt;

  ScheduledNotification() {
    createdAt = DateTime.now();
  }

  bool get isPending => !isSent && scheduledTime.isAfter(DateTime.now());
  bool get isOverdue => !isSent && scheduledTime.isBefore(DateTime.now());
}

// ============= NOTIFICATION PREFERENCES =============

@collection
class NotificationPreferences {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String userId;

  // General settings
  bool notificationsEnabled = true;

  @Enumerated(EnumType.name)
  NotificationFrequency frequency = NotificationFrequency.medium;

  // Quiet hours
  bool quietHoursEnabled = false;
  int quietHoursStart = 22; // 10 PM
  int quietHoursEnd = 8;    // 8 AM

  // Type preferences
  bool dailyCheckInEnabled = true;
  bool encouragementEnabled = true;
  bool milestoneEnabled = true;
  bool cravingTipsEnabled = true;
  bool microChallengesEnabled = true;
  bool progressUpdatesEnabled = true;
  bool streakRemindersEnabled = true;
  bool healthFactsEnabled = true;
  bool motivationalQuotesEnabled = true;

  // Timing preferences
  List<int> preferredHours = [9, 12, 15, 18, 21]; // Default times

  late DateTime createdAt;
  DateTime? updatedAt;

  NotificationPreferences() {
    createdAt = DateTime.now();
  }

  bool isTypeEnabled(NotificationType type) {
    switch (type) {
      case NotificationType.dailyCheckIn:
        return dailyCheckInEnabled;
      case NotificationType.encouragement:
        return encouragementEnabled;
      case NotificationType.milestone:
        return milestoneEnabled;
      case NotificationType.cravingTip:
        return cravingTipsEnabled;
      case NotificationType.microChallenge:
        return microChallengesEnabled;
      case NotificationType.progressUpdate:
        return progressUpdatesEnabled;
      case NotificationType.streakReminder:
        return streakRemindersEnabled;
      case NotificationType.healthFact:
        return healthFactsEnabled;
      case NotificationType.motivationalQuote:
        return motivationalQuotesEnabled;
    }
  }

  bool isInQuietHours(DateTime time) {
    if (!quietHoursEnabled) return false;

    final hour = time.hour;

    if (quietHoursStart < quietHoursEnd) {
      // Normal range (e.g., 22:00 to 23:59)
      return hour >= quietHoursStart && hour < quietHoursEnd;
    } else {
      // Overnight range (e.g., 22:00 to 08:00)
      return hour >= quietHoursStart || hour < quietHoursEnd;
    }
  }
}

// ============= NOTIFICATION HISTORY =============

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

  factory NotificationHistory.fromScheduled(ScheduledNotification scheduled) {
    return NotificationHistory()
      ..userId = scheduled.userId
      ..type = scheduled.type
      ..title = scheduled.title
      ..body = scheduled.body
      ..sentAt = scheduled.sentAt ?? DateTime.now()
      ..wasOpened = scheduled.wasOpened
      ..openedAt = scheduled.openedAt;
  }
}

// ============= NOTIFICATION CONTENT TEMPLATES =============

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

  String formatTitle(Map<String, dynamic>? data) {
    if (!requiresUserData || data == null) return title;
    return _replaceVariables(title, data);
  }

  String formatBody(Map<String, dynamic>? data) {
    if (!requiresUserData || data == null) return body;
    return _replaceVariables(body, data);
  }

  String _replaceVariables(String text, Map<String, dynamic> data) {
    String result = text;
    data.forEach((key, value) {
      result = result.replaceAll('{$key}', value.toString());
    });
    return result;
  }
}

// ============= MICRO CHALLENGE =============

class MicroChallenge {
  final String title;
  final String description;
  final int durationMinutes;
  final String actionType; // 'breathing', 'grounding', 'physical', 'mindful'

  const MicroChallenge({
    required this.title,
    required this.description,
    required this.durationMinutes,
    required this.actionType,
  });
}
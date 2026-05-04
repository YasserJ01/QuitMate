import 'package:isar/isar.dart';

part 'log_entry.g.dart';

enum LogType {
  cigarette,
  episode, // For masturbation tracking
  craving,
  relapse;

  String get displayName {
    switch (this) {
      case LogType.cigarette:
        return 'Cigarette';
      case LogType.episode:
        return 'Episode';
      case LogType.craving:
        return 'Craving';
      case LogType.relapse:
        return 'Relapse';
    }
  }

  String get emoji {
    switch (this) {
      case LogType.cigarette:
        return '🚬';
      case LogType.episode:
        return '📱';
      case LogType.craving:
        return '😤';
      case LogType.relapse:
        return '⚠️';
    }
  }
}

enum MoodType {
  veryBad,
  bad,
  neutral,
  good,
  veryGood;

  String get displayName {
    switch (this) {
      case MoodType.veryBad:
        return 'Very Bad';
      case MoodType.bad:
        return 'Bad';
      case MoodType.neutral:
        return 'Neutral';
      case MoodType.good:
        return 'Good';
      case MoodType.veryGood:
        return 'Very Good';
    }
  }

  String get emoji {
    switch (this) {
      case MoodType.veryBad:
        return '😢';
      case MoodType.bad:
        return '😟';
      case MoodType.neutral:
        return '😐';
      case MoodType.good:
        return '🙂';
      case MoodType.veryGood:
        return '😄';
    }
  }

  int get value {
    switch (this) {
      case MoodType.veryBad:
        return 1;
      case MoodType.bad:
        return 2;
      case MoodType.neutral:
        return 3;
      case MoodType.good:
        return 4;
      case MoodType.veryGood:
        return 5;
    }
  }
}

@collection
class LogEntry {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late LogType type;

  late DateTime timestamp;

  // Optional fields
  @Enumerated(EnumType.name)
  MoodType? mood;

  // Triggers (from onboarding TriggerType)
  List<String> triggers = [];

  // Notes
  String? notes;

  // Quantity (for cigarettes)
  int? quantity;

  // Duration (for episodes or cravings in seconds)
  int? durationSeconds;

  // Intensity (1-10 scale for cravings)
  int? intensity;

  // Location/Context
  String? location;

  // Was this a successful resistance?
  bool? wasResisted;

  // Metadata
  late DateTime createdAt;
  DateTime? updatedAt;

  LogEntry() {
    createdAt = DateTime.now();
    timestamp = DateTime.now();
  }

  // Helper methods
  bool get isToday {
    final now = DateTime.now();
    return timestamp.year == now.year &&
        timestamp.month == now.month &&
        timestamp.day == now.day;
  }

  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return timestamp.isAfter(startOfWeek);
  }

  bool get isThisMonth {
    final now = DateTime.now();
    return timestamp.year == now.year && timestamp.month == now.month;
  }

  String get formattedTime {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get formattedDate {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[timestamp.month - 1]} ${timestamp.day}, ${timestamp.year}';
  }
}
import 'package:isar/isar.dart';

part 'log_entry.g.dart';

enum LogType {
  cravingLogged,
  cravingDelayed,
  lapse,
  triggerObserved,
  copingAction,
  lapseRecovery,
  dailyCheckin,
  journalEntry,
  cigaretteSmoked,
  replacementAction,
  urgeEpisode,
  pornExposure,
}

enum MoodType {
  veryBad,
  bad,
  neutral,
  good,
  veryGood,
}

@collection
class LogEntry {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Enumerated(EnumType.name)
  late LogType type;

  late DateTime timestamp;

  @Enumerated(EnumType.name)
  MoodType? mood;

  List<String> triggers = [];

  String? notes;

  int? quantity;

  int? durationSeconds;

  int? intensity;

  int? distressRating;

  String? location;

  bool? wasResisted;

  late DateTime createdAt;
  DateTime? updatedAt;

  LogEntry() {
    createdAt = DateTime.now().toUtc();
    timestamp = DateTime.now().toUtc();
  }

  bool get isToday {
    final now = DateTime.now();
    final localTimestamp = timestamp.toLocal();
    return localTimestamp.year == now.year &&
        localTimestamp.month == now.month &&
        localTimestamp.day == now.day;
  }

  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return timestamp.toLocal().isAfter(startOfWeek);
  }

  bool get isThisMonth {
    final now = DateTime.now();
    final localTimestamp = timestamp.toLocal();
    return localTimestamp.year == now.year && localTimestamp.month == now.month;
  }

  String get formattedTime {
    final localTimestamp = timestamp.toLocal();
    final hour = localTimestamp.hour.toString().padLeft(2, '0');
    final minute = localTimestamp.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get formattedDate {
    final localTimestamp = timestamp.toLocal();
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[localTimestamp.month - 1]} ${localTimestamp.day}, ${localTimestamp.year}';
  }
}

// ── Extension methods for LogType display ──────────────────────────────────

extension LogTypeDisplay on LogType {
  String get displayName {
    switch (this) {
      case LogType.cravingLogged:
        return 'Craving Logged';
      case LogType.cravingDelayed:
        return 'Craving Delayed';
      case LogType.lapse:
        return 'Lapse';
      case LogType.triggerObserved:
        return 'Trigger Observed';
      case LogType.copingAction:
        return 'Coping Action';
      case LogType.lapseRecovery:
        return 'Lapse Recovery';
      case LogType.dailyCheckin:
        return 'Daily Check-in';
      case LogType.journalEntry:
        return 'Journal Entry';
      case LogType.cigaretteSmoked:
        return 'Cigarette Smoked';
      case LogType.replacementAction:
        return 'Replacement Action';
      case LogType.urgeEpisode:
        return 'Urge Episode';
      case LogType.pornExposure:
        return 'Exposure';
    }
  }

  String get emoji {
    switch (this) {
      case LogType.cravingLogged:
        return '😤';
      case LogType.cravingDelayed:
        return '⏰';
      case LogType.lapse:
        return '⚠️';
      case LogType.triggerObserved:
        return '👁️';
      case LogType.copingAction:
        return '🛡️';
      case LogType.lapseRecovery:
        return '💚';
      case LogType.dailyCheckin:
        return '📋';
      case LogType.journalEntry:
        return '📝';
      case LogType.cigaretteSmoked:
        return '🚬';
      case LogType.replacementAction:
        return '🔄';
      case LogType.urgeEpisode:
        return '📱';
      case LogType.pornExposure:
        return '👁️';
    }
  }

  bool isLapseFor(bool isSmokingMode) {
    if (this == LogType.lapse) return true;
    if (isSmokingMode && this == LogType.cigaretteSmoked) return true;
    if (!isSmokingMode && this == LogType.urgeEpisode) return true;
    return false;
  }
}

// ── Extension methods for MoodType display ─────────────────────────────────

extension MoodTypeDisplay on MoodType {
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

// ── Legacy name mapping ───────────────────────────────────────────────────

LogType? logTypeFromLegacyName(String name) {
  const legacyMap = {
    'cigarette': LogType.cigaretteSmoked,
    'episode': LogType.urgeEpisode,
    'craving': LogType.cravingLogged,
    'relapse': LogType.lapse,
  };
  return legacyMap[name];
}

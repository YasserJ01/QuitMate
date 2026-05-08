import '../data/models/log_entry.dart';
import '../data/models/craving_entry.dart';
import '../data/models/statistics.dart';
import '../../../features/onboarding/data/models/user_profile.dart';

class StatisticsCalculator {
  /// Calculate comprehensive statistics for a user
  static Statistics calculateStatistics({
    required List<LogEntry> logs,
    required List<CravingEntry> cravings,
    required UserProfile profile,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? referenceDate,
  }) {
    final now = referenceDate ?? DateTime.now();

    // Filter logs by date range if specified
    final filteredLogs = _filterByDateRange(logs, startDate, endDate);
    final filteredCravings = _filterCravingsByDateRange(cravings, startDate, endDate);

    // Calculate streak data
    final streakData = _calculateStreakData(filteredLogs, profile, now);

    // Calculate counts
    final counts = _calculateCounts(filteredLogs, filteredCravings);

    // Calculate money saved (smoking only)
    final moneySaved = _calculateMoneySaved(filteredLogs, profile, now);

    // Calculate time metrics
    final timeMetrics = _calculateTimeMetrics(filteredLogs, profile, now);

    // Calculate trend data
    final trendData = _calculateTrendData(filteredLogs);

    // Calculate success rates
    final successRates = _calculateSuccessRates(filteredCravings, now);

    // Calculate health metrics
    final healthMetrics = _calculateHealthMetrics(filteredLogs, profile, now);

    // Calculate time reclaimed (reduction mode)
    final timeReclaimed = _calculateTimeReclaimed(filteredLogs, profile);

    // Calculate distress trend (reduction mode)
    final distressTrend = _calculateDistressTrend(filteredLogs);

    return Statistics(
      currentStreak: streakData['currentStreak']!,
      longestStreak: streakData['longestStreak']!,
      lastLogDate: streakData['lastLogDate'],
      streakStartDate: streakData['streakStartDate'],
      totalCigarettes: counts['cigarettes']!,
      totalEpisodes: counts['episodes']!,
      totalCravings: counts['cravings']!,
      totalRelapses: counts['relapses']!,
      cravingsResisted: counts['cravingsResisted']!,
      moneySaved: moneySaved['saved']!,
      potentialMoneySaved: moneySaved['potential']!,
      daysTracking: timeMetrics['daysTracking']!,
      daysClean: timeMetrics['daysClean']!,
      averagePerDay: timeMetrics['averagePerDay']!,
      dailyCounts: trendData['dailyCounts']!,
      triggerFrequency: trendData['triggerFrequency']!,
      hourlyDistribution: trendData['hourlyDistribution']!,
      cravingResistanceRate: successRates['resistanceRate']!,
      weeklyImprovement: successRates['weeklyImprovement']!,
      cigarettesAvoided: healthMetrics['cigarettesAvoided']!,
      lifeMinutesGained: healthMetrics['lifeMinutesGained']!,
      recoveryCount: streakData['recoveryCount']!,
      timeReclaimedMinutes: timeReclaimed['timeReclaimedMinutes'],
      episodesAvoided: timeReclaimed['episodesAvoided'],
      distressTrend: distressTrend,
    );
  }

  // ============= STREAK CALCULATIONS (FIXED) ==============================

  static Map<String, dynamic> _calculateStreakData(
    List<LogEntry> logs,
    UserProfile profile,
    DateTime now,
  ) {
    if (profile.quitDate == null) {
      return {
        'currentStreak': 0,
        'longestStreak': 0,
        'lastLogDate': null,
        'streakStartDate': null,
        'recoveryCount': profile.recoveryCount,
      };
    }

    final quitDate = profile.quitDate!;

    // Sort logs by date (oldest first)
    final sortedLogs = List<LogEntry>.from(logs)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Group logs by day
    final logsByDay = <DateTime, List<LogEntry>>{};
    for (final log in sortedLogs) {
      final localTs = log.timestamp.toLocal();
      final day = DateTime(localTs.year, localTs.month, localTs.day);
      logsByDay.putIfAbsent(day, () => []).add(log);
    }

    // Calculate streaks day by day
    final quitDateLocal = quitDate.toLocal();
    DateTime checkDate = DateTime(quitDateLocal.year, quitDateLocal.month, quitDateLocal.day);
    final today = DateTime(now.year, now.month, now.day);

    int longestStreak = 0;
    int tempStreak = 0;
    DateTime? tempStartDate = quitDateLocal;
    DateTime? currentStreakStartDate = quitDateLocal;
    int relapseCount = 0;

    final isSmokingMode = profile.goalType.name.toLowerCase().contains('smoking');

    // Iterate from quit date to today (inclusive)
    while (checkDate.isBefore(today) || checkDate.isAtSameMomentAs(today)) {
      final dayLogs = logsByDay[checkDate] ?? [];
      final hadLapse = dayLogs.any((log) => log.type.isLapseFor(isSmokingMode));

      if (hadLapse) {
        // Capture longest streak BEFORE resetting
        if (tempStreak > longestStreak) {
          longestStreak = tempStreak;
        }
        // Reset streak — longestStreak is preserved
        tempStreak = 0;
        relapseCount++;
        // Next potential streak starts tomorrow
        tempStartDate = checkDate.add(const Duration(days: 1));
      } else {
        // Clean day
        tempStreak++;
        if (tempStreak == 1) {
          currentStreakStartDate = tempStartDate;
        }
      }

      checkDate = checkDate.add(const Duration(days: 1));
    }

    // The streak at the end of the loop is the current streak
    int currentStreak = tempStreak;

    // Final longest streak check
    if (currentStreak > longestStreak) {
      longestStreak = currentStreak;
    }

    if (currentStreak == 0) {
      currentStreakStartDate = null;
    }

    return {
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastLogDate': sortedLogs.isNotEmpty ? sortedLogs.last.timestamp : null,
      'streakStartDate': currentStreakStartDate,
      'recoveryCount': profile.recoveryCount + relapseCount,
    };
  }

  // ============= COUNT CALCULATIONS ==============================

  static Map<String, int> _calculateCounts(
    List<LogEntry> logs,
    List<CravingEntry> cravings,
  ) {
    int cigarettes = 0;
    int episodes = 0;
    int totalCravings = cravings.length;
    int relapses = 0;
    int cravingsResisted = 0;

    for (final log in logs) {
      switch (log.type) {
        case LogType.cigaretteSmoked:
          cigarettes += log.quantity ?? 1;
          break;
        case LogType.urgeEpisode:
          episodes++;
          break;
        case LogType.cravingLogged:
        case LogType.cravingDelayed:
          // Counted in cravings or separate
          break;
        case LogType.lapse:
          relapses++;
          break;
        default:
          break;
      }
    }

    // Count resisted cravings
    for (final craving in cravings) {
      if (craving.wasSuccessfullyResisted) {
        cravingsResisted++;
      }
    }

    return {
      'cigarettes': cigarettes,
      'episodes': episodes,
      'cravings': totalCravings,
      'relapses': relapses,
      'cravingsResisted': cravingsResisted,
    };
  }

  // ============= MONEY CALCULATIONS ==============================

  static Map<String, double> _calculateMoneySaved(
    List<LogEntry> logs,
    UserProfile profile,
    DateTime now,
  ) {
    if (profile.quitDate == null || profile.dailySmokingCost == null) {
      return {'saved': 0.0, 'potential': 0.0};
    }

    final daysSinceQuit = now.difference(profile.quitDate!).inDays;

    // Potential money if user had continued smoking at baseline rate
    final potentialMoneySaved = profile.dailySmokingCost! * daysSinceQuit;

    // Calculate actual cigarettes smoked
    final actualCigarettes = logs
        .where((log) => log.type == LogType.cigaretteSmoked)
        .fold<int>(0, (sum, log) => sum + (log.quantity ?? 1));

    // Calculate cost of actual cigarettes
    final costPerCigarette = profile.dailySmokingCost! / profile.cigarettesPerDay!;
    final actualCost = actualCigarettes * costPerCigarette;

    // Money saved is potential minus actual
    final moneySaved = potentialMoneySaved - actualCost;

    return {
      'saved': moneySaved.clamp(0.0, double.infinity),
      'potential': potentialMoneySaved,
    };
  }

  // ============= TIME METRICS ==============================

  static Map<String, dynamic> _calculateTimeMetrics(
    List<LogEntry> logs,
    UserProfile profile,
    DateTime now,
  ) {
    if (profile.quitDate == null) {
      return {
        'daysTracking': 0,
        'daysClean': 0,
        'averagePerDay': 0.0,
      };
    }

    final quitDate = profile.quitDate!;

    // Normalize dates to start of day
    final startDate = DateTime(quitDate.year, quitDate.month, quitDate.day);
    final today = DateTime(now.year, now.month, now.day);

    // Days tracking is inclusive of today
    final daysTracking = today.difference(startDate).inDays + 1;

    // Calculate days clean
    int daysClean = 0;

    final isSmokingMode = profile.goalType.name.toLowerCase().contains('smoking');

    final logsByDay = <DateTime, List<LogEntry>>{};
    for (final log in logs) {
      if (log.type.isLapseFor(isSmokingMode)) {
        final localTs = log.timestamp.toLocal();
        final day = DateTime(localTs.year, localTs.month, localTs.day);
        logsByDay.putIfAbsent(day, () => []).add(log);
      }
    }

    DateTime checkDate = startDate;
    while (checkDate.isBefore(today) || checkDate.isAtSameMomentAs(today)) {
      if (!logsByDay.containsKey(checkDate)) {
        daysClean++;
      }
      checkDate = checkDate.add(const Duration(days: 1));
    }

    // Calculate average relapses per day
    double averagePerDay = 0.0;
    if (daysTracking > 0) {
      final totalRelapses = logs.where((log) => log.type.isLapseFor(isSmokingMode)).length;
      averagePerDay = totalRelapses / daysTracking;
    }

    return {
      'daysTracking': daysTracking.clamp(0, double.infinity).toInt(),
      'daysClean': daysClean.clamp(0, double.infinity).toInt(),
      'averagePerDay': averagePerDay,
    };
  }

  // ============= TIME RECLAIMED (REDUCTION MODE) ====================

  static Map<String, dynamic> _calculateTimeReclaimed(
    List<LogEntry> logs,
    UserProfile profile,
  ) {
    if (profile.episodeDurationMinutes == null || profile.episodesPerWeek == null || profile.quitDate == null) {
      return {'timeReclaimedMinutes': null, 'episodesAvoided': null};
    }

    final now = DateTime.now();
    final daysSinceStart = now.difference(profile.quitDate!).inDays;
    if (daysSinceStart <= 0) {
      return {'timeReclaimedMinutes': 0, 'episodesAvoided': 0};
    }

    final baselineEpisodes = (profile.episodesPerWeek! / 7) * daysSinceStart;
    final actualEpisodes = logs.where((l) => l.type == LogType.urgeEpisode).length;
    final episodesAvoided = (baselineEpisodes - actualEpisodes).clamp(0, double.infinity).toInt();
    final timeReclaimedMinutes = episodesAvoided * profile.episodeDurationMinutes!;

    return {
      'timeReclaimedMinutes': timeReclaimedMinutes,
      'episodesAvoided': episodesAvoided,
    };
  }

  // ============= DISTRESS TREND (REDUCTION MODE) ====================

  static List<double> _calculateDistressTrend(List<LogEntry> logs) {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));

    final checkins = logs
        .where((l) => l.type == LogType.dailyCheckin && l.distressRating != null && l.timestamp.isAfter(sevenDaysAgo))
        .toList();

    // Group by day and take the latest rating per day
    final byDay = <DateTime, double>{};
    for (final log in checkins) {
      final localTs = log.timestamp.toLocal();
      final day = DateTime(localTs.year, localTs.month, localTs.day);
      // Keep latest rating for each day
      byDay[day] = log.distressRating!.toDouble();
    }

    // Return sorted by date ascending
    final sorted = byDay.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
    return sorted.map((e) => e.value).toList();
  }

  // ============= TREND DATA ==============================

  static Map<String, dynamic> _calculateTrendData(List<LogEntry> logs) {
    final dailyCounts = <DateTime, int>{};
    final triggerFrequency = <String, int>{};
    final hourlyDistribution = <int, int>{};

    for (final log in logs) {
      final localTs = log.timestamp.toLocal();
      final day = DateTime(localTs.year, localTs.month, localTs.day);
      dailyCounts[day] = (dailyCounts[day] ?? 0) + 1;

      for (final trigger in log.triggers) {
        triggerFrequency[trigger] = (triggerFrequency[trigger] ?? 0) + 1;
      }

      final hour = localTs.hour;
      hourlyDistribution[hour] = (hourlyDistribution[hour] ?? 0) + 1;
    }

    return {
      'dailyCounts': dailyCounts,
      'triggerFrequency': triggerFrequency,
      'hourlyDistribution': hourlyDistribution,
    };
  }

  // ============= SUCCESS RATES ==============================

  static Map<String, double> _calculateSuccessRates(
    List<CravingEntry> cravings,
    DateTime now,
  ) {
    if (cravings.isEmpty) {
      return {
        'resistanceRate': 0.0,
        'weeklyImprovement': 0.0,
      };
    }

    final resistedCount = cravings.where((c) => c.wasSuccessfullyResisted).length;
    final resistanceRate = (resistedCount / cravings.length) * 100;

    final oneWeekAgo = now.subtract(const Duration(days: 7));
    final twoWeeksAgo = now.subtract(const Duration(days: 14));

    final lastWeekCravings = cravings.where((c) => c.startTime.isAfter(oneWeekAgo)).toList();
    final previousWeekCravings = cravings
        .where((c) => c.startTime.isAfter(twoWeeksAgo) && c.startTime.isBefore(oneWeekAgo))
        .toList();

    double weeklyImprovement = 0.0;

    if (lastWeekCravings.isNotEmpty && previousWeekCravings.isNotEmpty) {
      final lastWeekRate = (lastWeekCravings.where((c) => c.wasSuccessfullyResisted).length / lastWeekCravings.length) * 100;
      final previousWeekRate = (previousWeekCravings.where((c) => c.wasSuccessfullyResisted).length / previousWeekCravings.length) * 100;
      weeklyImprovement = lastWeekRate - previousWeekRate;
    }

    return {
      'resistanceRate': resistanceRate,
      'weeklyImprovement': weeklyImprovement,
    };
  }

  // ============= HEALTH METRICS ==============================

  static Map<String, dynamic> _calculateHealthMetrics(
    List<LogEntry> logs,
    UserProfile profile,
    DateTime now,
  ) {
    if (profile.quitDate == null || profile.cigarettesPerDay == null) {
      return {
        'cigarettesAvoided': 0,
        'lifeMinutesGained': 0.0,
      };
    }

    final daysSinceQuit = now.difference(profile.quitDate!).inDays;

    final potentialCigarettes = profile.cigarettesPerDay! * daysSinceQuit;

    final actualCigarettes = logs
        .where((log) => log.type == LogType.cigaretteSmoked)
        .fold<int>(0, (sum, log) => sum + (log.quantity ?? 1));

    final cigarettesAvoided = (potentialCigarettes - actualCigarettes).clamp(0, double.infinity).toInt();
    final lifeMinutesGained = cigarettesAvoided * 11.0;

    return {
      'cigarettesAvoided': cigarettesAvoided,
      'lifeMinutesGained': lifeMinutesGained,
    };
  }

  // ============= HELPER METHODS ==============================

  static List<LogEntry> _filterByDateRange(
    List<LogEntry> logs,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    return logs.where((log) {
      if (startDate != null && log.timestamp.isBefore(startDate)) return false;
      if (endDate != null && log.timestamp.isAfter(endDate)) return false;
      return true;
    }).toList();
  }

  static List<CravingEntry> _filterCravingsByDateRange(
    List<CravingEntry> cravings,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    return cravings.where((craving) {
      if (startDate != null && craving.startTime.isBefore(startDate)) return false;
      if (endDate != null && craving.startTime.isAfter(endDate)) return false;
      return true;
    }).toList();
  }

  // ============= CHART DATA GENERATORS ==============================

  static List<ChartDataPoint> generateDailyChartData(
    List<LogEntry> logs,
    TimeRange timeRange, {
    LogType? filterByType,
  }) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) {
      if (log.timestamp.isBefore(startDate)) return false;
      if (filterByType != null && log.type != filterByType) return false;
      return true;
    }).toList();

    final countsByDay = <DateTime, int>{};
    for (final log in filteredLogs) {
      final localTs = log.timestamp.toLocal();
      final day = DateTime(localTs.year, localTs.month, localTs.day);
      countsByDay[day] = (countsByDay[day] ?? 0) + 1;
    }

    final dataPoints = <ChartDataPoint>[];
    final sortedDates = countsByDay.keys.toList()..sort();

    for (final date in sortedDates) {
      dataPoints.add(ChartDataPoint(date: date, value: countsByDay[date]!.toDouble()));
    }

    return dataPoints;
  }

  static List<ChartDataPoint> generateWeeklyChartData(
    List<LogEntry> logs,
    TimeRange timeRange,
  ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) => log.timestamp.isAfter(startDate)).toList();

    final countsByWeek = <DateTime, int>{};
    for (final log in filteredLogs) {
      final weekStart = _getWeekStart(log.timestamp);
      countsByWeek[weekStart] = (countsByWeek[weekStart] ?? 0) + 1;
    }

    final dataPoints = <ChartDataPoint>[];
    final sortedWeeks = countsByWeek.keys.toList()..sort();

    for (final week in sortedWeeks) {
      dataPoints.add(ChartDataPoint(
        date: week,
        value: countsByWeek[week]!.toDouble(),
        label: 'Week of ${week.month}/${week.day}',
      ));
    }

    return dataPoints;
  }

  static List<MapEntry<String, int>> generateTriggerFrequencyData(
    List<LogEntry> logs,
    TimeRange timeRange,
  ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) => log.timestamp.isAfter(startDate)).toList();

    final triggerCounts = <String, int>{};
    for (final log in filteredLogs) {
      for (final trigger in log.triggers) {
        triggerCounts[trigger] = (triggerCounts[trigger] ?? 0) + 1;
      }
    }

    final sortedTriggers = triggerCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return sortedTriggers;
  }

  static Map<int, int> generateHourlyDistributionData(
    List<LogEntry> logs,
    TimeRange timeRange,
  ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) => log.timestamp.isAfter(startDate)).toList();

    final hourlyCount = <int, int>{};
    for (int i = 0; i < 24; i++) {
      hourlyCount[i] = 0;
    }

    for (final log in filteredLogs) {
      final hour = log.timestamp.toLocal().hour;
      hourlyCount[hour] = hourlyCount[hour]! + 1;
    }

    return hourlyCount;
  }

  static List<ChartDataPoint> generateMoodTrendData(
    List<LogEntry> logs,
    TimeRange timeRange,
  ) {
    final startDate = timeRange.getStartDate();
    final logsWithMood = logs.where((log) {
      return log.timestamp.isAfter(startDate) && log.mood != null;
    }).toList();

    final moodByDay = <DateTime, List<int>>{};
    for (final log in logsWithMood) {
      final localTs = log.timestamp.toLocal();
      final day = DateTime(localTs.year, localTs.month, localTs.day);
      moodByDay.putIfAbsent(day, () => []).add(log.mood!.value);
    }

    final dataPoints = <ChartDataPoint>[];
    final sortedDays = moodByDay.keys.toList()..sort();

    for (final day in sortedDays) {
      final moods = moodByDay[day]!;
      final averageMood = moods.reduce((a, b) => a + b) / moods.length;
      dataPoints.add(ChartDataPoint(date: day, value: averageMood));
    }

    return dataPoints;
  }

  static DateTime _getWeekStart(DateTime date) {
    final dayOfWeek = date.weekday;
    return DateTime(date.year, date.month, date.day).subtract(Duration(days: dayOfWeek - 1));
  }

  // ============= PROGRESS CALCULATIONS ==============================

  static double calculateProgressPercentage(
    UserProfile profile,
    Statistics stats, {
    DateTime? now,
  }) {
    if (profile.quitDate == null) return 0.0;

    final milestones = [7, 14, 30, 60, 90, 180, 365];

    int currentMilestone = 0;
    for (final milestone in milestones) {
      if (stats.currentStreak >= milestone) {
        currentMilestone = milestone;
      } else {
        break;
      }
    }

    int? nextMilestone;
    for (final milestone in milestones) {
      if (milestone > stats.currentStreak) {
        nextMilestone = milestone;
        break;
      }
    }

    if (nextMilestone == null) return 100.0;

    final progressInMilestone = stats.currentStreak - currentMilestone;
    

    return ((currentMilestone + progressInMilestone) / nextMilestone) * 100;
  }

  static Map<String, dynamic> getNextMilestone(int currentStreak) {
    final milestones = [
      {'days': 1, 'name': 'First Day', 'emoji': '🎯'},
      {'days': 3, 'name': '3 Days', 'emoji': '💪'},
      {'days': 7, 'name': '1 Week', 'emoji': '🌟'},
      {'days': 14, 'name': '2 Weeks', 'emoji': '🚀'},
      {'days': 30, 'name': '1 Month', 'emoji': '🏆'},
      {'days': 60, 'name': '2 Months', 'emoji': '🎊'},
      {'days': 90, 'name': '3 Months', 'emoji': '🎉'},
      {'days': 180, 'name': '6 Months', 'emoji': '👑'},
      {'days': 365, 'name': '1 Year', 'emoji': '🏅'},
    ];

    for (final milestone in milestones) {
      if (currentStreak < (milestone['days'] as int)) {
        return {
          'days': milestone['days'],
          'name': milestone['name'],
          'emoji': milestone['emoji'],
          'daysRemaining': (milestone['days'] as int) - currentStreak,
        };
      }
    }

    return {
      'days': 365,
      'name': 'Champion',
      'emoji': '👑',
      'daysRemaining': 0,
    };
  }

  /// Format streak display — shows hours/minutes when currentStreak is 0
  /// and quit date is today.
  static String formatStreakDisplay(int days, DateTime? quitDate) {
    if (days == 0 && quitDate != null) {
      final now = DateTime.now();
      final diff = now.difference(quitDate.toLocal());
      if (diff.inHours < 24 && diff.inHours >= 0) {
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '${hours}h ${minutes}m';
      }
    }
    return '$days ${days == 1 ? "Day" : "Days"}';
  }
}

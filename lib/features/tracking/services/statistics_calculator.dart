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
  }) {
    // Filter logs by date range if specified
    final filteredLogs = _filterByDateRange(logs, startDate, endDate);
    final filteredCravings = _filterCravingsByDateRange(cravings, startDate, endDate);

    // Calculate streak data
    final streakData = _calculateStreakData(filteredLogs, profile);

    // Calculate counts
    final counts = _calculateCounts(filteredLogs, filteredCravings);

    // Calculate money saved (smoking only)
    final moneySaved = _calculateMoneySaved(filteredLogs, profile);

    // Calculate time metrics
    final timeMetrics = _calculateTimeMetrics(filteredLogs, profile);

    // Calculate trend data
    final trendData = _calculateTrendData(filteredLogs);

    // Calculate success rates
    final successRates = _calculateSuccessRates(filteredCravings);

    // Calculate health metrics
    final healthMetrics = _calculateHealthMetrics(filteredLogs, profile);

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
    );
  }

  // ============= STREAK CALCULATIONS =============

  static Map<String, dynamic> _calculateStreakData(
      List<LogEntry> logs,
      UserProfile profile,
      ) {
    if (logs.isEmpty || profile.quitDate == null) {
      return {
        'currentStreak': 0,
        'longestStreak': 0,
        'lastLogDate': null,
        'streakStartDate': null,
      };
    }

    final now = DateTime.now();
    final quitDate = profile.quitDate!;

    // Sort logs by date (oldest first)
    final sortedLogs = List<LogEntry>.from(logs)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Calculate current streak (days without relapse/slip)
    int currentStreak = 0;
    DateTime? streakStartDate;
    DateTime? lastRelapseDate;

    // Find the most recent relapse
    for (var i = sortedLogs.length - 1; i >= 0; i--) {
      final log = sortedLogs[i];
      if (_isRelapse(log, profile)) {
        lastRelapseDate = log.timestamp;
        break;
      }
    }

    // Calculate current streak
    if (lastRelapseDate == null) {
      // No relapses since quit date
      currentStreak = now.difference(quitDate).inDays;
      streakStartDate = quitDate;
    } else if (lastRelapseDate.isBefore(now)) {
      // Days since last relapse
      currentStreak = now.difference(lastRelapseDate).inDays;
      streakStartDate = lastRelapseDate;
    }

    // Calculate longest streak
    int longestStreak = currentStreak;
    int tempStreak = 0;
    DateTime? tempStartDate = quitDate;

    // Group logs by day
    final logsByDay = <DateTime, List<LogEntry>>{};
    for (final log in sortedLogs) {
      final day = DateTime(
        log.timestamp.year,
        log.timestamp.month,
        log.timestamp.day,
      );
      logsByDay.putIfAbsent(day, () => []).add(log);
    }

    // Calculate streaks day by day
    DateTime checkDate = DateTime(quitDate.year, quitDate.month, quitDate.day);
    final today = DateTime(now.year, now.month, now.day);

    while (checkDate.isBefore(today) || checkDate.isAtSameMomentAs(today)) {
      final dayLogs = logsByDay[checkDate] ?? [];
      final hadRelapse = dayLogs.any((log) => _isRelapse(log, profile));

      if (hadRelapse) {
        if (tempStreak > longestStreak) {
          longestStreak = tempStreak;
        }
        tempStreak = 0;
        tempStartDate = checkDate.add(const Duration(days: 1));
      } else {
        tempStreak++;
      }

      checkDate = checkDate.add(const Duration(days: 1));
    }

    // Check if temp streak is the longest
    if (tempStreak > longestStreak) {
      longestStreak = tempStreak;
    }

    return {
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastLogDate': sortedLogs.isNotEmpty ? sortedLogs.last.timestamp : null,
      'streakStartDate': streakStartDate,
    };
  }

  static bool _isRelapse(LogEntry log, UserProfile profile) {
    // For smoking: any cigarette is a relapse
    if (profile.goalType.name.contains('smoking') &&
        log.type == LogType.cigarette) {
      return true;
    }

    // For masturbation: episodes are relapses
    if (profile.goalType.name.contains('masturbation') &&
        log.type == LogType.episode) {
      return true;
    }

    // Explicit relapse logs
    if (log.type == LogType.relapse) {
      return true;
    }

    return false;
  }

  // ============= COUNT CALCULATIONS =============

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
        case LogType.cigarette:
          cigarettes += log.quantity ?? 1;
          break;
        case LogType.episode:
          episodes++;
          break;
        case LogType.craving:
        // Already counted in cravings list
          break;
        case LogType.relapse:
          relapses++;
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

  // ============= MONEY CALCULATIONS =============

  static Map<String, double> _calculateMoneySaved(
      List<LogEntry> logs,
      UserProfile profile,
      ) {
    if (profile.quitDate == null || profile.dailySmokingCost == null) {
      return {'saved': 0.0, 'potential': 0.0};
    }

    final now = DateTime.now();
    final daysSinceQuit = now.difference(profile.quitDate!).inDays;

    // Potential money if user had continued smoking at baseline rate
    final potentialMoneySaved = profile.dailySmokingCost! * daysSinceQuit;

    // Calculate actual cigarettes smoked
    final actualCigarettes = logs
        .where((log) => log.type == LogType.cigarette)
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

  // ============= TIME METRICS =============

  static Map<String, dynamic> _calculateTimeMetrics(
      List<LogEntry> logs,
      UserProfile profile,
      ) {
    if (profile.quitDate == null) {
      return {
        'daysTracking': 0,
        'daysClean': 0,
        'averagePerDay': 0.0,
      };
    }

    final now = DateTime.now();
    // Ensure the quitDate is not in the future for calculation
    final startDate = profile.quitDate!.isAfter(now) ? now : profile.quitDate!;
    final daysTracking = now.difference(startDate).inDays;

    // Calculate days clean (no relapses)
    final relapses = logs.where((log) => _isRelapse(log, profile)).toList();
    int daysClean = 0;

    if (relapses.isEmpty) {
      daysClean = daysTracking;
    } else {
      final lastRelapse = relapses.last.timestamp;
      // Prevent negative days if last relapse is in the future (data integrity check)
      if (lastRelapse.isBefore(now)) {
        daysClean = now.difference(lastRelapse).inDays;
      }
    }

    // Calculate average logs per day
    double averagePerDay = 0.0;
    if (daysTracking > 0) {
      // Count actual relapse events (cigarettes or episodes)
      final relapseCount = logs.where((log) => _isRelapse(log, profile)).length;
      averagePerDay = relapseCount / daysTracking;
    }

    return {
      // Clamp the final values to ensure they are never negative
      'daysTracking': daysTracking.clamp(0, double.infinity).toInt(),
      'daysClean': daysClean.clamp(0, double.infinity).toInt(),
      'averagePerDay': averagePerDay,
    };
  }

  // ============= TREND DATA =============

  static Map<String, dynamic> _calculateTrendData(List<LogEntry> logs) {
    // Daily counts
    final dailyCounts = <DateTime, int>{};

    // Trigger frequency
    final triggerFrequency = <String, int>{};

    // Hourly distribution
    final hourlyDistribution = <int, int>{};

    for (final log in logs) {
      // Daily counts
      final day = DateTime(
        log.timestamp.year,
        log.timestamp.month,
        log.timestamp.day,
      );
      dailyCounts[day] = (dailyCounts[day] ?? 0) + 1;

      // Trigger frequency
      for (final trigger in log.triggers) {
        triggerFrequency[trigger] = (triggerFrequency[trigger] ?? 0) + 1;
      }

      // Hourly distribution
      final hour = log.timestamp.hour;
      hourlyDistribution[hour] = (hourlyDistribution[hour] ?? 0) + 1;
    }

    return {
      'dailyCounts': dailyCounts,
      'triggerFrequency': triggerFrequency,
      'hourlyDistribution': hourlyDistribution,
    };
  }

  // ============= SUCCESS RATES =============

  static Map<String, double> _calculateSuccessRates(
      List<CravingEntry> cravings,
      ) {
    if (cravings.isEmpty) {
      return {
        'resistanceRate': 0.0,
        'weeklyImprovement': 0.0,
      };
    }

    // Calculate overall resistance rate
    final resistedCount = cravings
        .where((c) => c.wasSuccessfullyResisted)
        .length;
    final resistanceRate = (resistedCount / cravings.length) * 100;

    // Calculate weekly improvement
    final now = DateTime.now();
    final oneWeekAgo = now.subtract(const Duration(days: 7));
    final twoWeeksAgo = now.subtract(const Duration(days: 14));

    final lastWeekCravings = cravings
        .where((c) => c.startTime.isAfter(oneWeekAgo))
        .toList();
    final previousWeekCravings = cravings
        .where((c) =>
    c.startTime.isAfter(twoWeeksAgo) &&
        c.startTime.isBefore(oneWeekAgo))
        .toList();

    double weeklyImprovement = 0.0;

    if (lastWeekCravings.isNotEmpty && previousWeekCravings.isNotEmpty) {
      final lastWeekRate = (lastWeekCravings
          .where((c) => c.wasSuccessfullyResisted)
          .length / lastWeekCravings.length) * 100;

      final previousWeekRate = (previousWeekCravings
          .where((c) => c.wasSuccessfullyResisted)
          .length / previousWeekCravings.length) * 100;

      weeklyImprovement = lastWeekRate - previousWeekRate;
    }

    return {
      'resistanceRate': resistanceRate,
      'weeklyImprovement': weeklyImprovement,
    };
  }

  // ============= HEALTH METRICS =============

  static Map<String, dynamic> _calculateHealthMetrics(
      List<LogEntry> logs,
      UserProfile profile,
      ) {
    if (profile.quitDate == null || profile.cigarettesPerDay == null) {
      return {
        'cigarettesAvoided': 0,
        'lifeMinutesGained': 0.0,
      };
    }

    final now = DateTime.now();
    final daysSinceQuit = now.difference(profile.quitDate!).inDays;

    // Calculate potential cigarettes if user had continued
    final potentialCigarettes = profile.cigarettesPerDay! * daysSinceQuit;

    // Calculate actual cigarettes smoked
    final actualCigarettes = logs
        .where((log) => log.type == LogType.cigarette)
        .fold<int>(0, (sum, log) => sum + (log.quantity ?? 1));

    // Cigarettes avoided
    final cigarettesAvoided = (potentialCigarettes - actualCigarettes)
        .clamp(0, double.infinity)
        .toInt();

    // Life minutes gained (rough estimate: ~11 minutes per cigarette)
    // Source: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2672370/
    final lifeMinutesGained = cigarettesAvoided * 11.0;

    return {
      'cigarettesAvoided': cigarettesAvoided,
      'lifeMinutesGained': lifeMinutesGained,
    };
  }

  // ============= HELPER METHODS =============

  static List<LogEntry> _filterByDateRange(
      List<LogEntry> logs,
      DateTime? startDate,
      DateTime? endDate,
      ) {
    return logs.where((log) {
      if (startDate != null && log.timestamp.isBefore(startDate)) {
        return false;
      }
      if (endDate != null && log.timestamp.isAfter(endDate)) {
        return false;
      }
      return true;
    }).toList();
  }

  static List<CravingEntry> _filterCravingsByDateRange(
      List<CravingEntry> cravings,
      DateTime? startDate,
      DateTime? endDate,
      ) {
    return cravings.where((craving) {
      if (startDate != null && craving.startTime.isBefore(startDate)) {
        return false;
      }
      if (endDate != null && craving.startTime.isAfter(endDate)) {
        return false;
      }
      return true;
    }).toList();
  }

  // ============= CHART DATA GENERATORS =============

  /// Generate daily chart data for a specific time range
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

    // Group by day
    final countsByDay = <DateTime, int>{};
    for (final log in filteredLogs) {
      final day = DateTime(
        log.timestamp.year,
        log.timestamp.month,
        log.timestamp.day,
      );
      countsByDay[day] = (countsByDay[day] ?? 0) + 1;
    }

    // Convert to chart data points
    final dataPoints = <ChartDataPoint>[];
    final sortedDates = countsByDay.keys.toList()..sort();

    for (final date in sortedDates) {
      dataPoints.add(ChartDataPoint(
        date: date,
        value: countsByDay[date]!.toDouble(),
      ));
    }

    return dataPoints;
  }

  /// Generate weekly aggregated chart data
  static List<ChartDataPoint> generateWeeklyChartData(
      List<LogEntry> logs,
      TimeRange timeRange,
      ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) {
      return log.timestamp.isAfter(startDate);
    }).toList();

    // Group by week
    final countsByWeek = <DateTime, int>{};
    for (final log in filteredLogs) {
      final weekStart = _getWeekStart(log.timestamp);
      countsByWeek[weekStart] = (countsByWeek[weekStart] ?? 0) + 1;
    }

    // Convert to chart data points
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

  /// Generate trigger frequency chart data
  static List<MapEntry<String, int>> generateTriggerFrequencyData(
      List<LogEntry> logs,
      TimeRange timeRange,
      ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) {
      return log.timestamp.isAfter(startDate);
    }).toList();

    final triggerCounts = <String, int>{};
    for (final log in filteredLogs) {
      for (final trigger in log.triggers) {
        triggerCounts[trigger] = (triggerCounts[trigger] ?? 0) + 1;
      }
    }

    // Sort by frequency (descending)
    final sortedTriggers = triggerCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedTriggers;
  }

  /// Generate hourly distribution data (heatmap style)
  static Map<int, int> generateHourlyDistributionData(
      List<LogEntry> logs,
      TimeRange timeRange,
      ) {
    final startDate = timeRange.getStartDate();
    final filteredLogs = logs.where((log) {
      return log.timestamp.isAfter(startDate);
    }).toList();

    final hourlyCount = <int, int>{};

    // Initialize all hours
    for (int i = 0; i < 24; i++) {
      hourlyCount[i] = 0;
    }

    // Count occurrences
    for (final log in filteredLogs) {
      final hour = log.timestamp.hour;
      hourlyCount[hour] = hourlyCount[hour]! + 1;
    }

    return hourlyCount;
  }

  /// Generate mood trend data
  static List<ChartDataPoint> generateMoodTrendData(
      List<LogEntry> logs,
      TimeRange timeRange,
      ) {
    final startDate = timeRange.getStartDate();
    final logsWithMood = logs.where((log) {
      return log.timestamp.isAfter(startDate) && log.mood != null;
    }).toList();

    // Group by day and calculate average mood
    final moodByDay = <DateTime, List<int>>{};
    for (final log in logsWithMood) {
      final day = DateTime(
        log.timestamp.year,
        log.timestamp.month,
        log.timestamp.day,
      );
      moodByDay.putIfAbsent(day, () => []).add(log.mood!.value);
    }

    // Calculate averages
    final dataPoints = <ChartDataPoint>[];
    final sortedDays = moodByDay.keys.toList()..sort();

    for (final day in sortedDays) {
      final moods = moodByDay[day]!;
      final averageMood = moods.reduce((a, b) => a + b) / moods.length;
      dataPoints.add(ChartDataPoint(
        date: day,
        value: averageMood,
      ));
    }

    return dataPoints;
  }

  static DateTime _getWeekStart(DateTime date) {
    final dayOfWeek = date.weekday;
    return DateTime(date.year, date.month, date.day)
        .subtract(Duration(days: dayOfWeek - 1));
  }

  // ============= PROGRESS CALCULATIONS =============

  /// Calculate progress towards goal
  static double calculateProgressPercentage(
      UserProfile profile,
      Statistics stats,
      ) {
    if (profile.quitDate == null) return 0.0;

    final now = DateTime.now();
    final daysSinceQuit = now.difference(profile.quitDate!).inDays;

    // Different milestones based on goal type
    final milestones = [7, 14, 30, 60, 90, 180, 365]; // days

    // Find current milestone
    int currentMilestone = 0;
    for (final milestone in milestones) {
      if (stats.currentStreak >= milestone) {
        currentMilestone = milestone;
      } else {
        break;
      }
    }

    // Find next milestone
    int? nextMilestone;
    for (final milestone in milestones) {
      if (milestone > stats.currentStreak) {
        nextMilestone = milestone;
        break;
      }
    }

    if (nextMilestone == null) {
      return 100.0; // Completed all milestones
    }

    // Calculate progress to next milestone
    final progressInMilestone = stats.currentStreak - currentMilestone;
    final milestoneRange = nextMilestone - currentMilestone;

    return ((currentMilestone + progressInMilestone) / nextMilestone) * 100;
  }

  /// Get next milestone information
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

    // Beyond all milestones
    return {
      'days': 365,
      'name': 'Champion',
      'emoji': '👑',
      'daysRemaining': 0,
    };
  }
}
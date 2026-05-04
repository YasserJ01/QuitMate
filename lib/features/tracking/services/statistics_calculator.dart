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
    DateTime? referenceDate, // For testing or specific point-in-time analysis
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
      DateTime now,
      ) {
    if (profile.quitDate == null) {
      return {
        'currentStreak': 0,
        'longestStreak': 0,
        'lastLogDate': null,
        'streakStartDate': null,
      };
    }

    final quitDate = profile.quitDate!;

    // Sort logs by date (oldest first)
    final sortedLogs = List<LogEntry>.from(logs)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

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
    // Start from the quit date (normalized to start of day)
    DateTime checkDate = DateTime(quitDate.year, quitDate.month, quitDate.day);
    final today = DateTime(now.year, now.month, now.day);

    int currentStreak = 0;
    int longestStreak = 0;
    int tempStreak = 0;
    DateTime? tempStartDate = quitDate;
    DateTime? currentStreakStartDate = quitDate;

    // Iterate from quit date to today (inclusive)
    while (checkDate.isBefore(today) || checkDate.isAtSameMomentAs(today)) {
      final dayLogs = logsByDay[checkDate] ?? [];
      final hadRelapse = dayLogs.any((log) => _isRelapse(log, profile));

      if (hadRelapse) {
        // Check if the streak that just ended was the longest
        if (tempStreak > longestStreak) {
          longestStreak = tempStreak;
        }
        // Reset streak
        tempStreak = 0;
        // Next potential streak starts tomorrow
        tempStartDate = checkDate.add(const Duration(days: 1));
      } else {
        // Clean day
        tempStreak++;
        // If this is the start of a new streak, mark it
        if (tempStreak == 1) {
          currentStreakStartDate = tempStartDate;
        }
      }

      checkDate = checkDate.add(const Duration(days: 1));
    }

    // The streak at the end of the loop is the current streak
    currentStreak = tempStreak;
    
    // Check if current streak is the longest
    if (currentStreak > longestStreak) {
      longestStreak = currentStreak;
    }

    // If current streak is 0 (relapsed today), the start date is irrelevant or should be tomorrow
    // But for UI consistency, we can leave it as the last calculated start date or null
    if (currentStreak == 0) {
      currentStreakStartDate = null; 
    }

    return {
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastLogDate': sortedLogs.isNotEmpty ? sortedLogs.last.timestamp : null,
      'streakStartDate': currentStreakStartDate,
    };
  }

  static bool _isRelapse(LogEntry log, UserProfile profile) {
    // For smoking: any cigarette is a relapse
    if (profile.goalType.name.toLowerCase().contains('smoking') &&
        log.type == LogType.cigarette) {
      return true;
    }

    // For masturbation: episodes are relapses
    if (profile.goalType.name.toLowerCase().contains('masturbation') &&
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
    
    // Days tracking is inclusive of today (e.g. Day 1)
    // If quitDate is today, difference is 0, so add 1.
    final daysTracking = today.difference(startDate).inDays + 1;

    // Calculate days clean (Total Cumulative)
    // Iterate from start date to today and count days without relapses
    int daysClean = 0;
    
    // Group logs by day for efficient lookup
    final logsByDay = <DateTime, List<LogEntry>>{};
    for (final log in logs) {
      if (_isRelapse(log, profile)) {
        final day = DateTime(
          log.timestamp.year,
          log.timestamp.month,
          log.timestamp.day,
        );
        logsByDay.putIfAbsent(day, () => []).add(log);
      }
    }
    
    DateTime checkDate = startDate;
    while (checkDate.isBefore(today) || checkDate.isAtSameMomentAs(today)) {
      // If no relapse logs for this day, it's a clean day
      if (!logsByDay.containsKey(checkDate)) {
        daysClean++;
      }
      checkDate = checkDate.add(const Duration(days: 1));
    }

    // Calculate average relapses per day
    double averagePerDay = 0.0;
    if (daysTracking > 0) {
      final totalRelapses = logs.where((log) => _isRelapse(log, profile)).length;
      averagePerDay = totalRelapses / daysTracking;
    }

    return {
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
      DateTime now,
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
      DateTime now,
      ) {
    if (profile.quitDate == null || profile.cigarettesPerDay == null) {
      return {
        'cigarettesAvoided': 0,
        'lifeMinutesGained': 0.0,
      };
    }

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
      Statistics stats, {
        DateTime? now,
      }) {
    if (profile.quitDate == null) return 0.0;

    final checkDate = now ?? DateTime.now();
    final milestones = [7, 14, 30, 60, 90, 180, 365]; // days

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
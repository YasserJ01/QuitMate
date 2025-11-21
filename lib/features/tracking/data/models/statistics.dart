class Statistics {
  // Streak data
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastLogDate;
  final DateTime? streakStartDate;

  // Counts
  final int totalCigarettes;
  final int totalEpisodes;
  final int totalCravings;
  final int totalRelapses;
  final int cravingsResisted;

  // Money saved (smoking only)
  final double moneySaved;
  final double potentialMoneySaved;

  // Time analysis
  final int daysTracking;
  final int daysClean;
  final double averagePerDay;

  // Trend data
  final Map<DateTime, int> dailyCounts;
  final Map<String, int> triggerFrequency;
  final Map<int, int> hourlyDistribution; // Hour of day -> count

  // Success rates
  final double cravingResistanceRate;
  final double weeklyImprovement;

  // Health metrics (for smoking)
  final int cigarettesAvoided;
  final double lifeMinutesGained; // Approximate

  const Statistics({
    required this.currentStreak,
    required this.longestStreak,
    this.lastLogDate,
    this.streakStartDate,
    required this.totalCigarettes,
    required this.totalEpisodes,
    required this.totalCravings,
    required this.totalRelapses,
    required this.cravingsResisted,
    required this.moneySaved,
    required this.potentialMoneySaved,
    required this.daysTracking,
    required this.daysClean,
    required this.averagePerDay,
    required this.dailyCounts,
    required this.triggerFrequency,
    required this.hourlyDistribution,
    required this.cravingResistanceRate,
    required this.weeklyImprovement,
    required this.cigarettesAvoided,
    required this.lifeMinutesGained,
  });

  Statistics copyWith({
    int? currentStreak,
    int? longestStreak,
    DateTime? lastLogDate,
    DateTime? streakStartDate,
    int? totalCigarettes,
    int? totalEpisodes,
    int? totalCravings,
    int? totalRelapses,
    int? cravingsResisted,
    double? moneySaved,
    double? potentialMoneySaved,
    int? daysTracking,
    int? daysClean,
    double? averagePerDay,
    Map<DateTime, int>? dailyCounts,
    Map<String, int>? triggerFrequency,
    Map<int, int>? hourlyDistribution,
    double? cravingResistanceRate,
    double? weeklyImprovement,
    int? cigarettesAvoided,
    double? lifeMinutesGained,
  }) {
    return Statistics(
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastLogDate: lastLogDate ?? this.lastLogDate,
      streakStartDate: streakStartDate ?? this.streakStartDate,
      totalCigarettes: totalCigarettes ?? this.totalCigarettes,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      totalCravings: totalCravings ?? this.totalCravings,
      totalRelapses: totalRelapses ?? this.totalRelapses,
      cravingsResisted: cravingsResisted ?? this.cravingsResisted,
      moneySaved: moneySaved ?? this.moneySaved,
      potentialMoneySaved: potentialMoneySaved ?? this.potentialMoneySaved,
      daysTracking: daysTracking ?? this.daysTracking,
      daysClean: daysClean ?? this.daysClean,
      averagePerDay: averagePerDay ?? this.averagePerDay,
      dailyCounts: dailyCounts ?? this.dailyCounts,
      triggerFrequency: triggerFrequency ?? this.triggerFrequency,
      hourlyDistribution: hourlyDistribution ?? this.hourlyDistribution,
      cravingResistanceRate: cravingResistanceRate ?? this.cravingResistanceRate,
      weeklyImprovement: weeklyImprovement ?? this.weeklyImprovement,
      cigarettesAvoided: cigarettesAvoided ?? this.cigarettesAvoided,
      lifeMinutesGained: lifeMinutesGained ?? this.lifeMinutesGained,
    );
  }

  static Statistics empty() {
    return const Statistics(
      currentStreak: 0,
      longestStreak: 0,
      totalCigarettes: 0,
      totalEpisodes: 0,
      totalCravings: 0,
      totalRelapses: 0,
      cravingsResisted: 0,
      moneySaved: 0,
      potentialMoneySaved: 0,
      daysTracking: 0,
      daysClean: 0,
      averagePerDay: 0,
      dailyCounts: {},
      triggerFrequency: {},
      hourlyDistribution: {},
      cravingResistanceRate: 0,
      weeklyImprovement: 0,
      cigarettesAvoided: 0,
      lifeMinutesGained: 0,
    );
  }
}

// Helper class for chart data
class ChartDataPoint {
  final DateTime date;
  final double value;
  final String? label;

  const ChartDataPoint({
    required this.date,
    required this.value,
    this.label,
  });
}

// Time range for filtering
enum TimeRange {
  today,
  week,
  month,
  threeMonths,
  year,
  all;

  String get displayName {
    switch (this) {
      case TimeRange.today:
        return 'Today';
      case TimeRange.week:
        return 'Week';
      case TimeRange.month:
        return 'Month';
      case TimeRange.threeMonths:
        return '3 Months';
      case TimeRange.year:
        return 'Year';
      case TimeRange.all:
        return 'All Time';
    }
  }

  DateTime getStartDate() {
    final now = DateTime.now();
    switch (this) {
      case TimeRange.today:
        return DateTime(now.year, now.month, now.day);
      case TimeRange.week:
        return now.subtract(const Duration(days: 7));
      case TimeRange.month:
        return now.subtract(const Duration(days: 30));
      case TimeRange.threeMonths:
        return now.subtract(const Duration(days: 90));
      case TimeRange.year:
        return now.subtract(const Duration(days: 365));
      case TimeRange.all:
        return DateTime(2000); // Far past date
    }
  }
}
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/features/tracking/services/statistics_calculator.dart';
import 'package:quitmate/features/tracking/data/models/log_entry.dart';
import 'package:quitmate/features/onboarding/data/models/user_profile.dart';


// Mock GoalType if needed, or import correct one.
// Based on UserProfile file, GoalType is in '../../domain/entities/goal_type.dart'
// But the import in UserProfile says: import '../../domain/entities/goal_type.dart';
// Let's try to import it correctly.
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';

void main() {
  group('StatisticsCalculator', () {
    late UserProfile mockProfile;

    UserProfile createProfile({DateTime? quitDate}) {
      final p = UserProfile();
      p.id = 1;
      p.userId = 'user1';
      p.goalType = GoalType.quitSmoking;
      p.cigarettesPerDay = 10;
      p.costPerPack = 10.0;
      p.cigarettesPerPack = 20;
      p.quitDate = quitDate ?? DateTime.now();
      return p;
    }

    setUp(() {
      mockProfile = createProfile();
    });

    test('New user (Day 1) should have 1 day streak and clean', () {
      final now = DateTime.now();
      // Reset time to start of day for consistent testing
      final today = DateTime(now.year, now.month, now.day);
      
      final profile = createProfile(quitDate: today);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [],
        cravings: [],
        profile: profile,
      );

      expect(stats.currentStreak, 1, reason: 'Current streak should be 1 on first day');
      expect(stats.longestStreak, 1, reason: 'Longest streak should be 1 on first day');
      expect(stats.daysClean, 1, reason: 'Days clean should be 1 on first day');
      expect(stats.daysTracking, 1, reason: 'Days tracking should be 1 on first day');
    });

    test('User with 3 days clean should have 4 days streak (Day 1, 2, 3, 4)', () {
      final now = DateTime.now();
      final threeDaysAgo = now.subtract(const Duration(days: 3));
      final quitDate = DateTime(threeDaysAgo.year, threeDaysAgo.month, threeDaysAgo.day);

      final profile = createProfile(quitDate: quitDate);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [],
        cravings: [],
        profile: profile,
      );

      // Days: 0 (quit), 1, 2, 3 (today) -> 4 days total
      expect(stats.currentStreak, 4);
      expect(stats.daysClean, 4);
    });

    test('Relapse yesterday resets streak to 1 (Today)', () {
      final now = DateTime.now();
      final fiveDaysAgo = now.subtract(const Duration(days: 5));
      final quitDate = DateTime(fiveDaysAgo.year, fiveDaysAgo.month, fiveDaysAgo.day);
      
      final yesterday = now.subtract(const Duration(days: 1));
      
      final relapseLog = LogEntry()
        ..type = LogType.cigarette
        ..timestamp = yesterday
        ..quantity = 1;

      final profile = createProfile(quitDate: quitDate);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [relapseLog],
        cravings: [],
        profile: profile,
      );

      // Quit 5 days ago. Relapse yesterday.
      // Days: -5, -4, -3, -2, -1 (Relapse), 0 (Today)
      // Streak should be 1 (Today)
      expect(stats.currentStreak, 1, reason: 'Streak should be 1 after relapse yesterday');
      
      // Longest streak: -5, -4, -3, -2 -> 4 days
      expect(stats.longestStreak, 4, reason: 'Longest streak should be 4 days before relapse');
      
      // Days clean: Total 6 days (0 to 5). 1 relapse day. 5 clean days.
      expect(stats.daysClean, 5, reason: 'Total clean days should be 5');
    });

    test('Relapse today resets streak to 0', () {
      final now = DateTime.now();
      final fiveDaysAgo = now.subtract(const Duration(days: 5));
      final quitDate = DateTime(fiveDaysAgo.year, fiveDaysAgo.month, fiveDaysAgo.day);
      
      final relapseLog = LogEntry()
        ..type = LogType.cigarette
        ..timestamp = now
        ..quantity = 1;

      final profile = createProfile(quitDate: quitDate);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [relapseLog],
        cravings: [],
        profile: profile,
      );

      expect(stats.currentStreak, 0, reason: 'Streak should be 0 after relapse today');
      expect(stats.daysClean, 5, reason: 'Days clean should be 5 (all days prior to today)');
    });

    test('Long term success: Quit Nov 22, 2025 -> Check April 1, 2026', () {
      // Scenario: User started (quit) on Nov 22, 2025.
      // We are checking stats on April 1, 2026.
      // Duration: Nov 22 to April 1.
      // Nov: 9 days (22-30 inclusive)
      // Dec: 31
      // Jan: 31
      // Feb: 28
      // Mar: 31
      // Apr: 1 (Current day)
      // Total: 9 + 31 + 31 + 28 + 31 + 1 = 131 days.

      final quitDate = DateTime(2025, 11, 22);
      final checkDate = DateTime(2026, 4, 1);

      final profile = createProfile(quitDate: quitDate);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [],
        cravings: [],
        profile: profile,
        referenceDate: checkDate,
      );

      expect(stats.daysTracking, 131, reason: 'Days tracking should be 131 days');
      expect(stats.daysClean, 131, reason: 'Days clean should be 131 days');
      expect(stats.currentStreak, 131, reason: 'Current streak should be 131 days');
      expect(stats.longestStreak, 131, reason: 'Longest streak should be 131 days');
    });

    test('Relapse on New Year\'s Eve: Quit Nov 22, 2025 -> Relapse Dec 31, 2025 -> Check April 1, 2026', () {
      // Quit: Nov 22, 2025.
      // Relapse: Dec 31, 2025.
      // Check: April 1, 2026.
      
      // Pre-relapse streak: Nov 22 to Dec 30.
      // Nov: 9 days.
      // Dec: 30 days.
      // Total: 39 days.
      
      // Post-relapse streak: Jan 1 to April 1.
      // Jan: 31
      // Feb: 28
      // Mar: 31
      // Apr: 1
      // Total: 91 days.

      final quitDate = DateTime(2025, 11, 22);
      final relapseDate = DateTime(2025, 12, 31, 23, 59); // Late night relapse
      final checkDate = DateTime(2026, 4, 1);

      final relapseLog = LogEntry()
        ..type = LogType.cigarette
        ..timestamp = relapseDate
        ..quantity = 1;

      final profile = createProfile(quitDate: quitDate);

      final stats = StatisticsCalculator.calculateStatistics(
        logs: [relapseLog],
        cravings: [],
        profile: profile,
        referenceDate: checkDate,
      );

      expect(stats.currentStreak, 91, reason: 'Current streak should be from Jan 1 to Apr 1 (91 days)');
      expect(stats.longestStreak, 91, reason: 'Longest streak should be the current one (91 > 39)');
      
      // Days clean: Total 131 days - 1 relapse day = 130 days.
      expect(stats.daysClean, 130, reason: 'Total clean days should be 130');
    });
  });
}

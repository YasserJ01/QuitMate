import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/statistics.dart';
import '../../services/statistics_calculator.dart';

class StreakCard extends StatelessWidget {
  final Statistics statistics;
  final DateTime? quitDate;

  const StreakCard({
    super.key,
    required this.statistics,
    this.quitDate,
  });

  @override
  Widget build(BuildContext context) {
    final milestone = StatisticsCalculator.getNextMilestone(statistics.currentStreak);
    final progress = statistics.currentStreak / (milestone['days'] as int);
    final streakDisplay = StatisticsCalculator.formatStreakDisplay(
      statistics.currentStreak,
      quitDate,
    );

    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.successGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Streak icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha:0.2),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('🔥', style: TextStyle(fontSize: 48)),
              ),
            ),
            const SizedBox(height: 16),

            // Current streak — displays hours when <1 day
            Text(
              streakDisplay,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              statistics.currentStreak == 1 ? 'Day Clean' : 'Days Clean',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),

            // Progress to next milestone
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next: ${milestone['name']} ${milestone['emoji']}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha:0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${milestone['daysRemaining']} days',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha:0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: Colors.white.withValues(alpha:0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Longest streak + recovery count
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha:0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.emoji_events, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Best: ${statistics.longestStreak} days',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // Recovery count — framed positively (SRS §8.4)
                  if (statistics.recoveryCount > 0) ...[
                    const SizedBox(height: 8),
                    Text(
                      'You have recovered ${statistics.recoveryCount} ${statistics.recoveryCount == 1 ? "time" : "times"}.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha:0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

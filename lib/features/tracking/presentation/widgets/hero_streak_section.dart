import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../data/models/statistics.dart';
import '../../services/statistics_calculator.dart';
import 'animated_progress_ring.dart';
import 'animated_counter.dart';

class HeroStreakSection extends StatelessWidget {
  final Statistics statistics;
  final DateTime? quitDate;
  final GoalType? mode;

  const HeroStreakSection({
    super.key,
    required this.statistics,
    this.quitDate,
    this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final milestone = StatisticsCalculator.getNextMilestone(statistics.currentStreak);
    final progress = (statistics.currentStreak / (milestone['days'] as int)).clamp(0.0, 1.0);
    final isReduction = mode == GoalType.reduceMasturbation;

    return LayoutBuilder(
      builder: (context, constraints) {
        final ringSize = (constraints.maxWidth * 0.4).clamp(100.0, 130.0);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: DashboardTheme.heroGradient(context),
            borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: ringSize,
                height: ringSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedProgressRing(
                      progress: progress,
                      size: ringSize,
                      strokeWidth: 8,
                      trackColor: Colors.white.withValues(alpha: 0.2),
                      progressColor: Colors.white,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _iconForMode(),
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(height: 2),
                        AnimatedCounter(
                          target: statistics.currentStreak,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -1.5,
                            height: 1,
                          ),
                        ),
                        Text(
                          _streakLabel(isReduction),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next: ${milestone['name']} ${milestone['emoji']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '${milestone['daysRemaining']}d',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white.withValues(alpha: 0.25),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          'Best: ${statistics.longestStreak} days',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        if (statistics.recoveryCount > 0) ...[
                          const SizedBox(width: 12),
                          Text(
                            '• ${statistics.recoveryCount} recoveries',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _streakLabel(bool isReduction) {
    if (isReduction) {
      return statistics.currentStreak == 1 ? 'DAY FREE' : 'DAYS FREE';
    }
    return statistics.currentStreak == 1 ? 'DAY CLEAN' : 'DAYS CLEAN';
  }

  String _iconForMode() {
    if (mode == GoalType.reduceMasturbation) {
      if (statistics.currentStreak >= 90) return '🌟';
      if (statistics.currentStreak >= 30) return '🧘';
      if (statistics.currentStreak >= 7) return '🛡️';
      if (statistics.currentStreak >= 3) return '🌿';
      return '🌱';
    }
    return '🔥';
  }
}

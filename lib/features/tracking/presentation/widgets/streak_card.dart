import 'package:flutter/material.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../data/models/statistics.dart';
import '../../services/statistics_calculator.dart';

/// Visual intensity levels for the streak flame icon.
/// Maps to research-backed milestone points (§3.1 of plan).
class _FlameIntensity {
  final double iconSize;
  final double glowRadius;
  final double glowOpacity;
  final Color glowColor;

  const _FlameIntensity({
    required this.iconSize,
    required this.glowRadius,
    required this.glowOpacity,
    required this.glowColor,
  });

  static const spark = _FlameIntensity(
    iconSize: 40,
    glowRadius: 0,
    glowOpacity: 0,
    glowColor: Colors.transparent,
  );
  static const warm = _FlameIntensity(
    iconSize: 52,
    glowRadius: 6,
    glowOpacity: 0.25,
    glowColor: Color(0xFFFF9800),
  );
  static const strong = _FlameIntensity(
    iconSize: 60,
    glowRadius: 12,
    glowOpacity: 0.40,
    glowColor: Color(0xFFFF5722),
  );
  static const blazing = _FlameIntensity(
    iconSize: 72,
    glowRadius: 20,
    glowOpacity: 0.55,
    glowColor: Color(0xFFFFD700),
  );

  static _FlameIntensity fromStreak(int days) {
    if (days >= 90) return _FlameIntensity.blazing;
    if (days >= 30) return _FlameIntensity.strong;
    if (days >= 7) return _FlameIntensity.warm;
    return _FlameIntensity.spark;
  }
}

class StreakCard extends StatelessWidget {
  final Statistics statistics;
  final DateTime? quitDate;
  final GoalType? mode;

  const StreakCard({
    super.key,
    required this.statistics,
    this.quitDate,
    this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final milestone =
        StatisticsCalculator.getNextMilestone(statistics.currentStreak);
    final progress = statistics.currentStreak / (milestone['days'] as int);
    final streakDisplay = StatisticsCalculator.formatStreakDisplay(
      statistics.currentStreak,
      quitDate,
    );
    final intensity = _FlameIntensity.fromStreak(statistics.currentStreak);
    final isReduction = mode == GoalType.reduceMasturbation;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF388E3C),
              const Color(0xFF2E7D32),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: intensity.glowRadius > 0
              ? [
                  BoxShadow(
                    color: intensity.glowColor
                        .withValues(alpha: intensity.glowOpacity),
                    blurRadius: intensity.glowRadius,
                    spreadRadius: intensity.glowRadius * 0.5,
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Streak icon — mode-aware with intensity
            _StreakIcon(
              intensity: intensity,
              isReduction: isReduction,
              streak: statistics.currentStreak,
            ),
            const SizedBox(height: 16),

            // Current streak
            Text(
              streakDisplay,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              _streakLabel(statistics.currentStreak, isReduction),
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
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${milestone['daysRemaining']} days',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
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
                    backgroundColor:
                        Colors.white.withValues(alpha: 0.3),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Longest streak + recovery count
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.emoji_events,
                          color: Colors.white, size: 20),
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
                  if (statistics.recoveryCount > 0) ...[
                    const SizedBox(height: 8),
                    Text(
                      'You have recovered ${statistics.recoveryCount} '
                      '${statistics.recoveryCount == 1 ? "time" : "times"}.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
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

  String _streakLabel(int streak, bool isReduction) {
    if (isReduction) {
      return streak == 1 ? 'Day Free' : 'Days Free';
    }
    return streak == 1 ? 'Day Clean' : 'Days Clean';
  }
}

// ─── Streak icon with intensity and mode awareness ─────────────────────────

class _StreakIcon extends StatelessWidget {
  final _FlameIntensity intensity;
  final bool isReduction;
  final int streak;

  const _StreakIcon({
    required this.intensity,
    required this.isReduction,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        boxShadow: intensity.glowRadius > 0
            ? [
                BoxShadow(
                  color: intensity.glowColor
                      .withValues(alpha: intensity.glowOpacity),
                  blurRadius: intensity.glowRadius,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          _iconForMode(),
          style: TextStyle(fontSize: intensity.iconSize),
        ),
      ),
    );
  }

  String _iconForMode() {
    if (isReduction) {
      return _reductionIcon();
    }
    return _smokingIcon();
  }

  String _smokingIcon() {
    return '🔥';
  }

  String _reductionIcon() {
    if (streak >= 90) return '🌟';
    if (streak >= 30) return '🧘';
    if (streak >= 7) return '🛡️';
    if (streak >= 3) return '🌿';
    return '🌱';
  }
}
import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

class RecoveryStatsCard extends StatelessWidget {
  final int recoveryCount;
  final String? topTrigger;
  final int? longestPostRecoveryStreak;

  const RecoveryStatsCard({
    super.key,
    required this.recoveryCount,
    this.topTrigger,
    this.longestPostRecoveryStreak,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Recovery Journey: $recoveryCount recoveries',
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF1A1D27), const Color(0xFF232736)]
                : [const Color(0xFFFFFFFF), const Color(0xFFF8F9FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
          border: Border.all(
            color: DashboardTheme.cardBorder(context),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF9800).withValues(alpha: isDark ? 0.08 : 0.1),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF9800).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recovery Journey',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: DashboardTheme.textPrimary(context),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          'Resilience in action',
                          style: TextStyle(
                            fontSize: 12,
                            color: DashboardTheme.textSecondary(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _RecoveryMetric(
                icon: Icons.refresh,
                label: 'Recoveries',
                value: '$recoveryCount',
                subtitle: recoveryCount == 1 ? 'time' : 'times',
                color: const Color(0xFF6C63FF),
              ),
              const SizedBox(height: 12),
              if (longestPostRecoveryStreak != null && longestPostRecoveryStreak! > 0)
                _RecoveryMetric(
                  icon: Icons.emoji_events,
                  label: 'Best Streak After Recovery',
                  value: '${longestPostRecoveryStreak}d',
                  subtitle: 'days',
                  color: const Color(0xFF2E7D32),
                ),
              if (topTrigger != null) ...[
                const SizedBox(height: 12),
                _RecoveryMetric(
                  icon: Icons.psychology_outlined,
                  label: 'Top Trigger',
                  value: topTrigger!,
                  subtitle: 'most common',
                  color: const Color(0xFFF59E0B),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RecoveryMetric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String subtitle;
  final Color color;

  const _RecoveryMetric({
    required this.icon,
    required this.label,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: DashboardTheme.textSecondary(context),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: color,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: DashboardTheme.textSecondary(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

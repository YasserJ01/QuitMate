import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../data/models/statistics.dart';
import 'dashboard_card.dart';

class HealthMetricsCard extends StatelessWidget {
  final Statistics statistics;

  const HealthMetricsCard({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final hoursGained = (statistics.lifeMinutesGained / 60).floor();
    final minutesGained = (statistics.lifeMinutesGained % 60).floor();
    final success = DashboardTheme.success(context);

    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardCardHeader(
            icon: Icons.favorite,
            title: 'Health Gains',
            accent: success,
          ),
          const SizedBox(height: 18),
          _buildHealthMetric(
            context,
            icon: '🚭',
            title: 'Cigarettes Not Smoked',
            value: '${statistics.cigarettesAvoided}',
            subtitle: 'That\'s amazing progress!',
          ),
          const SizedBox(height: 12),
          _buildHealthMetric(
            context,
            icon: '⏰',
            title: 'Life Time Regained',
            value: hoursGained > 0
                ? '${hoursGained}h ${minutesGained}m'
                : '${minutesGained}m',
            subtitle: 'Approximately 11 minutes per cigarette',
          ),
          const SizedBox(height: 12),
          _buildHealthMilestone(context),
        ],
      ),
    );
  }

  Widget _buildHealthMetric(
    BuildContext context, {
    required String icon,
    required String title,
    required String value,
    required String subtitle,
  }) {
    final success = DashboardTheme.success(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: success.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: success.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: DashboardTheme.textSecondary(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: success,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: DashboardTheme.textSecondary(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMilestone(BuildContext context) {
    final milestone = _getHealthMilestone(statistics.daysClean);
    final success = DashboardTheme.success(context);
    final primary = DashboardTheme.primary(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            success.withValues(alpha: 0.12),
            primary.withValues(alpha: 0.12),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: success.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.celebration, color: success, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Milestone',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: DashboardTheme.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  milestone,
                  style: TextStyle(
                    fontSize: 12,
                    color: DashboardTheme.textSecondary(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getHealthMilestone(int days) {
    if (days < 1) {
      return 'Your journey begins now!';
    } else if (days < 3) {
      return 'Carbon monoxide levels normalizing';
    } else if (days < 7) {
      return 'Sense of taste and smell improving';
    } else if (days < 14) {
      return 'Circulation and lung function improving';
    } else if (days < 30) {
      return 'Lung capacity increasing';
    } else if (days < 90) {
      return 'Heart disease risk dropping';
    } else if (days < 180) {
      return 'Significant health improvements!';
    } else if (days < 365) {
      return 'Heart attack risk halved!';
    } else {
      return 'Amazing! Major health risks reduced!';
    }
  }
}

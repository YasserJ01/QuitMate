import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/statistics.dart';

class HealthMetricsCard extends StatelessWidget {
  final Statistics statistics;

  const HealthMetricsCard({
    Key? key,
    required this.statistics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoursGained = (statistics.lifeMinutesGained / 60).floor();
    final minutesGained = (statistics.lifeMinutesGained % 60).floor();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: AppTheme.successColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Health Gains',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildHealthMetric(
              context,
              icon: '🚭',
              title: 'Cigarettes Not Smoked',
              value: '${statistics.cigarettesAvoided}',
              subtitle: 'That\'s amazing progress!',
            ),
            const SizedBox(height: 16),

            _buildHealthMetric(
              context,
              icon: '⏰',
              title: 'Life Time Regained',
              value: hoursGained > 0
                  ? '${hoursGained}h ${minutesGained}m'
                  : '${minutesGained}m',
              subtitle: 'Approximately 11 minutes per cigarette',
            ),
            const SizedBox(height: 16),

            // Health milestone
            _buildHealthMilestone(context),
          ],
        ),
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.successColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.successColor.withOpacity(0.1),
            AppTheme.primaryColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.successColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.celebration, color: AppTheme.successColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Milestone',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  milestone,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
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
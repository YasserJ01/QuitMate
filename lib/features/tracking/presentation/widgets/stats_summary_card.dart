import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/statistics.dart';

class StatsSummaryCard extends StatelessWidget {
  final Statistics statistics;

  const StatsSummaryCard({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            'Overview',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  icon: Icons.calendar_today,
                  label: 'Days Tracking',
                  value: '${statistics.daysTracking}',
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  context,
                  icon: Icons.check_circle,
                  label: 'Days Clean',
                  value: '${statistics.daysClean}',
                  color: AppTheme.successColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          if (statistics.totalCravings > 0) ...[
    Row(
    children: [
    Expanded(
    child: _buildStatItem(
      context,
      icon: Icons.psychology,
      label: 'Cravings',
      value: '${statistics.totalCravings}',
      color: AppTheme.warningColor,
    ),
    ),
    const SizedBox(width: 16),
    Expanded(
    child: _buildStatItem(
    context,
    icon: Icons.shield,
    label: 'Resisted',value: '${statistics.cravingsResisted}',
      color: AppTheme.successColor,
    ),
    ),
    ],
    ),
            const SizedBox(height: 16),

            // Resistance rate
            _buildProgressStat(
              context,
              label: 'Resistance Rate',
              value: statistics.cravingResistanceRate,
              icon: Icons.trending_up,
            ),
          ],
            ],
          ),
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
        required Color color,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStat(
      BuildContext context, {
        required String label,
        required double value,
        required IconData icon,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.successColor.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.successColor, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                '${value.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.successColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.successColor),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
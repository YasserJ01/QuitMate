import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/statistics.dart';

class TimeReclaimedCard extends StatelessWidget {
  final Statistics statistics;

  const TimeReclaimedCard({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = statistics.timeReclaimedMinutes;
    if (minutes == null || minutes <= 0) return const SizedBox.shrink();

    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    final display = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';

    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryColor.withBlue(200),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha:0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.schedule,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Time Reclaimed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              display,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            if (statistics.episodesAvoided != null && statistics.episodesAvoided! > 0)
              Text(
                '${statistics.episodesAvoided} episodes avoided',
                style: TextStyle(
                  color: Colors.white.withValues(alpha:0.9),
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

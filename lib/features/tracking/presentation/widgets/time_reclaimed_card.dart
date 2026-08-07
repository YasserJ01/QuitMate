import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../data/models/statistics.dart';
import 'dashboard_card.dart';

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

    return Semantics(
      label: 'Time reclaimed: $display',
      child: DashboardCard(
        gradient: DashboardTheme.heroGradient(context),
        accent: DashboardTheme.primary(context),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.schedule, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Time Reclaimed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              display,
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1,
                height: 1,
              ),
            ),
            if (statistics.episodesAvoided != null &&
                statistics.episodesAvoided! > 0) ...[
              const SizedBox(height: 10),
              Text(
                '${statistics.episodesAvoided} episodes avoided',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

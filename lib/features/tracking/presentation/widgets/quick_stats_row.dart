import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

class QuickStatsRow extends StatelessWidget {
  final List<QuickStat> stats;
  const QuickStatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: stats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _StatCard(stat: stats[index]);
        },
      ),
    );
  }
}

class QuickStat {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? semanticsLabel;

  const QuickStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.semanticsLabel,
  });
}

class _StatCard extends StatelessWidget {
  final QuickStat stat;
  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: stat.semanticsLabel ?? '${stat.label}: ${stat.value}',
      child: Container(
        width: 120,
        height: 110,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DashboardTheme.surface(context),
          borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
          border: Border.all(
            color: DashboardTheme.cardBorder(context),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: stat.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(stat.icon, color: stat.color, size: 18),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: stat.color,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  stat.label,
                  style: TextStyle(
                    fontSize: 10,
                    color: DashboardTheme.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../onboarding/data/models/user_profile.dart';
import '../../../onboarding/domain/services/profile_completeness_service.dart';
import '../../../onboarding/presentation/providers/profile_completeness_provider.dart';
import '../../../onboarding/presentation/screens/edit_profile_screen.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../data/models/statistics.dart';
import '../providers/statistics_provider.dart';
import '../widgets/streak_card.dart';
import '../widgets/time_reclaimed_card.dart';
import '../widgets/profile_nudge_card.dart';

/// Reduction-specific dashboard per SRS §10.4.
class ReductionDashboard extends ConsumerWidget {
  final UserProfile profile;

  const ReductionDashboard({super.key, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(statisticsProvider);
    final stats = statsState.statistics;
    final completenessAsync = ref.watch(profileCompletenessProvider);

    return completenessAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) =>
          _buildContent(context, ref, stats, ProfileCompleteness.empty()),
      data: (completeness) =>
          _buildContent(context, ref, stats, completeness),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    Statistics stats,
    ProfileCompleteness completeness,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Mode chip — calm, not flame
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('🎯', style: TextStyle(fontSize: 16)),
              SizedBox(width: 6),
              Text('My Focus Journey',
                  style: TextStyle(
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Hero Streak Section — calm leaf/shield icon
        StreakCard(
          statistics: stats,
          quitDate: profile.quitDate,
        ),
        const SizedBox(height: 16),

        // Urges resisted today
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.shield,
                      color: AppTheme.successColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Urges Resisted',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        '${stats.cravingsResisted}',
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.successColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Time Reclaimed card — only if data available
        if (completeness.hasTimeReclaimData) ...[
          TimeReclaimedCard(statistics: stats),
          const SizedBox(height: 16),
        ] else ...[
          ProfileNudgeCard(
            message: 'Add episode duration to see time reclaimed',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EditProfileScreen(
                  section: ProfileSection.reductionDetails,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Values Anchor Card — shown if values are set; nudge to set them if not
        if (completeness.hasValuesData && profile.values.isNotEmpty)
          _ValuesAnchorCard(values: profile.values)
        else
          ProfileNudgeCard(
            message: 'Add your values to see them on your dashboard',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EditProfileScreen(
                  section: ProfileSection.valuesSection,
                ),
              ),
            ),
          ),
        const SizedBox(height: 16),

        // Distress Trend — only if >=3 data points (FR-P03)
        if (completeness.hasDistressBaseline &&
            stats.distressTrend.length >= 3)
          _DistressTrendCard(trend: stats.distressTrend),
        const SizedBox(height: 16),

        // Quick Actions Row
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quick Actions',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _QuickActionChip(
                      icon: Icons.flash_on,
                      label: 'Log Urge',
                      color: AppTheme.warningColor,
                      onTap: () {
                        // Handled by FAB
                      },
                    ),
                    const SizedBox(width: 8),
                    _QuickActionChip(
                      icon: Icons.self_improvement,
                      label: 'Open Toolkit',
                      color: AppTheme.primaryColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CravingToolkitScreen()),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    _QuickActionChip(
                      icon: Icons.book,
                      label: 'Journal',
                      color: AppTheme.secondaryColor,
                      onTap: () {
                        // TODO: Navigate to journal entry
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Profile nudge if incomplete
        if (completeness.fillPercentage < 0.5)
          ProfileNudgeCard(
            message:
                'Complete more of your profile to unlock personalized features',
          ),

        const SizedBox(height: 96),
      ],
    );
  }
}

class _ValuesAnchorCard extends StatelessWidget {
  final List<String> values;

  const _ValuesAnchorCard({required this.values});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite, color: AppTheme.primaryColor),
                const SizedBox(width: 8),
                Text('Your Reasons',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: values.map((v) {
                return Chip(
                  label: Text(v),
                  backgroundColor: AppTheme.primaryColor.withValues(alpha:0.1),
                  labelStyle: const TextStyle(color: AppTheme.primaryColor),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DistressTrendCard extends StatelessWidget {
  final List<double> trend;

  const _DistressTrendCard({required this.trend});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.trending_down,
                    color: AppTheme.secondaryColor),
                const SizedBox(width: 8),
                Text('Distress Trend (7 days)',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: trend.length >= 3
                  ? CustomPaint(
                      painter: _SimpleLinePainter(trend: trend),
                      size: Size.infinite,
                    )
                  : const Center(
                      child: Text('Need at least 3 check-ins for trend')),
            ),
          ],
        ),
      ),
    );
  }
}

/// Minimal line chart painter for distress trend.
class _SimpleLinePainter extends CustomPainter {
  final List<double> trend;
  _SimpleLinePainter({required this.trend});

  @override
  void paint(Canvas canvas, Size size) {
    if (trend.isEmpty) return;
    final paint = Paint()
      ..color = AppTheme.primaryColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = AppTheme.primaryColor
      ..style = PaintingStyle.fill;

    final stepX = size.width / (trend.length - 1).clamp(1, 100);

    final points = <Offset>[];
    for (int i = 0; i < trend.length; i++) {
      final x = i * stepX;
      final y = size.height - (trend[i] / 10.0) * size.height;
      points.add(Offset(x, y));
    }

    if (points.length > 1) {
      canvas.drawPoints(PointMode.polygon, points, paint);
    }
    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      onPressed: onTap,
      backgroundColor: color.withValues(alpha:0.1),
      side: BorderSide(color: color.withValues(alpha:0.3)),
    );
  }
}

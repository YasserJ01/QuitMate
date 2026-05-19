import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../onboarding/data/models/user_profile.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/domain/services/profile_completeness_service.dart';
import '../../../onboarding/presentation/providers/profile_completeness_provider.dart';
import '../../../onboarding/presentation/screens/edit_profile_screen.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../achievements/presentation/widgets/reasons_wall_card.dart';
import '../../data/models/statistics.dart';
import '../../data/models/log_entry.dart';
import '../widgets/daily_checkin_banner.dart';
import '../widgets/consistency_score_card.dart';
import '../widgets/recovery_stats_card.dart';
import '../providers/statistics_provider.dart';
import '../providers/tracking_provider.dart';
import '../widgets/hero_streak_section.dart';
import '../widgets/quick_stats_row.dart';
import '../widgets/bold_section_header.dart';
import '../widgets/action_row.dart';
import '../widgets/achievement_teaser_card.dart';
import '../widgets/next_achievement_teaser.dart';
import '../widgets/time_reclaimed_card.dart';
import '../widgets/profile_nudge_card.dart';

class ReductionDashboard extends ConsumerWidget {
  final UserProfile profile;

  const ReductionDashboard({super.key, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(statisticsProvider);
    final stats = statsState.statistics;
    final completenessAsync = ref.watch(profileCompletenessProvider);
    final logsAsync = ref.watch(logsProvider);

    return completenessAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _buildContent(context, ref, stats, ProfileCompleteness.empty(), logsAsync),
      data: (completeness) => _buildContent(context, ref, stats, completeness, logsAsync),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    Statistics stats,
    ProfileCompleteness completeness,
    AsyncValue<List> logsAsync,
  ) {
    int checkinDays = 0;
    int totalDays = 0;
    logsAsync.whenData((logs) {
      final checkinDates = <DateTime>{};
      for (final log in logs) {
        if (log.type == LogType.dailyCheckin) {
          final local = log.timestamp.toLocal();
          checkinDates.add(DateTime(local.year, local.month, local.day));
        }
      }
      checkinDays = checkinDates.length;
    });
    if (profile.quitDate != null) {
      final start = DateTime(
          profile.quitDate!.year, profile.quitDate!.month, profile.quitDate!.day);
      totalDays = DateTime.now().difference(start).inDays + 1;
    }

    return Container(
      color: DashboardTheme.background(context),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DailyCheckinBanner(),
          const SizedBox(height: 16),

          HeroStreakSection(
            statistics: stats,
            quitDate: profile.quitDate,
            mode: GoalType.reduceMasturbation,
          ),
          const SizedBox(height: 20),

          QuickStatsRow(
            stats: [
              QuickStat(
                icon: Icons.calendar_today,
                label: 'Days',
                value: '${stats.daysTracking}',
                color: DashboardTheme.primary(context),
              ),
              QuickStat(
                icon: Icons.shield,
                label: 'Resisted',
                value: '${stats.cravingsResisted}',
                color: DashboardTheme.success(context),
              ),
              if (stats.totalCravings > 0)
                QuickStat(
                  icon: Icons.psychology,
                  label: 'Cravings',
                  value: '${stats.totalCravings}',
                  color: DashboardTheme.warning(context),
                ),
              if (stats.lifeMinutesGained > 0)
                QuickStat(
                  icon: Icons.hourglass_top,
                  label: 'Time Saved',
                  value: '${(stats.lifeMinutesGained / 60).floor()}h',
                  color: DashboardTheme.primary(context),
                ),
            ],
          ),
          const SizedBox(height: 24),

          BoldSectionHeader(title: 'Your Journey', icon: Icons.route),
          const SizedBox(height: 12),
          const ReasonsWallCard(),
          const SizedBox(height: 16),

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

          if (completeness.hasDistressBaseline && stats.distressTrend.length >= 3)
            _DistressTrendCard(trend: stats.distressTrend),
          const SizedBox(height: 16),

          if (totalDays > 0 || stats.recoveryCount > 0) ...[
            BoldSectionHeader(title: 'Patterns', icon: Icons.insights),
            const SizedBox(height: 12),
            if (totalDays > 0) ...[
              ConsistencyScoreCard(
                checkinDays: checkinDays,
                totalDays: totalDays,
              ),
              const SizedBox(height: 16),
            ],
            if (stats.recoveryCount > 0) ...[
              RecoveryStatsCard(
                recoveryCount: stats.recoveryCount,
                topTrigger: stats.triggerFrequency.isNotEmpty
                    ? stats.triggerFrequency.entries
                        .reduce((a, b) => a.value > b.value ? a : b)
                        .key
                    : null,
                longestPostRecoveryStreak: stats.longestStreak,
              ),
              const SizedBox(height: 16),
            ],
          ],

          BoldSectionHeader(title: 'Keep Going', icon: Icons.rocket_launch),
          const SizedBox(height: 12),
          const AchievementTeaserCard(),
          const SizedBox(height: 16),
          const NextAchievementTeaser(),
          const SizedBox(height: 20),

          ActionRow(
            actions: [
              DashboardAction(
                icon: Icons.self_improvement,
                label: 'Craving Toolkit',
                subtitle: 'Exercises to ride out urges',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CravingToolkitScreen()),
                  );
                },
                gradientColor: DashboardTheme.primary(context),
              ),
            ],
          ),
          const SizedBox(height: 16),

          if (completeness.fillPercentage < 0.5)
            ProfileNudgeCard(
              message: 'Complete more of your profile to unlock personalized features',
            ),

          const SizedBox(height: 96),
        ],
      ),
    );
  }
}

class _ValuesAnchorCard extends StatelessWidget {
  final List<String> values;

  const _ValuesAnchorCard({required this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DashboardTheme.primary(context).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.favorite, color: DashboardTheme.primary(context), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Your Values',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: values.map((v) {
              return Chip(
                label: Text(v),
                backgroundColor: DashboardTheme.primary(context).withValues(alpha: 0.12),
                labelStyle: TextStyle(color: DashboardTheme.primary(context), fontWeight: FontWeight.w600),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide.none,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _DistressTrendCard extends StatelessWidget {
  final List<double> trend;

  const _DistressTrendCard({required this.trend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DashboardTheme.success(context).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.trending_down, color: DashboardTheme.success(context), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Distress Trend',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: trend.length >= 3
                  ? CustomPaint(
                      painter: _SimpleLinePainter(
                        trend: trend,
                        lineColor: DashboardTheme.primary(context),
                      ),
                      size: Size.infinite,
                    )
                  : const Center(child: Text('Need at least 3 check-ins for trend')),
            ),
        ],
      ),
    );
  }
}

class _SimpleLinePainter extends CustomPainter {
  final List<double> trend;
  final Color lineColor;

  _SimpleLinePainter({required this.trend, this.lineColor = const Color(0xFF6C63FF)});

  @override
  void paint(Canvas canvas, Size size) {
    if (trend.isEmpty) return;
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = lineColor
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
      canvas.drawCircle(p, 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

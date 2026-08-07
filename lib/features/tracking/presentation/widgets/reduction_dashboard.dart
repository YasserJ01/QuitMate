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
import '../widgets/dashboard_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/fade_slide_in.dart';

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

          GreetingHeader(nickname: profile.nickname),
          const SizedBox(height: 16),

          FadeSlideIn(
            child: HeroStreakSection(
              statistics: stats,
              quitDate: profile.quitDate,
              mode: GoalType.reduceMasturbation,
            ),
          ),
          const SizedBox(height: 20),

          FadeSlideIn(
            delay: const Duration(milliseconds: 80),
            child: QuickStatsRow(
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
          ),
          const SizedBox(height: 24),

          BoldSectionHeader(title: 'Your Journey', icon: Icons.route),
          const SizedBox(height: 12),
          const ReasonsWallCard(),
          const SizedBox(height: 16),

          if (completeness.hasTimeReclaimData) ...[
            FadeSlideIn(child: TimeReclaimedCard(statistics: stats)),
            const SizedBox(height: 16),
          ] else ...[
            FadeSlideIn(
              child: ProfileNudgeCard(
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
            ),
            const SizedBox(height: 16),
          ],

          if (completeness.hasValuesData && profile.values.isNotEmpty)
            FadeSlideIn(child: _ValuesAnchorCard(values: profile.values))
          else
            FadeSlideIn(
              child: ProfileNudgeCard(
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
            ),
          const SizedBox(height: 16),

          if (completeness.hasDistressBaseline && stats.distressTrend.length >= 3)
            FadeSlideIn(child: _DistressTrendCard(trend: stats.distressTrend)),
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
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardCardHeader(
            icon: Icons.favorite,
            title: 'Your Values',
            accent: DashboardTheme.primary(context),
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
    // A downward trend in distress is good — surface that as a subtitle.
    String? subtitle;
    if (trend.length >= 2) {
      final delta = trend.last - trend.first;
      if (delta < -0.5) {
        subtitle = 'Trending calmer';
      } else if (delta > 0.5) {
        subtitle = 'A little higher lately';
      } else {
        subtitle = 'Holding steady';
      }
    }

    final lineColor = DashboardTheme.success(context);

    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardCardHeader(
            icon: Icons.trending_down,
            title: 'Distress Trend',
            subtitle: subtitle,
            accent: lineColor,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: trend.length >= 3
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _YAxisLabels(color: DashboardTheme.textSecondary(context)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomPaint(
                          painter: _SmoothTrendPainter(
                            trend: trend,
                            lineColor: lineColor,
                            gridColor: DashboardTheme.cardBorder(context),
                          ),
                          size: Size.infinite,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'Need at least 3 check-ins for trend',
                      style: TextStyle(
                        color: DashboardTheme.textSecondary(context),
                        fontSize: 13,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _YAxisLabels extends StatelessWidget {
  final Color color;
  const _YAxisLabels({required this.color});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('10', style: style),
        Text('5', style: style),
        Text('0', style: style),
      ],
    );
  }
}

/// Paints distress (0–10) over time as a smooth Catmull-Rom-ish curve with a
/// soft gradient fill, a baseline grid, and endpoint dots.
class _SmoothTrendPainter extends CustomPainter {
  final List<double> trend;
  final Color lineColor;
  final Color gridColor;

  _SmoothTrendPainter({
    required this.trend,
    required this.lineColor,
    required this.gridColor,
  });

  double _y(double value, double height) =>
      height - (value.clamp(0, 10) / 10.0) * height;

  @override
  void paint(Canvas canvas, Size size) {
    if (trend.length < 2) return;

    // Horizontal gridlines at 0, 5, 10.
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (final v in [0.0, 5.0, 10.0]) {
      final y = _y(v, size.height);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final stepX = size.width / (trend.length - 1);
    final points = <Offset>[
      for (int i = 0; i < trend.length; i++)
        Offset(i * stepX, _y(trend[i], size.height)),
    ];

    // Smooth path through points using midpoint quadratics.
    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      linePath.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
    }
    linePath.lineTo(points.last.dx, points.last.dy);

    // Gradient fill under the curve.
    final fillPath = Path.from(linePath)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withValues(alpha: 0.28),
          lineColor.withValues(alpha: 0.0),
        ],
      ).createShader(Offset.zero & size);
    canvas.drawPath(fillPath, fillPaint);

    // The line itself.
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(linePath, linePaint);

    // Endpoint dots (first and last) for emphasis.
    final dotFill = Paint()..color = lineColor;
    final dotRing = Paint()..color = Colors.white;
    for (final p in [points.first, points.last]) {
      canvas.drawCircle(p, 5, dotFill);
      canvas.drawCircle(p, 2.5, dotRing);
    }
  }

  @override
  bool shouldRepaint(covariant _SmoothTrendPainter oldDelegate) =>
      oldDelegate.trend != trend ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.gridColor != gridColor;
}

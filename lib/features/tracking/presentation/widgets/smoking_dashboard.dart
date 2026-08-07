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
import '../widgets/savings_card.dart';
import '../widgets/health_metrics_card.dart';
import '../widgets/profile_nudge_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/fade_slide_in.dart';

class SmokingDashboard extends ConsumerWidget {
  final UserProfile profile;

  const SmokingDashboard({super.key, required this.profile});

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
    AsyncValue<List<LogEntry>> logsAsync,
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
              mode: GoalType.quitSmoking,
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
                icon: Icons.check_circle,
                label: 'Clean',
                value: '${stats.daysClean}',
                color: DashboardTheme.success(context),
              ),
              if (stats.totalCravings > 0)
                QuickStat(
                  icon: Icons.psychology,
                  label: 'Cravings',
                  value: '${stats.totalCravings}',
                  color: DashboardTheme.warning(context),
                ),
              if (stats.moneySaved > 0)
                QuickStat(
                  icon: Icons.savings,
                  label: 'Saved',
                  value: '\$${stats.moneySaved.toStringAsFixed(0)}',
                  color: DashboardTheme.success(context),
                ),
            ],
            ),
          ),
          const SizedBox(height: 24),

          BoldSectionHeader(title: 'Your Journey', icon: Icons.route),
          const SizedBox(height: 12),
          const ReasonsWallCard(),
          const SizedBox(height: 16),

          if (completeness.hasMoneySavingsData) ...[
            FadeSlideIn(child: SavingsCard(statistics: stats)),
            const SizedBox(height: 16),
          ] else ...[
            FadeSlideIn(
              child: ProfileNudgeCard(
                message: 'Add your cigarette cost to see money saved',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfileScreen(
                      section: ProfileSection.smokingCosts,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          if (completeness.hasHealthMilestoneData) ...[
            FadeSlideIn(child: HealthMetricsCard(statistics: stats)),
            const SizedBox(height: 16),
          ] else ...[
            FadeSlideIn(
              child: ProfileNudgeCard(
                message: 'Add cigarettes per day to see health milestones',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfileScreen(
                      section: ProfileSection.smokingDetails,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

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
                subtitle: 'Exercises to ride out cravings',
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

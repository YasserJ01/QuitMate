import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../onboarding/data/models/user_profile.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/domain/services/profile_completeness_service.dart';
import '../../../onboarding/presentation/providers/profile_completeness_provider.dart';
import '../../../onboarding/presentation/screens/edit_profile_screen.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../achievements/presentation/widgets/achievements_preview_card.dart';
import '../../../achievements/presentation/widgets/next_achievement_card.dart';
import '../../../achievements/presentation/widgets/reasons_wall_card.dart';
import '../../data/models/statistics.dart';
import '../providers/statistics_provider.dart';
import '../widgets/streak_card.dart';
import '../widgets/stats_summary_card.dart';
import '../widgets/savings_card.dart';
import '../widgets/health_metrics_card.dart';
import '../widgets/profile_nudge_card.dart';

/// Smoking-specific dashboard per SRS §10.4.
class SmokingDashboard extends ConsumerWidget {
  final UserProfile profile;

  const SmokingDashboard({super.key, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(statisticsProvider);
    final stats = statsState.statistics;
    final completenessAsync = ref.watch(profileCompletenessProvider);

    return completenessAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _buildContent(context, stats, ProfileCompleteness.empty()),
      data: (completeness) => _buildContent(context, stats, completeness),
    );
  }

  Widget _buildContent(
    BuildContext context,
    Statistics stats,
    ProfileCompleteness completeness,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Mode chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('🚭', style: TextStyle(fontSize: 16)),
              SizedBox(width: 6),
              Text('Quit Smoking',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Hero Streak Section
        StreakCard(
          statistics: stats,
          quitDate: profile.quitDate,
          mode: GoalType.quitSmoking,
        ),
        const SizedBox(height: 16),

        // Reasons Wall
        const ReasonsWallCard(),
        const SizedBox(height: 16),

        // Stats Row
        StatsSummaryCard(statistics: stats),
        const SizedBox(height: 16),

        // Money Saved card — gated on completeness
        if (completeness.hasMoneySavingsData) ...[
          SavingsCard(statistics: stats),
          const SizedBox(height: 16),
        ] else ...[
          ProfileNudgeCard(
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
          const SizedBox(height: 16),
        ],

        // Health Metrics — gated on completeness
        if (completeness.hasHealthMilestoneData) ...[
          HealthMetricsCard(statistics: stats),
          const SizedBox(height: 16),
        ] else ...[
          ProfileNudgeCard(
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
          const SizedBox(height: 16),
        ],

        // ── Achievements ───────────────────────────────────────────────
        const AchievementsPreviewCard(),
        const NextAchievementCard(),
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
                      icon: Icons.edit_note,
                      label: 'Log Event',
                      onTap: () {
                        // Quick log handled by FAB
                      },
                    ),
                    const SizedBox(width: 8),
                    _QuickActionChip(
                      icon: Icons.self_improvement,
                      label: 'Open Toolkit',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CravingToolkitScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Profile completion nudge if fill < 50%
        if (completeness.fillPercentage < 0.5)
          ProfileNudgeCard(
            message:
                'Complete more of your profile to unlock personalized features',
          ),

        const SizedBox(height: 96), // clearance for FABs
      ],
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: AppTheme.primaryColor),
      label: Text(label),
      onPressed: onTap,
      backgroundColor: AppTheme.primaryColor.withValues(alpha:0.1),
      side: BorderSide(color: AppTheme.primaryColor.withValues(alpha:0.3)),
    );
  }
}

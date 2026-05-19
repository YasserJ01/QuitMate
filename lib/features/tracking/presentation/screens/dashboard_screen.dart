import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/features/interventions/presentation/screens/notifications_settings_screen.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../achievements/presentation/providers/achievement_provider.dart';
import '../../../achievements/domain/entities/achievement.dart';
import '../../../achievements/presentation/screens/badge_gallery_screen.dart';
import '../../../achievements/presentation/widgets/achievement_unlock_overlay.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../relapse_prevention/presentation/screens/relapse_plan_screen.dart';
import '../../../relapse_prevention/presentation/widgets/panic_button.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/presentation/providers/profile_completeness_provider.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../providers/statistics_provider.dart';
import '../providers/tracking_provider.dart';
import '../widgets/smoking_dashboard.dart';
import '../widgets/reduction_dashboard.dart';
import '../widgets/quick_log_button.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import 'log_history_screen.dart';
import 'detailed_stats_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _hasEvaluatedAchievements = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsProvider.notifier).refresh();
    });
  }

  void _evaluateAchievements() {
    ref.read(achievementNotifierProvider.notifier).evaluate().catchError((e) {
      debugPrint('_evaluateAchievements failed: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StatisticsState>(statisticsProvider, (previous, next) {
      if (_hasEvaluatedAchievements) return;
      if (!next.isLoading && next.error == null && next.statistics.currentStreak > 0) {
        _hasEvaluatedAchievements = true;
        _evaluateAchievements();
      }
    });

    final statsState = ref.watch(statisticsProvider);
    final userIdAsync = ref.watch(currentUserIdProvider);
    final earnedAsync = ref.watch(earnedAchievementsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          _AchievementsIconButton(earnedAsync: earnedAsync),
          _DashboardOverflowMenu(),
        ],
      ),
      body: Stack(
        children: [
          userIdAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (userId) {
              if (userId == null) {
                return const Center(
                    child: Text('Please complete onboarding'));
              }

              if (statsState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (statsState.error != null) {
                return _ErrorBody(
                  message: statsState.error!,
                  onRetry: () =>
                      ref.read(statisticsProvider.notifier).refresh(),
                );
              }

              // Load profile and use mode factory
              return RefreshIndicator(
                onRefresh: () async =>
                    ref.read(statisticsProvider.notifier).refresh(),
                child: _ModeAwareBody(userId: userId),
              );
            },
          ),
          // Achievement unlock overlay listener
          _AchievementOverlayListener(),
        ],
      ),
      floatingActionButton: _Fabs(
        onCravingLogged: () => _onCravingLogged(),
        onCravingResisted: () => _onCravingResisted(),
        onLogSuccess: () => _onLogSuccess(),
      ),
    );
  }

  Future<void> _onCravingLogged() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    ref.read(notificationManagerProvider).whenData(
          (m) => m.onCravingLogged(userId),
        );
  }

  Future<void> _onCravingResisted() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    ref.read(notificationManagerProvider).whenData(
          (m) => m.onCravingResisted(userId),
        );
  }

  void _onLogSuccess() {
    ref.read(statisticsProvider.notifier).refresh();
    ref.invalidate(todaysLogsProvider);
    _evaluateAchievements();
  }
}

// ─── Achievements icon with badge ─────────────────────────────────────────

class _AchievementsIconButton extends ConsumerWidget {
  final AsyncValue<List<Achievement>> earnedAsync;

  const _AchievementsIconButton({required this.earnedAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newCount = earnedAsync.when(
      data: (achievements) => achievements
          .where((a) => a.unlockedAt != null &&
              DateTime.now().difference(a.unlockedAt!).inDays <= 1)
          .length,
      loading: () => 0,
      error: (_, __) => 0,
    );

    return MergeSemantics(
      child: Semantics(
        label: 'Achievements. $newCount new unlock${newCount == 1 ? '' : 's'}',
        button: true,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_events),
              tooltip: 'Achievements',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BadgeGalleryScreen()),
              ),
            ),
            if (newCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    newCount > 9 ? '9+' : '$newCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Overflow menu for secondary actions ──────────────────────────────────

class _DashboardOverflowMenu extends ConsumerWidget {
  const _DashboardOverflowMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: 'More options',
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        tooltip: 'More options',
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'history',
            child: Row(
              children: [
                Icon(Icons.history, size: 20),
                SizedBox(width: 12),
                Text('History'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'stats',
            child: Row(
              children: [
                Icon(Icons.bar_chart, size: 20),
                SizedBox(width: 12),
                Text('Detailed Stats'),
              ],
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: 'toolkit',
            child: Row(
              children: [
                Icon(Icons.self_improvement, size: 20),
                SizedBox(width: 12),
                Text('Craving Toolkit'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'relapse',
            child: Row(
              children: [
                Icon(Icons.shield, size: 20),
                SizedBox(width: 12),
                Text('Relapse Plan'),
              ],
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: 'notifications',
            child: Row(
              children: [
                Icon(Icons.notifications_outlined, size: 20),
                SizedBox(width: 12),
                Text('Notifications'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'settings',
            child: Row(
              children: [
                Icon(Icons.settings, size: 20),
                SizedBox(width: 12),
                Text('Settings'),
              ],
            ),
          ),
        ],
        onSelected: (value) {
          switch (value) {
            case 'history':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LogHistoryScreen()));
            case 'stats':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DetailedStatsScreen()));
            case 'toolkit':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CravingToolkitScreen()));
            case 'relapse':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RelapsePlanScreen()));
            case 'notifications':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NotificationSettingsScreen()));
            case 'settings':
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()));
          }
        },
      ),
    );
  }
}

// ─── Mode-aware body — switches dashboard variant based on goalType ─────

class _ModeAwareBody extends ConsumerWidget {
  final String userId;

  const _ModeAwareBody({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardDataAsync = ref.watch(dashboardDataProvider);

    return dashboardDataAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (data) {
        final profile = data.profile;
        return switch (profile.goalType) {
          GoalType.quitSmoking => SmokingDashboard(profile: profile),
          GoalType.reduceMasturbation => ReductionDashboard(profile: profile),
        };
      },
    );
  }
}

// ─── FABs ──────────────────────────────────────────────────────────────────

class _Fabs extends StatelessWidget {
  final VoidCallback onCravingLogged;
  final VoidCallback onCravingResisted;
  final VoidCallback onLogSuccess;

  const _Fabs({
    required this.onCravingLogged,
    required this.onCravingResisted,
    required this.onLogSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        QuickLogButton(
          onCravingLogged: onCravingLogged,
          onCravingResisted: onCravingResisted,
          onLogSuccess: onLogSuccess,
        ),
        const SizedBox(height: 16),
        const PanicButton(),
      ],
    );
  }
}

// ─── Achievement unlock overlay listener ──────────────────────────────────

class _AchievementOverlayListener extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pendingUnlockAnimationsProvider, (prev, next) {
      if (next.isNotEmpty && context.mounted) {
        final achievement = ref
            .read(pendingUnlockAnimationsProvider.notifier)
            .dequeue();
        if (achievement != null) {
          AchievementUnlockOverlay.enqueue(context, achievement);
        }
      }
    });
    return const SizedBox.shrink();
  }
}

// ─── Error body ────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorBody({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppTheme.errorColor),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

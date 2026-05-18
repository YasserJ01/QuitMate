import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/features/interventions/presentation/screens/notifications_settings_screen.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../achievements/presentation/providers/achievement_provider.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsProvider.notifier).refresh();
      _checkMilestones();
      // NOTE: _evaluateAchievements() is now called via ref.listen() below
      // so it fires AFTER statistics finish loading (B-01 fix).
    });
  }

  void _evaluateAchievements() {
    ref.read(achievementNotifierProvider.notifier).evaluate().catchError((e) {
      debugPrint('_evaluateAchievements failed: $e');
    });
  }

  Future<void> _checkMilestones() async {
    final managerAsync = ref.read(notificationManagerProvider);
    final manager = managerAsync.valueOrNull;
    if (manager == null) return;

    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    final stats = ref.read(statisticsProvider).statistics;
    final streak = stats.currentStreak;
    if (streak > 0) {
      await manager.onStreakMilestone(userId, streak);
    }

    final lastOpened = DateTime.now().subtract(const Duration(hours: 25));
    await manager.onInactivityDetected(userId, lastOpened);
  }

  @override
  Widget build(BuildContext context) {
    // B-01 fix: listen to statistics state — evaluate achievements whenever
    // fresh stats arrive (after any log event or manual refresh).
    ref.listen<StatisticsState>(statisticsProvider, (previous, next) {
      if (!next.isLoading && next.error == null && next.statistics.currentStreak > 0) {
        _evaluateAchievements();
      }
    });

    final statsState = ref.watch(statisticsProvider);
    final userIdAsync = ref.watch(currentUserIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'History',
            onPressed: () => _push(context, const LogHistoryScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Detailed stats',
            onPressed: () => _push(context, const DetailedStatsScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.self_improvement),
            tooltip: 'Craving toolkit',
            onPressed: () => _push(context, const CravingToolkitScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.shield),
            tooltip: 'Relapse plan',
            onPressed: () => _push(context, const RelapsePlanScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notification settings',
            onPressed: () =>
                _push(context, const NotificationSettingsScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.emoji_events),
            tooltip: 'Achievements',
            onPressed: () =>
                _push(context, const BadgeGalleryScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () =>
                _push(context, const SettingsScreen()),
          ),
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

  void _push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
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

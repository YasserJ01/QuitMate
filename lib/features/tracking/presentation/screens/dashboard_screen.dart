import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/features/interventions/presentation/screens/Notifications_permissions_banner.dart';
import 'package:quitmate/features/interventions/presentation/screens/notifications_settings_screen.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../relapse_prevention/presentation/screens/relapse_plan_screen.dart';
import '../../../relapse_prevention/presentation/widgets/panic_button.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../../data/models/log_entry.dart';
import '../providers/statistics_provider.dart';
import '../providers/tracking_provider.dart';
import '../widgets/streak_card.dart';
import '../widgets/quick_log_button.dart';
import '../widgets/stats_summary_card.dart';
import '../widgets/savings_card.dart';
import '../widgets/health_metrics_card.dart';
import '../widgets/chart_card.dart';
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
    });
  }

  // ─── Milestone & inactivity hooks ──────────────────────────────────────────

  /// Fires streak-milestone and inactivity notifications when appropriate.
  /// Called once per cold start — cheap (two DB reads).
  Future<void> _checkMilestones() async {
    final managerAsync = ref.read(notificationManagerProvider);
    final manager = managerAsync.valueOrNull;
    if (manager == null) return;

    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    // Streak milestone check
    final stats = ref.read(statisticsProvider).statistics;
    final streak = stats.currentStreak;
    if (streak > 0) {
      await manager.onStreakMilestone(userId, streak);
    }

    // Inactivity check (uses current time as proxy — real apps store last-open timestamp)
    // Replace DateTime.now().subtract(...) with your stored lastOpenedAt if available.
    final lastOpened =
    DateTime.now().subtract(const Duration(hours: 25)); // placeholder
    await manager.onInactivityDetected(userId, lastOpened);
  }

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
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
          // ── Notification settings entry point ──────────────────────────
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notification settings',
            onPressed: () =>
                _push(context, const NotificationSettingsScreen()),
          ),
        ],
      ),
      body: userIdAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (userId) {
          if (userId == null) {
            return const Center(child: Text('Please complete onboarding'));
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

          return RefreshIndicator(
            onRefresh: () async =>
                ref.read(statisticsProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const NotificationPermissionBanner(),
                const SizedBox(height: 8),
                _WelcomeSection(userId: userId),
                const SizedBox(height: 24),
                StreakCard(statistics: statsState.statistics),
                const SizedBox(height: 16),
                StatsSummaryCard(statistics: statsState.statistics),
                const SizedBox(height: 16),
                if (statsState.statistics.potentialMoneySaved > 0) ...[
                  SavingsCard(statistics: statsState.statistics),
                  const SizedBox(height: 16),
                ],
                if (statsState.statistics.cigarettesAvoided > 0) ...[
                  HealthMetricsCard(statistics: statsState.statistics),
                  const SizedBox(height: 16),
                ],
                ChartCard(statistics: statsState.statistics),
                const SizedBox(height: 16),
                _RecentActivitySection(userId: userId),
                const SizedBox(height: 96), // clearance for two FABs
              ],
            ),
          );
        },
      ),
      floatingActionButton: _Fabs(
        onCravingLogged: () => _onCravingLogged(),
        onCravingResisted: () => _onCravingResisted(),
        onLogSuccess: () => _onLogSuccess(),
      ),
    );
  }

  // ─── Notification event hooks ───────────────────────────────────────────────

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
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}

// ─── Welcome section ──────────────────────────────────────────────────────────

class _WelcomeSection extends ConsumerWidget {
  final String userId;
  const _WelcomeSection({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String>(
      future: _resolveName(ref),
      builder: (context, snap) {
        final name = snap.data ?? 'there';
        final tod = _timeOfDay();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good $tod, $name!',
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 4),
            Text('Keep up the great work!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                )),
          ],
        );
      },
    );
  }

  Future<String> _resolveName(WidgetRef ref) async {
    final repo = ref.read(profileRepositoryProvider);
    final profile = await repo.getProfile(userId);
    return profile?.nickname ?? 'there';
  }

  String _timeOfDay() {
    final h = DateTime.now().hour;
    if (h < 12) return 'morning';
    if (h < 17) return 'afternoon';
    return 'evening';
  }
}

// ─── Recent activity section ──────────────────────────────────────────────────

class _RecentActivitySection extends ConsumerWidget {
  final String userId;
  const _RecentActivitySection({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysLogs = ref.watch(todaysLogsProvider);

    return todaysLogs.when(
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Error: $e'),
        ),
      ),
      data: (logs) {
        if (logs.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.check_circle_outline,
                      size: 48,
                      color: AppTheme.successColor.withOpacity(0.5)),
                  const SizedBox(height: 12),
                  Text('No activity today',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text('Keep it up!',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      )),
                ],
              ),
            ),
          );
        }

        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's activity",
                        style: Theme.of(context).textTheme.titleLarge),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LogHistoryScreen()),
                      ),
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logs.length > 3 ? 3 : logs.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final log = logs[i];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                      _logColor(log.type).withOpacity(0.1),
                      child: Text(log.type.emoji,
                          style: const TextStyle(fontSize: 20)),
                    ),
                    title: Text(log.type.displayName),
                    subtitle: Text(log.formattedTime),
                    trailing: log.mood != null
                        ? Text(log.mood!.emoji,
                        style: const TextStyle(fontSize: 20))
                        : null,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Color _logColor(LogType type) => switch (type) {
    LogType.cigarette => AppTheme.errorColor,
    LogType.episode => AppTheme.warningColor,
    LogType.craving => AppTheme.primaryColor,
    LogType.relapse => AppTheme.errorColor,
  };
}

// ─── FABs ─────────────────────────────────────────────────────────────────────

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

// ─── Error body ───────────────────────────────────────────────────────────────

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
          const Icon(Icons.error_outline,
              size: 48, color: AppTheme.errorColor),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
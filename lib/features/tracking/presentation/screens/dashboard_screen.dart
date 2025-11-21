import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
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
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh statistics on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsProvider.notifier).refresh();
    });
  }

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
            tooltip: 'View History',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogHistoryScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Detailed Stats',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailedStatsScreen(),
                ),
              );
            },
          ),
          // Add this button to the AppBar actions (before settings icon):
          IconButton(
            icon: const Icon(Icons.self_improvement),
            tooltip: 'Craving Toolkit',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CravingToolkitScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: userIdAsync.when(
        data: (userId) {
          if (userId == null) {
            return const Center(
              child: Text('Please complete onboarding first'),
            );
          }

          if (statsState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (statsState.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: AppTheme.errorColor),
                  const SizedBox(height: 16),
                  Text(statsState.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(statisticsProvider.notifier).refresh();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(statisticsProvider.notifier).refresh();
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Welcome message
                _buildWelcomeSection(),
                const SizedBox(height: 24),

                // Streak card
                StreakCard(statistics: statsState.statistics),
                const SizedBox(height: 16),

                // Quick stats summary
                StatsSummaryCard(statistics: statsState.statistics),
                const SizedBox(height: 16),

                // Savings card (smoking only)
                if (statsState.statistics.potentialMoneySaved > 0)
                  SavingsCard(statistics: statsState.statistics),

                if (statsState.statistics.potentialMoneySaved > 0)
                  const SizedBox(height: 16),

                // Health metrics
                if (statsState.statistics.cigarettesAvoided > 0)
                  HealthMetricsCard(statistics: statsState.statistics),

                if (statsState.statistics.cigarettesAvoided > 0)
                  const SizedBox(height: 16),

                // Chart preview
                ChartCard(statistics: statsState.statistics),
                const SizedBox(height: 16),

                // Recent activity
                _buildRecentActivitySection(),

                const SizedBox(height: 80), // Space for FAB
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: const QuickLogButton(),
    );
  }

  Widget _buildWelcomeSection() {
    return FutureBuilder(
      future: _getProfileName(),
      builder: (context, snapshot) {
        final name = snapshot.data ?? 'there';
        final timeOfDay = _getTimeOfDay();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good $timeOfDay, $name!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Keep up the great work!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecentActivitySection() {
    final todaysLogs = ref.watch(todaysLogsProvider);

    return todaysLogs.when(
      data: (logs) {
        if (logs.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 48,
                    color: AppTheme.successColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No activity today',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Keep it up!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
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
                    Text(
                      'Today\'s Activity',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogHistoryScreen(),
                          ),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logs.length > 3 ? 3 : logs.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final log = logs[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getLogTypeColor(log.type).withOpacity(0.1),
                      child: Text(
                        log.type.emoji,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    title: Text(log.type.displayName),
                    subtitle: Text(log.formattedTime),
                    trailing: log.mood != null
                        ? Text(
                      log.mood!.emoji,
                      style: const TextStyle(fontSize: 24),
                    )
                        : null,
                  );
                },
              ),
            ],
          ),
        );
      },
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Error loading activity: $error'),
        ),
      ),
    );
  }

  Future<String> _getProfileName() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return 'there';

    final profileRepo = ref.read(profileRepositoryProvider);
    final profile = await profileRepo.getProfile(userId);

    return profile?.nickname ?? 'there';
  }

  String _getTimeOfDay() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }

  Color _getLogTypeColor(LogType type) {
    switch (type) {
      case LogType.cigarette:
        return AppTheme.errorColor;
      case LogType.episode:
        return AppTheme.warningColor;
      case LogType.craving:
        return AppTheme.primaryColor;
      case LogType.relapse:
        return AppTheme.errorColor;
    }
  }
}
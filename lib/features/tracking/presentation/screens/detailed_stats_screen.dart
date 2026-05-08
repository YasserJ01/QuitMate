import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../data/models/statistics.dart';
import '../providers/statistics_provider.dart';
import '../providers/tracking_provider.dart';
import '../../services/export_service.dart';
import 'package:share_plus/share_plus.dart';

class DetailedStatsScreen extends ConsumerStatefulWidget {
  const DetailedStatsScreen({super.key});

  @override
  ConsumerState<DetailedStatsScreen> createState() => _DetailedStatsScreenState();
}

class _DetailedStatsScreenState extends ConsumerState<DetailedStatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statsState = ref.watch(statisticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Statistics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Export Data',
            onPressed: () => _showExportOptions(context),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Trends'),
            Tab(text: 'Insights'),
          ],
        ),
      ),
      body: statsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(statsState.statistics),
          _buildTrendsTab(statsState.statistics),
          _buildInsightsTab(statsState.statistics),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(Statistics stats) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildStatCard(
          'Streak Information',
          [
            _buildStatRow('Current Streak', '${stats.currentStreak} days', Icons.local_fire_department),
            _buildStatRow('Longest Streak', '${stats.longestStreak} days', Icons.emoji_events),
            _buildStatRow('Days Tracking', '${stats.daysTracking} days', Icons.calendar_today),
            _buildStatRow('Days Clean', '${stats.daysClean} days', Icons.check_circle),
          ],
        ),
        const SizedBox(height: 16),

        _buildStatCard(
          'Activity Summary',
          [
            if (stats.totalCigarettes > 0)
              _buildStatRow('Total Cigarettes', '${stats.totalCigarettes}', Icons.smoking_rooms),
            if (stats.totalEpisodes > 0)
              _buildStatRow('Total Episodes', '${stats.totalEpisodes}', Icons.warning),
            _buildStatRow('Total Cravings', '${stats.totalCravings}', Icons.psychology),
            _buildStatRow('Cravings Resisted', '${stats.cravingsResisted}', Icons.shield),
            _buildStatRow('Resistance Rate', '${stats.cravingResistanceRate.toStringAsFixed(1)}%', Icons.trending_up),
          ],
        ),
        const SizedBox(height: 16),

        if (stats.moneySaved > 0)
          _buildStatCard(
            'Financial Impact',
            [
              _buildStatRow('Money Saved', '\$${stats.moneySaved.toStringAsFixed(2)}', Icons.savings),
              _buildStatRow('Potential Savings', '\$${stats.potentialMoneySaved.toStringAsFixed(2)}', Icons.account_balance_wallet),
            ],
          ),

        if (stats.cigarettesAvoided > 0) ...[
          const SizedBox(height: 16),
          _buildStatCard(
            'Health Metrics',
            [
              _buildStatRow('Cigarettes Avoided', '${stats.cigarettesAvoided}', Icons.do_not_disturb_on),
              _buildStatRow('Life Minutes Gained', stats.lifeMinutesGained.toStringAsFixed(0), Icons.access_time),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildTrendsTab(Statistics stats) {
    final triggerData = ref.watch(triggerFrequencyDataProvider(TimeRange.month));
    final hourlyData = ref.watch(hourlyDistributionDataProvider(TimeRange.month));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Triggers',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),

                triggerData.when(
                  data: (triggers) {
                    if (triggers.isEmpty) {
                      return const Text('No trigger data yet');
                    }

                    return Column(
                      children: triggers.take(5).map((trigger) {
                        final maxCount = triggers.first.value.toDouble();
                        final percent = (trigger.value / maxCount);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(trigger.key),
                                  Text(
                                    '${trigger.value} times',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              LinearProgressIndicator(
                                value: percent,
                                backgroundColor: Colors.grey.shade300,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppTheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hourly Distribution',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'When do events occur most?',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),

                hourlyData.when(
                  data: (hourly) {
                    if (hourly.values.every((v) => v == 0)) {
                      return const Text('No hourly data yet');
                    }

                    return SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: hourly.values.reduce((a, b) => a > b ? a : b).toDouble() * 1.2,
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value.toInt() % 4 != 0) return const SizedBox();
                                  return Text(
                                    '${value.toInt()}h',
                                    style: const TextStyle(fontSize: 10),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: List.generate(24, (index) {
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: hourly[index]!.toDouble(),
                                  color: AppTheme.primaryColor,
                                  width: 8,
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Text('Error: $error'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInsightsTab(Statistics stats) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInsightCard(
          icon: Icons.trending_up,
          title: 'Weekly Improvement',
          value: '${stats.weeklyImprovement > 0 ? '+' : ''}${stats.weeklyImprovement.toStringAsFixed(1)}%',
          description: stats.weeklyImprovement > 0
              ? 'Your resistance rate improved this week!'
              : stats.weeklyImprovement < 0
              ? 'Let\'s work on bouncing back next week'
              : 'Maintaining steady progress',
          color: stats.weeklyImprovement >= 0 ? AppTheme.successColor : AppTheme.warningColor,
        ),
        const SizedBox(height: 16),

        _buildInsightCard(
          icon: Icons.calculate,
          title: 'Average Per Day',
          value: stats.averagePerDay.toStringAsFixed(2),
          description: 'events per day since you started',
          color: AppTheme.primaryColor,
        ),
        const SizedBox(height: 16),

        if (stats.currentStreak > 0)
          _buildInsightCard(
            icon: Icons.local_fire_department,
            title: 'Streak Strength',
            value: _getStreakStrengthLabel(stats.currentStreak),
            description: _getStreakEncouragement(stats.currentStreak),
            color: AppTheme.successColor,
          ),

        const SizedBox(height: 24),

        Text(
          'Keep Going!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          _getMotivationalMessage(stats),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
            children: [
            Icon(icon, size: 20, color: AppTheme.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label),
        ),
        Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize:16,
            ),
        ),
            ],
        ),
    );
  }

  Widget _buildInsightCard({
    required IconData icon,
    required String title,
    required String value,
    required String description,
    required Color color,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha:0.1),
              color.withValues(alpha:0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha:0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStreakStrengthLabel(int days) {
    if (days < 3) return 'Building';
    if (days < 7) return 'Strong';
    if (days < 30) return 'Impressive';
    if (days < 90) return 'Amazing';
    return 'Legendary';
  }

  String _getStreakEncouragement(int days) {
    if (days < 3) return 'You\'re on your way! Keep it up!';
    if (days < 7) return 'You\'re doing great! Stay focused!';
    if (days < 30) return 'Incredible progress! You should be proud!';
    if (days < 90) return 'You\'re crushing it! This is outstanding!';
    return 'You\'re a true champion! Absolutely remarkable!';
  }

  String _getMotivationalMessage(Statistics stats) {
    if (stats.currentStreak < 7) {
      return 'The first week is the hardest. You\'re building new habits and breaking old patterns. Stay strong!';
    } else if (stats.currentStreak < 30) {
      return 'You\'re past the initial challenge! Your body and mind are adapting. Keep the momentum going!';
    } else if (stats.currentStreak < 90) {
      return 'One month is a huge milestone! You\'ve proven you can do this. The benefits are really adding up!';
    } else if (stats.currentStreak < 365) {
      return 'Three months! You\'ve fundamentally changed your habits. This is your new normal. Amazing work!';
    } else {
      return 'A full year! You\'ve completely transformed your life. You\'re an inspiration!';
    }
  }

  void _showExportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Export as CSV'),
              onTap: () {
                Navigator.pop(context);
                _exportCSV();
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Export as JSON'),
              onTap: () {
                Navigator.pop(context);
                _exportJSON();
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Generate Report'),
              onTap: () {
                Navigator.pop(context);
                _exportReport();
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _exportCSV() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final repository = ref.read(trackingRepositoryProvider);
      final exportService = ExportService(repository);
      final stats = ref.read(statisticsProvider).statistics;

      final file = await exportService.exportToCsv(userId, stats);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Data Export',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CSV exported successfully'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  Future<void> _exportJSON() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final repository = ref.read(trackingRepositoryProvider);
      final exportService = ExportService(repository);

      final file = await exportService.exportToJson(userId);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Data Export',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('JSON exported successfully'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  Future<void> _exportReport() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final repository = ref.read(trackingRepositoryProvider);
      final exportService = ExportService(repository);
      final stats = ref.read(statisticsProvider).statistics;

      final profileRepo = ref.read(profileRepositoryProvider);
      final profile = await profileRepo.getProfile(userId);
      final userName = profile?.nickname ?? 'User';

      final file = await exportService.exportSummaryReport(userId, stats, userName);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Progress Report',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report generated successfully'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Report generation failed: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }
}
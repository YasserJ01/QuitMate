import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/toolkit_statistics.dart';
import '../providers/toolkit_provider.dart';

class ToolkitHistoryScreen extends ConsumerWidget {
  const ToolkitHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(toolkitStatisticsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Toolkit History')),
      body: statsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error loading history: $error')),
        data: (stats) {
          if (stats.isEmpty) return const _EmptyHistory();
          return _HistoryBody(stats: stats);
        },
      ),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text('No history yet', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Start using toolkit techniques to see your history',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _HistoryBody extends StatelessWidget {
  final ToolkitStatistics stats;
  const _HistoryBody({required this.stats});

  @override
  Widget build(BuildContext context) {
    // Categories sorted by average rating (highest first), then by usage.
    final categories = stats.byCategory.values.toList()
      ..sort((a, b) {
        final byRating = b.averageRating.compareTo(a.averageRating);
        if (byRating != 0) return byRating;
        return b.total.compareTo(a.total);
      });

    final mostEffective = stats.mostEffectiveCategory;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Overall summary card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Overall Statistics',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _StatRow(
                  label: 'Total Sessions',
                  value: '${stats.totalSessions}',
                  icon: Icons.repeat,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Completed',
                  value: '${stats.completedSessions}',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Most Effective',
                  value: mostEffective?.displayName ?? 'Not enough data',
                  icon: Icons.star,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Cravings Resisted',
                  value: '${stats.cravingsResistedWithToolkit}',
                  icon: Icons.shield,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Per-category breakdown
        ...categories.map((stat) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _CategoryCard(
                stat: stat,
                isMostEffective: stat.category == mostEffective,
              ),
            )),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryStat stat;
  final bool isMostEffective;
  const _CategoryCard({required this.stat, required this.isMostEffective});

  @override
  Widget build(BuildContext context) {
    final topExercises = stat.exerciseUsage.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(stat.category.emoji,
                    style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    stat.category.displayName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (isMostEffective)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.successColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star,
                            size: 14, color: AppTheme.successColor),
                        SizedBox(width: 4),
                        Text(
                          'Top',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.successColor,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            _StatRow(
              label: 'Sessions',
              value: '${stat.total}',
              icon: Icons.repeat,
            ),
            const SizedBox(height: 12),
            _StatRow(
              label: 'Completed',
              value: '${stat.completed}/${stat.total}',
              icon: Icons.check_circle,
            ),
            const SizedBox(height: 12),
            _StatRow(
              label: 'Average Rating',
              value: stat.averageRating > 0
                  ? '${stat.averageRating.toStringAsFixed(1)}/5'
                  : 'Not rated',
              icon: Icons.star,
            ),
            if (topExercises.length > 1) ...[
              const Divider(height: 24),
              const Text(
                'Most Used:',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              ...topExercises.take(3).map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              e.key,
                              style: const TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${e.value}x',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _StatRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppTheme.primaryColor),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }
}

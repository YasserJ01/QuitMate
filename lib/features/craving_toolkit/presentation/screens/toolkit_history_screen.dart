import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../providers/toolkit_provider.dart';

class ToolkitHistoryScreen extends ConsumerWidget {
  const ToolkitHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(toolkitStatisticsProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Toolkit History'),
        ),
        body: statsAsync.when(
            data: (stats) {
              final totalSessions = stats.totalBreathingSessions +
                  stats.totalCbtSessions +
                  stats.totalGroundingSessions +
                  stats.totalDistractionSessions;
              final techniqueRatings = _buildTechniqueRatings(stats);

              if (totalSessions == 0) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                      Icons.history,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                        'No history yet',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                        const SizedBox(height: 8),
                        Text(
                          'Start using toolkit techniques to see your history',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                );
              }

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Overall stats
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overall Statistics',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          _buildStatRow(
                            context,
                            'Total Sessions',
                            '$totalSessions',
                            Icons.check_circle,
                          ),
                          const SizedBox(height: 12),
                          _buildStatRow(
                            context,
                            'Most Effective',
                            stats.mostEffectiveTechnique,
                            Icons.star,
                          ),
                          const SizedBox(height: 12),
                          _buildStatRow(
                            context,
                            'Cravings Resisted',
                            '${stats.cravingsResistedWithToolkit}',
                            Icons.shield,
                          ),
                          if (techniqueRatings.isNotEmpty) ...[
                            const Divider(height: 24),
                            const Text(
                              'Technique Ratings (Highest to Lowest)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...techniqueRatings,
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Breathing sessions
                  if (stats.totalBreathingSessions > 0) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('🫁', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 12),
                                Text(
                                  'Breathing Exercises',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildStatRow(
                              context,
                              'Sessions',
                              '${stats.totalBreathingSessions}',
                              Icons.repeat,
                            ),
                            const SizedBox(height: 12),
                            _buildStatRow(
                              context,
                              'Average Rating',
                              '${stats.averageBreathingEffectiveness.toStringAsFixed(1)}/5',
                              Icons.star,
                            ),
                            if (stats.breathingPatternUsage.isNotEmpty) ...[
                              const Divider(height: 24),
                              const Text(
                                'Most Used Patterns:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...(() {
                                final entries = stats.breathingPatternUsage.entries
                                    .toList()
                                  ..sort((a, b) => b.value.compareTo(a.value));
                                return entries.take(3);
                              }())
                                  .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${e.key.emoji} ${e.key.displayName}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      '${e.value}x',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // CBT sessions
                  if (stats.totalCbtSessions > 0) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('🧠', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 12),
                                Text(
                                  'CBT Techniques',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildStatRow(
                              context,
                              'Sessions',
                              '${stats.totalCbtSessions}',
                              Icons.repeat,
                            ),
                            const SizedBox(height: 12),
                            _buildStatRow(
                              context,
                              'Average Rating',
                              '${stats.averageCbtEffectiveness.toStringAsFixed(1)}/5',
                              Icons.star,
                            ),
                            if (stats.cbtTechniqueUsage.isNotEmpty) ...[
                              const Divider(height: 24),
                              const Text(
                                'Most Used Techniques:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...(() {
                                final entries = stats.cbtTechniqueUsage.entries
                                    .toList()
                                  ..sort((a, b) => b.value.compareTo(a.value));
                                return entries.take(3);
                              }())
                                  .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${e.key.emoji} ${e.key.displayName}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      '${e.value}x',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.successColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Grounding sessions
                  if (stats.totalGroundingSessions > 0) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('👁️', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 12),
                                Text(
                                  'Grounding Exercises',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildStatRow(
                              context,
                              'Sessions',
                              '${stats.totalGroundingSessions}',
                              Icons.repeat,
                            ),
                            const SizedBox(height: 12),
                            _buildStatRow(
                              context,
                              'Average Rating',
                              '${stats.averageGroundingEffectiveness.toStringAsFixed(1)}/5',
                              Icons.star,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Distraction sessions
                  if (stats.totalDistractionSessions > 0) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('🎮', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 12),
                                Text(
                                  'Distraction Activities',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildStatRow(
                              context,
                              'Sessions',
                              '${stats.totalDistractionSessions}',
                              Icons.repeat,
                            ),
                            const SizedBox(height: 12),
                            _buildStatRow(
                              context,
                              'Average Rating',
                              '${stats.averageDistractionEffectiveness.toStringAsFixed(1)}/5',
                              Icons.star,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error loading history: $error'),
          ),
        ),
    );
  }

  Widget _buildStatRow(
      BuildContext context,
      String label,
      String value,
      IconData icon,
      ) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppTheme.primaryColor),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTechniqueRatings(ToolkitStatistics stats) {
    final ratings = <({String label, double rating, Color color})>[
      (
        label: 'Breathing',
        rating: stats.averageBreathingEffectiveness,
        color: AppTheme.primaryColor,
      ),
      (
        label: 'CBT',
        rating: stats.averageCbtEffectiveness,
        color: AppTheme.successColor,
      ),
      (
        label: 'Grounding',
        rating: stats.averageGroundingEffectiveness,
        color: AppTheme.warningColor,
      ),
      (
        label: 'Distraction',
        rating: stats.averageDistractionEffectiveness,
        color: AppTheme.primaryColor,
      ),
    ]
      ..removeWhere((entry) => entry.rating == 0);

    ratings.sort((a, b) => b.rating.compareTo(a.rating));

    return ratings
        .map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Icon(Icons.star, size: 18, color: entry.color),
                const SizedBox(width: 10),
                Expanded(child: Text(entry.label)),
                Text(
                  '${entry.rating.toStringAsFixed(1)}/5',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}

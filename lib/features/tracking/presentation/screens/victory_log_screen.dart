import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/database/app_database.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../data/repositories/coping_repository.dart';
import '../providers/coping_provider.dart';
import '../providers/tracking_provider.dart';

class VictoryLogScreen extends ConsumerWidget {
  const VictoryLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsync = ref.watch(currentUserIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Victories'),
      ),
      body: userIdAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (userId) {
          if (userId == null) {
            return const Center(child: Text('Please complete onboarding'));
          }
          return _VictoryBody(userId: userId);
        },
      ),
    );
  }
}

class _VictoryBody extends ConsumerWidget {
  final String userId;
  const _VictoryBody({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final victoriesAsync = ref.watch(copingVictoriesProvider(userId));
    final totalAsync = ref.watch(copingTotalProvider(userId));
    final statsAsync = ref.watch(copingStatsProvider(userId));

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                totalAsync.when(
                  loading: () => const SizedBox(height: 60, child: Center(child: CircularProgressIndicator())),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (total) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: DashboardTheme.heroGradient(context),
                        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatBlock(
                            value: '$total',
                            label: 'Total Victories',
                            icon: Icons.emoji_events,
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          statsAsync.when(
                            loading: () => const SizedBox.shrink(),
                            error: (_, __) => const SizedBox.shrink(),
                            data: (stats) {
                              final topEntry = stats.entries.isNotEmpty
                                  ? stats.entries.reduce((a, b) => a.value > b.value ? a : b)
                                  : null;
                              return _StatBlock(
                                value: topEntry?.value.toString() ?? '0',
                                label: 'Top Strategy',
                                icon: Icons.star,
                                subtitle: topEntry?.key,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        victoriesAsync.when(
          loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
          error: (e, _) => SliverFillRemaining(child: Center(child: Text('Error: $e'))),
          data: (victories) {
            if (victories.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.celebration, size: 64, color: DashboardTheme.textDisabled(context)),
                      const SizedBox(height: 16),
                      Text(
                        'No victories yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: DashboardTheme.textPrimary(context),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Beat a craving to log your first victory!',
                        style: TextStyle(
                          color: DashboardTheme.textSecondary(context),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final victory = victories[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _VictoryCard(victory: victory),
                    );
                  },
                  childCount: victories.length,
                ),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final String? subtitle;
  const _StatBlock({required this.value, required this.label, required this.icon, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subtitle != null)
          Text(
            _formatStrategyName(subtitle!),
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
      ],
    );
  }

  String _formatStrategyName(String id) {
    final map = {
      'walk': 'Walk',
      'water': 'Water',
      'called': 'Called someone',
      'music': 'Music',
      'snack': 'Snack',
      'shower': 'Shower',
      'chore': 'Chore',
      'exercise': 'Exercise',
      'read': 'Reading',
      'game': 'Gaming',
      'fresh_air': 'Fresh air',
      'toolkit': 'Toolkit',
      'breathing': 'Breathing',
      'urge_surfing': 'Urge surfing',
      'distraction': 'Distraction',
      'reframing': 'Reframing',
      'grounding': 'Grounding',
      'journaling': 'Journaling',
    };
    if (id.startsWith('called:')) return 'Called ${id.substring(7)}';
    return map[id] ?? id;
  }
}

class _VictoryCard extends StatelessWidget {
  final DbCopingVictory victory;
  const _VictoryCard({required this.victory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: DashboardTheme.success(context).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                victory.moodAfter,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatStrategyName(victory.strategyValue, victory),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: DashboardTheme.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(victory.timestamp),
                  style: TextStyle(
                    fontSize: 12,
                    color: DashboardTheme.textSecondary(context),
                  ),
                ),
                if (victory.customStrategy != null && victory.customStrategy!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    '"${victory.customStrategy!}"',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: DashboardTheme.textSecondary(context),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatStrategyName(String id, DbCopingVictory? victory) {
    final map = {
      'walk': '🚶 Went for a walk',
      'water': '💧 Drank water',
      'music': '🎵 Listened to music',
      'snack': '🍎 Ate something',
      'shower': '🚿 Took a shower',
      'chore': '🧹 Did a chore',
      'exercise': '🏋️ Exercised',
      'read': '📖 Read something',
      'game': '🎮 Played a game',
      'fresh_air': '🌿 Stepped outside',
      'toolkit': '🧰 Used the toolkit',
      'breathing': 'Breathing Exercise',
      'urge_surfing': 'Urge Surfing',
      'distraction': 'Distraction',
      'reframing': 'Cognitive Reframing',
      'grounding': 'Grounding Exercise',
      'journaling': 'Journaling',
    };
    if (id == 'called' && victory != null && victory.contactName != null) {
      final phone = victory.contactPhone != null && victory.contactPhone!.isNotEmpty
          ? ' (${victory.contactPhone})'
          : '';
      return '📞 Called ${victory.contactName}$phone';
    }
    if (id == 'called') return '📞 Called someone';
    return map[id] ?? id;
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

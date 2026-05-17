import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/achievement.dart';
import '../providers/achievement_provider.dart';
import '../widgets/achievement_badge_card.dart';

class BadgeGalleryScreen extends ConsumerWidget {
  const BadgeGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // B-10 fix: live update — invalidate when notifier changes
    ref.listen(achievementNotifierProvider, (_, __) {
      ref.invalidate(achievementsProvider);
    });

    final achievementsAsync = ref.watch(achievementsProvider);

    return achievementsAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Achievements')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Achievements')),
        body: Center(child: Text('Error: $error')),
      ),
      data: (achievements) {
        if (achievements.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: const Text('Achievements')),
            body: _buildEmptyState(context, ref),
          );
        }
        return _buildTabs(context, ref, achievements);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(achievementsProvider);
        await ref.read(achievementsProvider.future);
      },
      child: ListView(
        children: [
          const SizedBox(height: 120),
          Center(
            child: Column(
              children: [
                const Text('🏆', style: TextStyle(fontSize: 64)),
                const SizedBox(height: 16),
                Text('No achievements yet',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  'Keep tracking your progress to earn badges!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),
                Text(
                  'Pull down to refresh',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(
    BuildContext context,
    WidgetRef ref,
    List<Achievement> achievements,
  ) {
    final earned = achievements.where((a) => a.isUnlocked).length;
    final allCategories = AchievementCategory.values;

    return DefaultTabController(
      length: allCategories.length + 1, // +1 for "All"
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Achievements'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Chip(
                label: Text('$earned / ${achievements.length}'),
                avatar: const Icon(Icons.emoji_events, size: 18),
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              const Tab(text: 'All'),
              ...allCategories.map(
                (c) => Tab(text: c.displayName),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(context, ref, achievements),
            ...allCategories.map(
              (c) => _buildTabContent(
                context,
                ref,
                achievements.where((a) => a.category == c).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(
    BuildContext context,
    WidgetRef ref,
    List<Achievement> achievements,
  ) {
    if (achievements.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 80),
          Center(
            child: Text(
              'No achievements in this category',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey.shade600),
            ),
          ),
        ],
      );
    }

    final earned = achievements.where((a) => a.isUnlocked).toList();
    final locked = achievements.where((a) => !a.isUnlocked).toList();

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(achievementsProvider);
        await ref.read(achievementsProvider.future);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (earned.isNotEmpty) ...[
            _SectionHeader(
              title: 'Earned',
              icon: Icons.emoji_events,
              color: const Color(0xFFFFD700),
            ),
            const SizedBox(height: 12),
            _buildGrid(earned, context),
            const SizedBox(height: 32),
          ],
          if (locked.isNotEmpty) ...[
            _SectionHeader(
              title: 'Still to earn',
              icon: Icons.lock_outline,
              color: Colors.grey.shade500,
            ),
            const SizedBox(height: 12),
            _buildGrid(locked, context),
          ],
        ],
      ),
    );
  }

  Widget _buildGrid(List<Achievement> items, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => AchievementBadgeCard(
        achievement: items[i],
        onTap: () => _showDetail(context, items[i]),
      ),
    );
  }

  void _showDetail(BuildContext context, Achievement achievement) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(achievement.iconEmoji,
                style: const TextStyle(fontSize: 64)),
            const SizedBox(height: 12),
            Text(achievement.name, style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(achievement.description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
            if (!achievement.isUnlocked) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: achievement.progressPercent,
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              Text('${achievement.progressValue} / ${achievement.progressMax}'),
            ],
            if (achievement.isUnlocked && achievement.unlockedAt != null)
              Text(
                'Earned ${_formatDate(achievement.unlockedAt!)}',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey.shade600),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[local.month - 1]} ${local.day}, ${local.year}';
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
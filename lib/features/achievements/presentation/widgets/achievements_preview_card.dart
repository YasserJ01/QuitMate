import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/achievement.dart';
import '../providers/achievement_provider.dart';
import '../widgets/achievement_badge_card.dart';
import '../screens/badge_gallery_screen.dart';

/// Shows the 3 most recently earned achievements with a "View All" CTA.
/// Used on the Progress tab.
class AchievementsPreviewCard extends ConsumerWidget {
  const AchievementsPreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final earnedAsync = ref.watch(earnedAchievementsProvider);

    return earnedAsync.when(
      loading: () => _buildLoading(context),
      error: (_, __) => const SizedBox.shrink(),
      data: (earned) {
        if (earned.isEmpty) return const SizedBox.shrink();
        return _buildContent(context, earned);
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Achievements',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<Achievement> earned) {
    final recent = earned.take(3).toList();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events,
                    color: Color(0xFFFFD700), size: 20),
                const SizedBox(width: 8),
                Text(
                  'Recent Achievements',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _openGallery(context),
                  child: Text(
                    'View All (${earned.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: recent
                  .map(
                    (a) => Expanded(
                      child: AchievementBadgeCard(
                        achievement: a,
                        compact: true,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BadgeGalleryScreen()),
    );
  }
}
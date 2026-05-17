import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/achievement_provider.dart';

/// Shows the locked achievement closest to being unlocked — a motivational
/// "almost there" teaser card for the dashboard.
class NextAchievementCard extends ConsumerWidget {
  const NextAchievementCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);
    return achievementsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (achievements) {
        final candidates = achievements
            .where((a) => !a.isUnlocked && a.progressValue > 0)
            .toList()
          ..sort((a, b) => b.progressPercent.compareTo(a.progressPercent));

        if (candidates.isEmpty) return const SizedBox.shrink();
        final next = candidates.first;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Text(next.iconEmoji,
                style: const TextStyle(fontSize: 32)),
            title: Text('Almost there: ${next.name}'),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: next.progressPercent,
                  minHeight: 6,
                ),
              ),
            ),
            trailing: Text(
              '${(next.progressPercent * 100).toInt()}%',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}
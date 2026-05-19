import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../achievements/presentation/providers/achievement_provider.dart';
import '../../../achievements/presentation/widgets/achievement_badge_card.dart';
import '../../../achievements/presentation/screens/badge_gallery_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AchievementTeaserCard extends ConsumerWidget {
  const AchievementTeaserCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final earnedAsync = ref.watch(earnedAchievementsProvider);

    return earnedAsync.when(
      loading: () => const _LoadingTeaser(),
      error: (_, __) => const SizedBox.shrink(),
      data: (earned) {
        if (earned.isEmpty) return const SizedBox.shrink();
        return _TeaserContent(context: context, earned: earned);
      },
    );
  }
}

class _LoadingTeaser extends StatelessWidget {
  const _LoadingTeaser();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _TeaserContent extends StatelessWidget {
  final BuildContext context;
  final List<dynamic> earned;

  const _TeaserContent({required this.context, required this.earned});

  @override
  Widget build(BuildContext context) {
    final recent = earned.take(3).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.emoji_events, color: Color(0xFFFFD700), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Recent Achievements',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _openGallery(context),
                child: Text(
                  '${earned.length} total',
                  style: TextStyle(
                    color: DashboardTheme.primary(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
    );
  }

  void _openGallery(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BadgeGalleryScreen()),
    );
  }
}

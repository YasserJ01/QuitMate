import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../../achievements/presentation/providers/achievement_provider.dart';

class NextAchievementTeaser extends ConsumerWidget {
  const NextAchievementTeaser({super.key});

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
                  Text(next.iconEmoji, style: const TextStyle(fontSize: 36)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Almost there',
                          style: TextStyle(
                            fontSize: 12,
                            color: DashboardTheme.textSecondary(context),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          next.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: DashboardTheme.textPrimary(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${(next.progressPercent * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: DashboardTheme.primary(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: next.progressPercent,
                  minHeight: 8,
                  backgroundColor: DashboardTheme.primary(context).withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(DashboardTheme.primary(context)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

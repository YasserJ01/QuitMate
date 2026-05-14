import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/toolkit_exercise.dart';
import '../providers/toolkit_provider.dart';
import '../widgets/exercise_card.dart';
import '../widgets/exercise_chip.dart';
import 'exercise_detail_screen.dart';
import 'toolkit_history_screen.dart';

/// Main hub for the craving toolkit — domain-layer-driven catalogue with
/// favorites, recents, and mode-filtered exercise sections.
class CravingToolkitScreen extends ConsumerWidget {
  final int? cravingId;

  const CravingToolkitScreen({
    super.key,
    this.cravingId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeAsync = ref.watch(currentModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Craving Toolkit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'View History',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToolkitHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: modeAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            const Center(child: Text('Unable to load toolkit')),
        data: (mode) {
          final effectiveMode = mode ?? 'quitSmoking';
          return _ToolkitContent(mode: effectiveMode);
        },
      ),
    );
  }
}

class _ToolkitContent extends ConsumerWidget {
  final String mode;
  const _ToolkitContent({required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeader(context),
        const SizedBox(height: 24),
        _buildEmergencyTip(context),
        const SizedBox(height: 24),
        // Favorites section
        _buildFavoritesSection(context, mode, ref),
        // Recents section
        _buildRecentsSection(context, mode, ref),
        // All exercises
        Text(
          'All Exercises',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _buildAllExercisesSection(context, mode, ref),
      ],
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
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
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You\'ve Got This!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cravings pass. Let\'s work through this together.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Emergency tip ───────────────────────────────────────────────────────

  Widget _buildEmergencyTip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.warningColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb, color: AppTheme.warningColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Tip',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Most cravings peak and pass within 3-5 minutes. You can ride this wave!',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Favorites section ───────────────────────────────────────────────────

  Widget _buildFavoritesSection(
    BuildContext context,
    String mode,
    WidgetRef ref,
  ) {
    final favoritesAsync = ref.watch(favoriteExercisesProvider(mode));

    return favoritesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (favorites) {
        if (favorites.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Your Favorites',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 72,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: favorites.length,
                itemBuilder: (context, i) => ExerciseChip(
                  exercise: favorites[i],
                  onTap: () =>
                      _navigateToDetail(context, favorites[i], mode, ref),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  // ── Recents section ─────────────────────────────────────────────────────

  Widget _buildRecentsSection(
    BuildContext context,
    String mode,
    WidgetRef ref,
  ) {
    final recentsAsync = ref.watch(recentExercisesProvider);

    return recentsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (recents) {
        if (recents.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Recently Used',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            ...recents.map((exercise) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: ExerciseCard(
                    exercise: exercise,
                    onTap: () =>
                        _navigateToDetail(context, exercise, mode, ref),
                    onFavoriteToggle: () => ref
                        .read(toolkitSessionProvider.notifier)
                        .toggleFavorite(exercise.id),
                    showRepeatButton: true,
                    onRepeat: () =>
                        _navigateToExercise(context, exercise, mode),
                  ),
                )),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  // ── All exercises section ───────────────────────────────────────────────

  Widget _buildAllExercisesSection(
    BuildContext context,
    String mode,
    WidgetRef ref,
  ) {
    final exercisesAsync = ref.watch(toolkitExercisesProvider(mode));

    return exercisesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error loading exercises: $e')),
      data: (exercises) {
        if (exercises.isEmpty) {
          return const Center(child: Text('No exercises available'));
        }

        return Column(
          children: exercises.map((exercise) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ExerciseCard(
                exercise: exercise,
                onTap: () =>
                    _navigateToDetail(context, exercise, mode, ref),
                onFavoriteToggle: () => ref
                    .read(toolkitSessionProvider.notifier)
                    .toggleFavorite(exercise.id),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  // ── Navigation helpers ──────────────────────────────────────────────────

  void _navigateToDetail(
    BuildContext context,
    ToolkitExercise exercise,
    String mode,
    WidgetRef ref,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExerciseDetailScreen(
          exercise: exercise,
          mode: mode,
        ),
      ),
    );
  }

  void _navigateToExercise(
    BuildContext context,
    ToolkitExercise exercise,
    String mode,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExerciseScreenRouter(
          exercise: exercise,
          mode: mode,
        ),
      ),
    );
  }
}
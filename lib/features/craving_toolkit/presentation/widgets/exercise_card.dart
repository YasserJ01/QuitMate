import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/toolkit_exercise.dart';

/// A card displayed in the CravingToolkitScreen exercise catalogue.
///
/// Shows category icon, name, short description, duration chip,
/// mode badge (if mode-exclusive), and a favorite toggle.
class ExerciseCard extends StatelessWidget {
  final ToolkitExercise exercise;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;
  final bool showRepeatButton;
  final VoidCallback? onRepeat;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.onTap,
    required this.onFavoriteToggle,
    this.showRepeatButton = false,
    this.onRepeat,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Category icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        exercise.category.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exercise.shortDescription,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // Duration chip
                        Row(
                          children: [
                            _DurationChip(
                                duration: exercise.durationLabel),
                            if (!exercise.isSharedBothModes &&
                                exercise.modeFilter != null) ...[
                              const SizedBox(width: 8),
                              _ModeBadge(mode: exercise.modeFilter!),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Favorite toggle
                  Semantics(
                    label: 'Toggle favorite for ${exercise.name}',
                    button: true,
                    child: IconButton(
                      icon: Icon(
                        exercise.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: exercise.isFavorite
                            ? AppTheme.errorColor
                            : AppTheme.textDisabled,
                      ),
                      onPressed: onFavoriteToggle,
                      tooltip: exercise.isFavorite
                          ? 'Remove from favorites'
                          : 'Add to favorites',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Repeat button overlay at bottom-right
        if (showRepeatButton && onRepeat != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: Semantics(
              label: 'Repeat ${exercise.name}',
              button: true,
              child: TextButton.icon(
                onPressed: onRepeat,
                icon: const Icon(Icons.replay, size: 16),
                label:
                    const Text('Repeat', style: TextStyle(fontSize: 13)),
              ),
            ),
          ),
      ],
    );
  }
}

class _DurationChip extends StatelessWidget {
  final String duration;
  const _DurationChip({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        duration,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}

class _ModeBadge extends StatelessWidget {
  final String mode;
  const _ModeBadge({required this.mode});

  @override
  Widget build(BuildContext context) {
    final label =
        mode.toLowerCase() == 'quitsmoking' ? 'Smoking' : 'Reduction';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppTheme.warningColor,
        ),
      ),
    );
  }
}
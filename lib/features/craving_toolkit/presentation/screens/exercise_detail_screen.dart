import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../../domain/entities/toolkit_exercise.dart';
import '../providers/toolkit_provider.dart';
import 'breathing_exercise_screen.dart';
import 'grounding_exercise_screen.dart';
import 'urge_surfing_screen.dart';
import 'delay_distract_screen.dart';
import 'cognitive_reframing_screen.dart';
import 'journal_entry_screen.dart';
import 'relapse_recovery_plan_screen.dart';

/// Detail/overview screen shown between tapping an ExerciseCard and
/// launching the actual exercise. Displays category icon, duration,
/// description, mode-specific note, and a Start button.
class ExerciseDetailScreen extends ConsumerWidget {
  final ToolkitExercise exercise;
  final String mode;

  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
    required this.mode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        actions: [
          Semantics(
            label: 'Toggle favorite for ${exercise.name}',
            button: true,
            child: IconButton(
              icon: Icon(
                exercise.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: exercise.isFavorite
                    ? AppTheme.errorColor
                    : AppTheme.textDisabled,
              ),
              onPressed: () => ref
                  .read(toolkitSessionProvider.notifier)
                  .toggleFavorite(exercise.id),
              tooltip: exercise.isFavorite
                  ? 'Remove from favorites'
                  : 'Add to favorites',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                exercise.category.emoji,
                style: const TextStyle(fontSize: 80),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: _DurationChip(duration: exercise.durationLabel),
            ),
            const SizedBox(height: 24),
            Text(
              exercise.shortDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (exercise.modeSpecificNote != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  exercise.modeSpecificNote!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _navigateToExercise(context, exercise, mode),
              child: const Text('Start', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToExercise(
    BuildContext context,
    ToolkitExercise exercise,
    String mode,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ExerciseScreenRouter(exercise: exercise, mode: mode),
      ),
    );
  }
}

/// Routes a [ToolkitExercise] to its implementation screen.
///
/// Called both from [ExerciseDetailScreen] and from the "Repeat" button
/// on recent exercise cards (which skips the detail screen).
class ExerciseScreenRouter extends StatelessWidget {
  final ToolkitExercise exercise;
  final String mode;

  const ExerciseScreenRouter({
    super.key,
    required this.exercise,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return _exerciseScreenFor(exercise, mode);
  }

  static Widget _exerciseScreenFor(ToolkitExercise exercise, String mode) {
    switch (exercise.category) {
      case ExerciseCategory.breathing:
        return _BreathingScreenShell(
            pattern: _breathingPatternFrom(exercise.id));
      case ExerciseCategory.grounding:
        return _GroundingScreenShell(
            exercise: _groundingExerciseFrom(exercise.id));
      case ExerciseCategory.urgeSurfing:
        return _UrgeSurfingShell(mode: mode);
      case ExerciseCategory.delayAndDistract:
        return _DelayDistractShell(mode: mode);
      case ExerciseCategory.cognitiveReframing:
        return _CognitiveReframingShell(mode: mode);
      case ExerciseCategory.journaling:
        return _JournalingShell(
          sourceExerciseId: exercise.id,
          sourceExerciseName: exercise.name,
        );
      case ExerciseCategory.relapseRecoveryPlanning:
        return _RelapseRecoveryShell(mode: mode);
    }
  }

  static BreathingPattern _breathingPatternFrom(String exerciseId) {
    return switch (exerciseId) {
      'breathing-box' => BreathingPattern.box,
      'breathing-relaxing' => BreathingPattern.relaxing,
      'breathing-energizing' => BreathingPattern.energizing,
      'breathing-calm' => BreathingPattern.calm,
      _ => BreathingPattern.box,
    };
  }

  static GroundingExercise _groundingExerciseFrom(String exerciseId) {
    return switch (exerciseId) {
      'grounding-fivesenses' => GroundingExercise.fiveSenses,
      'grounding-bodyscan' => GroundingExercise.bodyAwareness,
      'grounding-objectfocus' => GroundingExercise.objectFocus,
      'grounding-coldwater' => GroundingExercise.coldWater,
      'grounding-counting' => GroundingExercise.counting,
      _ => GroundingExercise.fiveSenses,
    };
  }
}

// ── Shell widgets that instantiate the real screens ────────────────────────

class _BreathingScreenShell extends StatelessWidget {
  final BreathingPattern pattern;
  const _BreathingScreenShell({required this.pattern});

  @override
  Widget build(BuildContext context) => BreathingExerciseScreen(pattern: pattern);
}

class _GroundingScreenShell extends StatelessWidget {
  final GroundingExercise exercise;
  const _GroundingScreenShell({required this.exercise});

  @override
  Widget build(BuildContext context) =>
      GroundingExerciseScreen(exercise: exercise);
}

class _UrgeSurfingShell extends StatelessWidget {
  final String mode;
  const _UrgeSurfingShell({required this.mode});

  @override
  Widget build(BuildContext context) => UrgeSurfingScreen(mode: mode);
}

class _DelayDistractShell extends StatelessWidget {
  final String mode;
  const _DelayDistractShell({required this.mode});

  @override
  Widget build(BuildContext context) => DelayDistractScreen(mode: mode);
}

class _CognitiveReframingShell extends StatelessWidget {
  final String mode;
  const _CognitiveReframingShell({required this.mode});

  @override
  Widget build(BuildContext context) => CognitiveReframingScreen(mode: mode);
}

class _JournalingShell extends StatelessWidget {
  final String? sourceExerciseId;
  final String? sourceExerciseName;
  const _JournalingShell({this.sourceExerciseId, this.sourceExerciseName});

  @override
  Widget build(BuildContext context) => JournalEntryScreen(
        sourceExerciseId: sourceExerciseId,
        sourceExerciseName: sourceExerciseName,
      );
}

class _RelapseRecoveryShell extends StatelessWidget {
  final String mode;
  const _RelapseRecoveryShell({required this.mode});

  @override
  Widget build(BuildContext context) => RelapseRecoveryPlanScreen(mode: mode);
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
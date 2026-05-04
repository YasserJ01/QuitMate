import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../providers/toolkit_provider.dart';
import '../widgets/five_senses_exercise.dart';
import '../widgets/body_scan_exercise.dart';
import '../widgets/object_focus_exercise.dart';
import '../widgets/counting_exercise.dart';
import '../widgets/cold_water_exercise.dart';
import '../widgets/effectiveness_rating_dialog.dart';

class GroundingExerciseScreen extends ConsumerStatefulWidget {
  final GroundingExercise exercise;
  final int? cravingId;

  const GroundingExerciseScreen({
    Key? key,
    required this.exercise,
    this.cravingId,
  }) : super(key: key);

  @override
  ConsumerState<GroundingExerciseScreen> createState() =>
      _GroundingExerciseScreenState();
}

class _GroundingExerciseScreenState
    extends ConsumerState<GroundingExerciseScreen> {
  bool _hasStarted = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(groundingSessionProvider(widget.exercise));

    return WillPopScope(
      onWillPop: () async {
        if (_hasStarted && !state.isCompleted) {
          final shouldExit = await _showExitConfirmation();
          return shouldExit ?? false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.exercise.displayName),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              if (_hasStarted && !state.isCompleted) {
                final shouldExit = await _showExitConfirmation();
                if (shouldExit == true && mounted) {
                  Navigator.pop(context);
                }
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: state.isCompleted
            ? _buildCompletionScreen(state)
            : !_hasStarted
            ? _buildIntroScreen()
            : _buildExerciseContent(state),
      ),
    );
  }

  Widget _buildIntroScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          // Exercise emoji
          Text(
            widget.exercise.emoji,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 24),

          // Exercise name
          Text(
            widget.exercise.displayName,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            widget.exercise.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Info card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer, color: AppTheme.warningColor),
                    const SizedBox(width: 12),
                    Text(
                      'Estimated Time: ${widget.exercise.estimatedMinutes} ${widget.exercise.estimatedMinutes == 1 ? "minute" : "minutes"}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Icon(Icons.self_improvement, color: AppTheme.warningColor),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Grounding brings you to the present moment',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Purpose card
          _buildPurposeCard(),

          const Spacer(),

          // Start button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await ref
                    .read(groundingSessionProvider(widget.exercise).notifier)
                    .start();
                setState(() {
                  _hasStarted = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                'Begin Exercise',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPurposeCard() {
    String purpose;
    List<String> benefits;

    switch (widget.exercise) {
      case GroundingExercise.fiveSenses:
        purpose = 'Use your senses to anchor yourself in the present';
        benefits = [
          'Interrupts anxious thoughts',
          'Reduces dissociation',
          'Quick and effective',
        ];
        break;
      case GroundingExercise.bodyAwareness:
        purpose = 'Scan your body to release tension and increase awareness';
        benefits = [
          'Releases physical tension',
          'Increases body awareness',
          'Promotes relaxation',
        ];
        break;
      case GroundingExercise.objectFocus:
        purpose = 'Focus intensely on one object to calm your mind';
        benefits = [
          'Improves concentration',
          'Breaks rumination',
          'Simple and discreet',
        ];
        break;
      case GroundingExercise.counting:
        purpose = 'Use mental math to redirect your focus';
        benefits = [
          'Engages your brain',
          'Distracts from cravings',
          'Can do anywhere',
        ];
        break;
      case GroundingExercise.coldWater:
        purpose = 'Use cold water to activate your parasympathetic nervous system';
        benefits = [
          'Instant physiological reset',
          'Interrupts panic response',
          'Evidence-based technique',
        ];
        break;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purpose:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(purpose),
            const SizedBox(height: 16),
            Text(
              'Benefits:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...benefits.map((benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 16,
                    color: AppTheme.successColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(benefit)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseContent(GroundingSessionState state) {
    switch (widget.exercise) {
      case GroundingExercise.fiveSenses:
        return FiveSensesExercise(
          onComplete: (responses) => _completeExercise(responses),
        );
      case GroundingExercise.bodyAwareness:
        return BodyScanExercise(
          onComplete: (responses) => _completeExercise(responses),
        );
      case GroundingExercise.objectFocus:
        return ObjectFocusExercise(
          onComplete: (responses) => _completeExercise(responses),
        );
      case GroundingExercise.counting:
        return CountingExercise(
          onComplete: (responses) => _completeExercise(responses),
        );
      case GroundingExercise.coldWater:
        return ColdWaterExercise(
          onComplete: (responses) => _completeExercise(responses),
        );
    }
  }

  Widget _buildCompletionScreen(GroundingSessionState state) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // Success icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 60,
              color: AppTheme.warningColor,
            ),
          ),
          const SizedBox(height: 32),

          // Completion message
          Text(
            'Exercise Complete!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),

          Text(
            'You completed the ${widget.exercise.displayName} exercise.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Motivational message
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.psychology,
                  color: AppTheme.primaryColor,
                  size: 32,
                ),
                const SizedBox(height: 12),
                Text(
                  _getMotivationalMessage(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const Spacer(),

          // Action buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showEffectivenessRating(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                'Rate Effectiveness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                'Return to Toolkit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String _getMotivationalMessage() {
    switch (widget.exercise) {
      case GroundingExercise.fiveSenses:
        return 'Great job anchoring yourself! Your senses are powerful tools for staying present.';
      case GroundingExercise.bodyAwareness:
        return 'Excellent body awareness! You\'re building a stronger mind-body connection.';
      case GroundingExercise.objectFocus:
        return 'Perfect focus! You proved you can redirect your attention when needed.';
      case GroundingExercise.counting:
        return 'Well done! Your mind is more powerful than any craving.';
      case GroundingExercise.coldWater:
        return 'Awesome! You activated your body\'s natural calming response.';
    }
  }

  Future<void> _completeExercise(Map<String, dynamic> responses) async {
    // Save responses based on exercise type
    if (widget.exercise == GroundingExercise.fiveSenses) {
      await ref
          .read(groundingSessionProvider(widget.exercise).notifier)
          .saveFiveSensesResponses(
        see: responses['see'],
        touch: responses['touch'],
        hear: responses['hear'],
        smell: responses['smell'],
        taste: responses['taste'],
      );
    }
  }

  void _showEffectivenessRating() async {
    final rating = await showDialog<int>(
      context: context,
      builder: (context) => const EffectivenessRatingDialog(),
    );

    if (rating != null) {
      await ref
          .read(groundingSessionProvider(widget.exercise).notifier)
          .complete(rating);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Great job staying grounded!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    }
  }

  Future<bool?> _showExitConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Exercise?'),
        content: const Text(
          'Your progress won\'t be saved if you exit now. Are you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Continue Exercise'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
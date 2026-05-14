import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../providers/toolkit_provider.dart';
import '../widgets/cbt_effectiveness_dialog.dart';
import '../widgets/cbt_technique_content.dart';

class CbtTechniqueScreen extends ConsumerStatefulWidget {
  final CbtTechnique technique;
  final int? cravingId;

  const CbtTechniqueScreen({
    super.key,
    required this.technique,
    this.cravingId,
  });

  @override
  ConsumerState<CbtTechniqueScreen> createState() => _CbtTechniqueScreenState();
}

class _CbtTechniqueScreenState extends ConsumerState<CbtTechniqueScreen> {
  final PageController _pageController = PageController();
  bool _hasStarted = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cbtSessionProvider(widget.technique));
    ref.listen<CbtSessionState>(
      cbtSessionProvider(widget.technique),
      (previous, next) {
        final wasEnded = previous?.session?.endTime != null;
        final isEnded = next.session?.endTime != null;
        if (!wasEnded && isEnded) {
          ref.invalidate(toolkitStatisticsProvider);
        }
      },
    );

    return PopScope(
      canPop: !(_hasStarted && !state.isCompleted),
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await _showExitConfirmation();
        if (shouldExit == true && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.technique.displayName),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              if (_hasStarted && !state.isCompleted) {
                final shouldExit = await _showExitConfirmation();
                if (shouldExit == true && context.mounted) {
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
            : _buildTechniqueContent(state),
      ),
    );
  }

  // FIX: Replaced Spacer() with SizedBox inside SingleChildScrollView to prevent overflow
  Widget _buildIntroScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),

          // Technique emoji
          Text(
            widget.technique.emoji,
            style: const TextStyle(fontSize: 80),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Technique name
          Text(
            widget.technique.displayName,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            widget.technique.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Info card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer, color: AppTheme.successColor),
                    const SizedBox(width: 12),
                    Text(
                      'Estimated Time: ${widget.technique.estimatedMinutes} minutes',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.psychology, color: AppTheme.successColor),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Evidence-based cognitive behavioral therapy',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // What to expect
          _buildExpectationCard(),
          const SizedBox(height: 40),

          // Start button
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(cbtSessionProvider(widget.technique).notifier)
                  .start();
              setState(() {
                _hasStarted = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.successColor,
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              'Begin Exercise',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildExpectationCard() {
    final steps = _getTechniqueSteps();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What to Expect:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...steps.asMap().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppTheme.successColor.withValues(alpha:0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${entry.key + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.successColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<String> _getTechniqueSteps() {
    switch (widget.technique) {
      case CbtTechnique.urgeSurfing:
        return [
          'Recognize the craving wave',
          'Observe without judgment',
          'Ride the wave until it passes',
          'Reflect on the experience',
        ];
      case CbtTechnique.thoughtChallenge:
        return [
          'Identify the automatic thought',
          'Question its validity',
          'Find evidence for/against',
          'Create a balanced thought',
        ];
      case CbtTechnique.consequenceAnalysis:
        return [
          'Imagine giving in to the craving',
          'List short-term consequences',
          'List long-term consequences',
          'Compare with resisting',
        ];
      case CbtTechnique.delayTactic:
        return [
          'Commit to waiting 5 minutes',
          'Distract yourself',
          'Re-evaluate after delay',
          'Celebrate if craving passed',
        ];
      case CbtTechnique.alternativeBehavior:
        return [
          'Identify the trigger',
          'Choose a healthy alternative',
          'Execute the alternative',
          'Reflect on effectiveness',
        ];
    }
  }

  Widget _buildTechniqueContent(CbtSessionState state) {
    return CbtTechniqueContent(
      technique: widget.technique,
      currentStep: state.currentStep,
      pageController: _pageController,
      onNext: () {
        ref.read(cbtSessionProvider(widget.technique).notifier).nextStep();
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      onPrevious: () {
        ref.read(cbtSessionProvider(widget.technique).notifier).previousStep();
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      // FIX: _completeExercise now correctly saves responses AND triggers
      // the effectiveness rating dialog which calls notifier.complete().
      onComplete: (responses) => _completeExercise(responses),
    );
  }

  // FIX: Replaced Spacer() with SizedBox inside SingleChildScrollView to prevent overflow
  Widget _buildCompletionScreen(CbtSessionState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),

          // Success icon
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.successColor.withValues(alpha:0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                size: 60,
                color: AppTheme.successColor,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Completion message
          Text(
            'Exercise Complete!',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          Text(
            'You\'ve completed the ${widget.technique.displayName} exercise.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Motivational message
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.lightbulb,
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
          const SizedBox(height: 48),

          // Action buttons
          ElevatedButton(
            onPressed: () => _showEffectivenessRating(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.successColor,
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              'Rate Effectiveness',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              'Return to Toolkit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  String _getMotivationalMessage() {
    switch (widget.technique) {
      case CbtTechnique.urgeSurfing:
        return 'You rode the wave! Remember, cravings peak and pass like ocean waves.';
      case CbtTechnique.thoughtChallenge:
        return 'Great job challenging those automatic thoughts! You have more control than you think.';
      case CbtTechnique.consequenceAnalysis:
        return 'Playing the tape forward helps you see the bigger picture. Keep using this skill!';
      case CbtTechnique.delayTactic:
        return 'You proved that waiting works! Most cravings pass in just a few minutes.';
      case CbtTechnique.alternativeBehavior:
        return 'Finding healthy alternatives is a powerful strategy. Keep building your toolkit!';
    }
  }

  // FIX: Previously only called updateThoughts() but never called complete(),
  // so isCompleted stayed false and the completion screen was never shown.
  // Now correctly: saves thought data first, then immediately shows the
  // effectiveness rating dialog, then calls notifier.complete() to transition state.
  Future<void> _completeExercise(Map<String, dynamic> responses) async {
    // Save any text responses collected during the exercise
    await ref
        .read(cbtSessionProvider(widget.technique).notifier)
        .updateThoughts(
      thoughtsBefore: responses['thoughtsBefore'],
      thoughtsAfter: responses['thoughtsAfter'],
      consequences: responses['consequences'],
      alternativeChosen: responses['alternativeChosen'],
    );

    if (!mounted) return;

    // FIX: Show rating dialog then complete the session
    _showEffectivenessRating();
  }

  void _showEffectivenessRating() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CbtEffectivenessDialog(),
    );

    if (!mounted) return;

    // Use defaults if user tapped Skip
    final wasHelpful = result != null ? result['wasHelpful'] as bool : true;
    final rating = result != null ? result['rating'] as int : 3;

    await ref
        .read(cbtSessionProvider(widget.technique).notifier)
        .complete(wasHelpful, rating);

    // Completion screen renders automatically via state.isCompleted
    // No Navigator.pop here — user taps "Return to Toolkit" to leave
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

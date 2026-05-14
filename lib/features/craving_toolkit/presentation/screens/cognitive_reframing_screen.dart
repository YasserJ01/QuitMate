import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/toolkit_provider.dart';
import '../providers/journal_provider.dart';
import '../widgets/post_exercise_feedback_sheet.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// Guided cognitive reframing worksheet with multiple steps.
class CognitiveReframingScreen extends ConsumerStatefulWidget {
  final String mode;

  const CognitiveReframingScreen({super.key, required this.mode});

  @override
  ConsumerState<CognitiveReframingScreen> createState() =>
      _CognitiveReframingScreenState();
}

class _CognitiveReframingScreenState
    extends ConsumerState<CognitiveReframingScreen> {
  final _pageController = PageController();
  int _currentStep = 0;
  final _thoughtController = TextEditingController();
  final _evidenceForController = TextEditingController();
  final _evidenceAgainstController = TextEditingController();
  final _balancedController = TextEditingController();

  static const _totalSteps = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
      if (userId.isNotEmpty) {
        ref.read(toolkitSessionProvider.notifier).startSessionById(
              exerciseId: 'cognitive-thoughtchallenge',
              exerciseName: 'Cognitive Reframing',
              exerciseCategory: 'cognitiveReframing',
              userId: userId,
              mode: widget.mode,
            );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _thoughtController.dispose();
    _evidenceForController.dispose();
    _evidenceAgainstController.dispose();
    _balancedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentStep == 0,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final confirm = await _showExitConfirmation();
        if (confirm == true && mounted) {
          ref
              .read(toolkitSessionProvider.notifier)
              .endSession(completed: false);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Cognitive Reframing')),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentStep + 1) / _totalSteps,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
              minHeight: 4,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStep0(),
                  _buildStep1(),
                  _buildStep2(),
                  _buildStep3(),
                  _buildStep4(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep0() {
    return _StepWrapper(
      title: 'Cognitive Reframing',
      emoji: '🧠',
      body:
          'Our thoughts shape how we feel and act. When a craving hits, '
          'automatic thoughts can make it feel overwhelming. This exercise '
          'helps you pause, examine those thoughts, and find a more balanced '
          'perspective.',
      buttonLabel: 'Begin',
      onNext: _next,
    );
  }

  Widget _buildStep1() {
    return _StepWrapper(
      title: 'Step 1: Identify the Thought',
      emoji: '💭',
      body: 'What thought or feeling are you experiencing right now? '
          'Write it down exactly as it appears in your mind.',
      child: TextField(
        controller: _thoughtController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: 'e.g., "I need this right now" or "I cannot resist"',
        ),
      ),
      buttonLabel: 'Next',
      onNext: _next,
    );
  }

  Widget _buildStep2() {
    return _StepWrapper(
      title: 'Step 2: Evidence For',
      emoji: '🔍',
      body: 'What evidence supports this thought? Be honest — '
          'write down anything that makes the thought seem true.',
      child: TextField(
        controller: _evidenceForController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: 'What facts support this thought?',
        ),
      ),
      buttonLabel: 'Next',
      onNext: _next,
    );
  }

  Widget _buildStep3() {
    return _StepWrapper(
      title: 'Step 3: Evidence Against',
      emoji: '⚖️',
      body: 'Now challenge the thought. What evidence goes against it? '
          'What would you tell a friend who had this thought?',
      child: TextField(
        controller: _evidenceAgainstController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: 'What facts contradict this thought?',
        ),
      ),
      buttonLabel: 'Next',
      onNext: _next,
    );
  }

  Widget _buildStep4() {
    return _StepWrapper(
      title: 'Step 4: Balanced Perspective',
      emoji: '✨',
      body: 'Looking at both sides, what is a more balanced way to see this? '
          'Write a new thought that is fair and compassionate.',
      child: TextField(
        controller: _balancedController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: 'A more balanced thought would be...',
        ),
      ),
      buttonLabel: 'Finish',
      onNext: () {
        ref
            .read(toolkitSessionProvider.notifier)
            .endSession(completed: true);
        _showFeedbackSheet();
      },
    );
  }

  void _next() {
    if (_currentStep < _totalSteps - 1) {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showFeedbackSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: PostExerciseFeedbackSheet(
          exerciseName: 'Cognitive Reframing',
          wasCompleted: true,
          onRatingSelected: (rating) {
            Navigator.pop(context);
            ref
                .read(toolkitSessionProvider.notifier)
                .recordFeedback(rating);
            // Offer journal save
            _offerJournalSave();
          },
        ),
      ),
    );
  }

  void _offerJournalSave() {
    final content = _balancedController.text.trim();
    if (content.isEmpty) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Save to Journal?'),
        content: const Text(
          'Would you like to save your balanced perspective to your journal?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('No thanks'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(journalNotifierProvider.notifier).createEntry(
                    content: 'Balanced Perspective:\n$content',
                    sourceExerciseId: 'cognitive-thoughtchallenge',
                    sourceExerciseName: 'Cognitive Reframing',
                  );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved to journal!'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
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

class _StepWrapper extends StatelessWidget {
  final String title;
  final String emoji;
  final String body;
  final String buttonLabel;
  final VoidCallback onNext;
  final Widget? child;

  const _StepWrapper({
    required this.title,
    required this.emoji,
    required this.body,
    required this.buttonLabel,
    required this.onNext,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Text(emoji,
              style: const TextStyle(fontSize: 48),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(body, style: Theme.of(context).textTheme.bodyLarge),
          if (child != null) ...[
            const SizedBox(height: 24),
            child!,
          ],
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onNext,
            child: Text(buttonLabel, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
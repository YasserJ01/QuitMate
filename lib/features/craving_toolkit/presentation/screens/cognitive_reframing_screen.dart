import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Guided cognitive reframing worksheet with multiple steps.
class CognitiveReframingScreen extends StatefulWidget {
  final String mode;

  const CognitiveReframingScreen({super.key, required this.mode});

  @override
  State<CognitiveReframingScreen> createState() =>
      _CognitiveReframingScreenState();
}

class _CognitiveReframingScreenState extends State<CognitiveReframingScreen> {
  final _pageController = PageController();
  int _currentStep = 0;
  final _thoughtController = TextEditingController();
  final _evidenceForController = TextEditingController();
  final _evidenceAgainstController = TextEditingController();
  final _balancedController = TextEditingController();

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

  static const _totalSteps = 5;

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
    return Scaffold(
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
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Great job reframing your thoughts!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
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
          Text(emoji, style: const TextStyle(fontSize: 48), textAlign: TextAlign.center),
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
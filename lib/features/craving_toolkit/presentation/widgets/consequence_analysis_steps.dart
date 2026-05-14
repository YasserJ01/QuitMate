import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Consequence analysis — "Play the Tape Forward" technique.
///
/// Guides the user through imagining the short-term and long-term
/// consequences of giving in vs. resisting the craving.
class ConsequenceAnalysisSteps extends StatefulWidget {
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const ConsequenceAnalysisSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  });

  @override
  State<ConsequenceAnalysisSteps> createState() =>
      _ConsequenceAnalysisStepsState();
}

class _ConsequenceAnalysisStepsState extends State<ConsequenceAnalysisSteps> {
  final _giveInShortController = TextEditingController();
  final _giveInLongController = TextEditingController();
  final _resistShortController = TextEditingController();
  final _resistLongController = TextEditingController();

  @override
  void dispose() {
    _giveInShortController.dispose();
    _giveInLongController.dispose();
    _resistShortController.dispose();
    _resistLongController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStep1(),
        _buildStep2(),
        _buildStep3(),
        _buildStep4(),
      ],
    );
  }

  Widget _buildStep1() {
    return _buildStepContainer(
      stepNumber: 1,
      totalSteps: 4,
      title: 'If You Give In — Short Term',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Imagine giving in to the craving right now. '
            'What happens in the next 5 minutes? The next hour?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _giveInShortController,
            decoration: const InputDecoration(
              labelText: 'Short-term consequences',
              hintText: 'How will you feel immediately after?',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
        ],
      ),
      onNext: widget.onNext,
      showPrevious: false,
    );
  }

  Widget _buildStep2() {
    return _buildStepContainer(
      stepNumber: 2,
      totalSteps: 4,
      title: 'If You Give In — Long Term',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Now think further ahead. What happens tomorrow? '
            'Next week? How will this affect your progress?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _giveInLongController,
            decoration: const InputDecoration(
              labelText: 'Long-term consequences',
              hintText: 'How will this affect your goals?',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
        ],
      ),
      onNext: widget.onNext,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep3() {
    return _buildStepContainer(
      stepNumber: 3,
      totalSteps: 4,
      title: 'If You Resist — Short Term',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Now imagine resisting. What happens in the next '
            '5 minutes? The next hour? The craving will peak and pass.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _resistShortController,
            decoration: const InputDecoration(
              labelText: 'Short-term benefits of resisting',
              hintText: 'How will you feel after the craving passes?',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
        ],
      ),
      onNext: widget.onNext,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep4() {
    return _buildStepContainer(
      stepNumber: 4,
      totalSteps: 4,
      title: 'Compare the Two Paths',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Looking at both paths, which one leads where you '
            'want to go? Write your conclusion.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          // Comparison cards
          _buildComparisonCard(
            'Giving In',
            '${_giveInShortController.text}\n\n${_giveInLongController.text}',
            AppTheme.errorColor,
          ),
          const SizedBox(height: 12),
          _buildComparisonCard(
            'Resisting',
            '${_resistShortController.text}\n\n${_resistLongController.text}',
            AppTheme.successColor,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _resistLongController,
            decoration: const InputDecoration(
              labelText: 'Your Conclusion',
              hintText: 'Which path will you choose?',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      onNext: () {
        widget.onComplete({
          'thoughtsBefore': _giveInShortController.text,
          'thoughtsAfter': _resistLongController.text,
          'consequences':
              'Give in: ${_giveInShortController.text} | Resist: ${_resistShortController.text}',
        });
      },
      onPrevious: widget.onPrevious,
      nextButtonText: 'Complete',
    );
  }

  Widget _buildComparisonCard(String label, String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text.isEmpty ? 'Write your thoughts above...' : text,
            style: TextStyle(
              fontSize: 13,
              color: text.isEmpty ? AppTheme.textSecondary : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContainer({
    required int stepNumber,
    required int totalSteps,
    required String title,
    required Widget content,
    VoidCallback? onNext,
    VoidCallback? onPrevious,
    bool showPrevious = true,
    String nextButtonText = 'Next',
  }) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: stepNumber / totalSteps,
          backgroundColor: Colors.grey.shade300,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppTheme.successColor),
          minHeight: 4,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step $stepNumber of $totalSteps',
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),
                content,
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                if (showPrevious)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onPrevious,
                      child: const Text('Back'),
                    ),
                  ),
                if (showPrevious) const SizedBox(width: 16),
                Expanded(
                  flex: showPrevious ? 1 : 2,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.successColor,
                    ),
                    child: Text(nextButtonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
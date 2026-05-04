import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ThoughtChallengeSteps extends StatefulWidget {
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const ThoughtChallengeSteps({
    Key? key,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<ThoughtChallengeSteps> createState() => _ThoughtChallengeStepsState();
}

class _ThoughtChallengeStepsState extends State<ThoughtChallengeSteps> {
  final TextEditingController _automaticThoughtController = TextEditingController();
  final TextEditingController _evidenceForController = TextEditingController();
  final TextEditingController _evidenceAgainstController = TextEditingController();
  final TextEditingController _balancedThoughtController = TextEditingController();

  @override
  void dispose() {
    _automaticThoughtController.dispose();
    _evidenceForController.dispose();
    _evidenceAgainstController.dispose();
    _balancedThoughtController.dispose();
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
      title: 'Identify the Thought',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What automatic thought comes up when you have this craving?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildExampleThoughts(),
          const SizedBox(height: 24),
          TextField(
            controller: _automaticThoughtController,
            decoration: const InputDecoration(
              labelText: 'Your Automatic Thought',
              hintText: 'E.g., "I need this right now"',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      onNext: _automaticThoughtController.text.isNotEmpty ? widget.onNext : null,
      showPrevious: false,
    );
  }

  Widget _buildStep2() {
    return _buildStepContainer(
      stepNumber: 2,
      totalSteps: 4,
      title: 'Evidence For',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.errorColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.errorColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.format_quote, color: AppTheme.errorColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _automaticThoughtController.text,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'What evidence supports this thought?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Be honest - what makes this thought feel true?',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _evidenceForController,
            decoration: const InputDecoration(
              labelText: 'Evidence Supporting This Thought',
              hintText: 'List facts, not feelings',
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
      title: 'Evidence Against',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.errorColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.errorColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.format_quote, color: AppTheme.errorColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _automaticThoughtController.text,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'What evidence challenges this thought?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildChallengePrompts(),
          const SizedBox(height: 16),
          TextField(
            controller: _evidenceAgainstController,
            decoration: const InputDecoration(
              labelText: 'Evidence Against This Thought',
              hintText: 'What contradicts this thought?',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
        ],
      ),
      onNext: _evidenceAgainstController.text.isNotEmpty ? widget.onNext : null,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep4() {
    return _buildStepContainer(
      stepNumber: 4,
      totalSteps: 4,
      title: 'Balanced Thought',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create a more balanced, realistic thought:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildComparisonCard(),
          const SizedBox(height: 24),
          TextField(
            controller: _balancedThoughtController,
            decoration: const InputDecoration(
              labelText: 'Your Balanced Thought',
              hintText: 'E.g., "I want this, but I don\'t need it. It will pass."',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.tips_and_updates, color: AppTheme.successColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'A balanced thought acknowledges reality while challenging distortions.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onNext: _balancedThoughtController.text.isNotEmpty
          ? () {
        widget.onComplete({
          'thoughtsBefore': _automaticThoughtController.text,
          'thoughtsAfter': _balancedThoughtController.text,
        });
      }
          : null,
      onPrevious: widget.onPrevious,
      nextButtonText: 'Complete',
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
          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.successColor),
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
                color: Colors.black.withOpacity(0.05),
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

  Widget _buildExampleThoughts() {
    final examples = [
      '"I can\'t handle this without it"',
      '"Just one won\'t hurt"',
      '"I deserve this"',
      '"I need this to feel better"',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.lightbulb_outline, size: 20, color: AppTheme.primaryColor),
                SizedBox(width: 8),
                Text(
                  'Common automatic thoughts:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...examples.map((example) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                example,
                style: const TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.textSecondary,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengePrompts() {
    final prompts = [
      'Have I successfully resisted before?',
      'What would I tell a friend?',
      'Is this thought 100% true?',
      'What are the downsides of giving in?',
    ];

    return Card(
      color: AppTheme.primaryColor.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consider:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            ...prompts.map((prompt) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(prompt, style: const TextStyle(fontSize: 13))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildThoughtBox(
              'Automatic Thought',
              _automaticThoughtController.text,
              AppTheme.errorColor,
            ),
            const SizedBox(height: 16),
            const Icon(Icons.arrow_downward, color: AppTheme.primaryColor),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Evidence:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'For: ${_evidenceForController.text.substring(0, _evidenceForController.text.length.clamp(0, 50))}...',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Against: ${_evidenceAgainstController.text.substring(0, _evidenceAgainstController.text.length.clamp(0, 50))}...',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThoughtBox(String label, String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
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
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
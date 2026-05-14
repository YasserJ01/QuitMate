import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Alternative behavior — "Replace the Urge" technique with a list of
/// healthy alternative actions to choose from.
class AlternativeBehaviorSteps extends StatefulWidget {
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const AlternativeBehaviorSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  });

  @override
  State<AlternativeBehaviorSteps> createState() =>
      _AlternativeBehaviorStepsState();
}

class _AlternativeBehaviorStepsState extends State<AlternativeBehaviorSteps> {
  String? _selectedAlternative;
  final _customController = TextEditingController();

  final List<Map<String, dynamic>> _alternatives = [
    {'emoji': '🏃', 'label': 'Physical Activity', 'desc': 'Push-ups, walk, stretch'},
    {'emoji': '💧', 'label': 'Drink Water', 'desc': 'A full glass, slowly'},
    {'emoji': '📞', 'label': 'Call Someone', 'desc': 'A friend or support person'},
    {'emoji': '🎵', 'label': 'Listen to Music', 'desc': 'Something uplifting'},
    {'emoji': '📝', 'label': 'Write It Down', 'desc': 'Journal what you feel'},
    {'emoji': '🧹', 'label': 'Clean Something', 'desc': 'Channel energy productively'},
    {'emoji': '🌿', 'label': 'Go Outside', 'desc': 'Fresh air and nature'},
    {'emoji': '🧘', 'label': 'Deep Breathing', 'desc': '10 slow, deep breaths'},
  ];

  @override
  void dispose() {
    _customController.dispose();
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
      title: 'Identify the Trigger',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What triggered this urge? Understanding the trigger '
            'is the first step to choosing a better response.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildTriggerExamples(),
          const SizedBox(height: 24),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'What triggered you?',
              hintText: 'E.g., stress, boredom, a specific situation...',
              border: OutlineInputBorder(),
            ),
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
      title: 'Choose an Alternative',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Instead of giving in, pick a healthy alternative:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ..._alternatives.map((alt) {
            final selected = _selectedAlternative == alt['label'];
            return Card(
              color: selected
                  ? AppTheme.successColor.withValues(alpha: 0.08)
                  : null,
              child: ListTile(
                leading: Text(alt['emoji'] as String,
                    style: const TextStyle(fontSize: 28)),
                title: Text(alt['label'] as String),
                subtitle: Text(alt['desc'] as String),
                trailing: selected
                    ? const Icon(Icons.check_circle,
                        color: AppTheme.successColor)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedAlternative = alt['label'] as String;
                  });
                },
              ),
            );
          }),
          const SizedBox(height: 16),
          const Text(
            'Or write your own:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _customController,
            decoration: const InputDecoration(
              hintText: 'Your own alternative...',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() => _selectedAlternative = value);
              }
            },
          ),
        ],
      ),
      onNext: _selectedAlternative != null ? widget.onNext : null,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep3() {
    return _buildStepContainer(
      stepNumber: 3,
      totalSteps: 4,
      title: 'Do It Now',
      content: Column(
        children: [
          const Text(
            'You have chosen your alternative. Now go do it!',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.successColor.withValues(alpha: 0.1),
            ),
            child: const Icon(
              Icons.directions_run,
              size: 80,
              color: AppTheme.successColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _selectedAlternative ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.successColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Take action now. Movement creates momentum.',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
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
      title: 'Reflect',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How did it go? Did the alternative help?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb, color: AppTheme.primaryColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Every time you choose a healthy alternative, '
                    'you weaken the old habit loop and strengthen '
                    'a new one.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Your Reflection',
              hintText: 'How do you feel after choosing the alternative?',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      onNext: () {
        widget.onComplete({
          'thoughtsBefore': 'Triggered by a craving',
          'thoughtsAfter': 'Chose alternative: $_selectedAlternative',
          'alternativeChosen': _selectedAlternative,
        });
      },
      onPrevious: widget.onPrevious,
      nextButtonText: 'Complete',
    );
  }

  Widget _buildTriggerExamples() {
    final examples = [
      'Stress or anxiety',
      'Boredom or restlessness',
      'Seeing someone else do it',
      'A specific time of day',
      'A particular emotion',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.lightbulb_outline,
                    size: 20, color: AppTheme.primaryColor),
                SizedBox(width: 8),
                Text(
                  'Common triggers:',
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
                      color: AppTheme.textSecondary,
                    ),
                  ),
                )),
          ],
        ),
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
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Delay tactic — "5-Minute Delay" technique with countdown timer
/// and mode-specific activity suggestions.
class DelayTacticSteps extends StatefulWidget {
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const DelayTacticSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  });

  @override
  State<DelayTacticSteps> createState() => _DelayTacticStepsState();
}

class _DelayTacticStepsState extends State<DelayTacticSteps> {
  int _remainingSeconds = 300; // 5 minutes
  bool _timerRunning = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _timerRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds <= 0) {
          _timerRunning = false;
          timer.cancel();
        }
      });
    });
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
      title: 'Commit to Wait',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Most cravings peak and pass within 3–5 minutes. '
            'Commit to waiting just 5 minutes before acting on the urge.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
              ),
              child: const Icon(
                Icons.timer,
                size: 80,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'You can do this. Just 5 minutes.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
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
      title: 'Start the Timer',
      content: Column(
        children: [
          const Text(
            'The timer is running. Use this time to distract yourself.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Countdown display
          Text(
            '${(_remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w300,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 32),
          if (!_timerRunning)
            ElevatedButton.icon(
              onPressed: _startTimer,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Timer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16),
              ),
            )
          else ...[
            LinearProgressIndicator(
              value: 1 - (_remainingSeconds / 300),
              backgroundColor:
                  AppTheme.primaryColor.withValues(alpha: 0.1),
              minHeight: 8,
            ),
            const SizedBox(height: 16),
            Text(
              _remainingSeconds > 0
                  ? 'Keep going...'
                  : 'Time is up! How do you feel?',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ],
      ),
      onNext: _remainingSeconds <= 0 ? widget.onNext : null,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep3() {
    final suggestions = [
      'Drink a full glass of cold water',
      'Do 10 push-ups or jumping jacks',
      'Step outside for fresh air',
      'Call or text a friend',
      'Chew gum or eat a healthy snack',
      'Write down what you are feeling',
    ];

    return _buildStepContainer(
      stepNumber: 3,
      totalSteps: 4,
      title: 'Distract Yourself',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'While the timer runs, try one of these:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ...suggestions.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 18, color: AppTheme.successColor),
                    const SizedBox(width: 8),
                    Expanded(child: Text(s)),
                  ],
                ),
              )),
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
      title: 'Re-evaluate',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'The 5 minutes are up. How do you feel now? '
            'Has the craving changed?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.tips_and_updates,
                    color: AppTheme.successColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Most cravings pass within 3–5 minutes. '
                    'If it is still present, try another 5 minutes '
                    'or a different exercise.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'What did you notice?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'How has the craving changed?',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Store for completion callback
            },
          ),
        ],
      ),
      onNext: () {
        widget.onComplete({
          'thoughtsBefore': 'Committed to 5-minute delay',
          'thoughtsAfter': 'Completed delay tactic',
          'alternativeChosen': '5-minute delay',
        });
      },
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
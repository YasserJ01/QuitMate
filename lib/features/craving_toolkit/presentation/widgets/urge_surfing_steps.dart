import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/theme/app_theme.dart';
import 'dart:math' as Math;


class UrgeSurfingSteps extends StatefulWidget {
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const UrgeSurfingSteps({
    Key? key,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<UrgeSurfingSteps> createState() => _UrgeSurfingStepsState();
}

class _UrgeSurfingStepsState extends State<UrgeSurfingSteps> {
  final TextEditingController _notesController = TextEditingController();
  Timer? _timer;
  int _timeRemaining = 180; // 3 minutes
  bool _isObserving = false;

  @override
  void dispose() {
    _notesController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startObservation() {
    setState(() {
      _isObserving = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
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
      title: 'Recognize the Wave',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cravings are like ocean waves. They rise, peak, and eventually crash.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          _buildWaveAnimation(),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Key Insight:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Most cravings peak within 3-5 minutes and pass within 15-20 minutes, even if you don\'t give in.',
                ),
              ],
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
      title: 'Observe Without Judgment',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notice your craving without trying to fight it or give in to it.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          _buildObservationPrompts(),
          const SizedBox(height: 24),
          if (!_isObserving)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _startObservation,
                icon: const Icon(Icons.visibility),
                label: const Text('Start Observing (3 minutes)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            )
          else
            _buildObservationTimer(),
        ],
      ),
      onNext: _isObserving && _timeRemaining < 120 ? widget.onNext : null,
      onPrevious: widget.onPrevious,
    );
  }

  Widget _buildStep3() {
    return _buildStepContainer(
      stepNumber: 3,
      totalSteps: 4,
      title: 'Ride the Wave',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You\'re doing great! The wave is already starting to pass.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          _buildIntensityTracker(),
          const SizedBox(height: 24),
          _buildCopingReminders(),
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
            'Congratulations! You rode the wave. How do you feel now?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Reflections',
              hintText: 'What did you notice? What helped?',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
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
                Icon(Icons.emoji_events, color: AppTheme.successColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'You proved you can ride the wave! Each time gets easier.',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onNext: () {
        widget.onComplete({
          'thoughtsAfter': _notesController.text,
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
        // Progress indicator
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
                // Step indicator
                Text(
                  'Step $stepNumber of $totalSteps',
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),

                // Content
                content,
              ],
            ),
          ),
        ),

        // Navigation buttons
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

  Widget _buildWaveAnimation() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: CustomPaint(
        painter: WavePainter(),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.waves, size: 48, color: AppTheme.primaryColor),
              SizedBox(height: 8),
              Text(
                'Craving Intensity',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildObservationPrompts() {
    final prompts = [
      'Where do you feel the craving in your body?',
      'What thoughts are coming up?',
      'What emotions are you experiencing?',
      'How intense is the craving (1-10)?',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ask yourself:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            ...prompts.map((prompt) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.radio_button_unchecked,
                    size: 16,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(prompt)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildObservationTimer() {
    final minutes = _timeRemaining ~/ 60;
    final seconds = _timeRemaining % 60;

    return Card(
      color: AppTheme.primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Observing...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$minutes:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 1 - (_timeRemaining / 180),
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            ),
            const SizedBox(height: 16),
            const Text(
              'Notice how the intensity changes over time',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntensityTracker() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Craving Intensity Over Time',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            _buildIntensityGraph(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntensityGraph() {
    return Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomPaint(
            painter: IntensityGraphPainter(
                progress: _timeRemaining <120 ? 1 - (_timeRemaining / 120) : 0,
            ),
        ),
    );
  }

  Widget _buildCopingReminders() {
    final reminders = [
      '🫁 Take slow, deep breaths',
      '💭 Remind yourself: "This will pass"',
      '🚶 Move your body if you can',
      '💧 Drink some water',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'While you wait:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        ...reminders.map((reminder) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(reminder),
          ),
        )),
      ],
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);

    // Draw wave
    for (double i = 0; i <= size.width; i++) {
      final progress = i / size.width;
      final y = size.height * 0.7 +
          20 * Math.sin(progress * 2 * Math.pi) *
              (1 - (progress - 0.5).abs() * 2);
      path.lineTo(i, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class IntensityGraphPainter extends CustomPainter {
  final double progress;

  IntensityGraphPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path.moveTo(0, size.height);

    // Draw intensity curve (rises then falls)
    for (double i = 0; i <= size.width * progress; i++) {
      final normalizedProgress = i / size.width;
      double intensity;

      if (normalizedProgress < 0.3) {
        // Rising
        intensity = normalizedProgress / 0.3;
      } else if (normalizedProgress < 0.5) {
        // Peak
        intensity = 1.0;
      } else {
        // Falling
        intensity = 1.0 - ((normalizedProgress - 0.5) / 0.5);
      }

      final y = size.height - (size.height * intensity * 0.8);
      path.lineTo(i, y);
    }

    canvas.drawPath(path, paint);

    // Draw current point
    if (progress > 0) {
      final currentX = size.width * progress;
      double currentIntensity;

      if (progress < 0.3) {
        currentIntensity = progress / 0.3;
      } else if (progress < 0.5) {
        currentIntensity = 1.0;
      } else {
        currentIntensity = 1.0 - ((progress - 0.5) / 0.5);
      }

      final currentY = size.height - (size.height * currentIntensity * 0.8);

      final dotPaint = Paint()
        ..color = AppTheme.primaryColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(currentX, currentY), 6, dotPaint);
    }
  }

  @override
  bool shouldRepaint(IntensityGraphPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
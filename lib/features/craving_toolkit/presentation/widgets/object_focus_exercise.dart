import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/theme/app_theme.dart';

class ObjectFocusExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const ObjectFocusExercise({
    super.key,
    required this.onComplete,
  });

  @override
  State<ObjectFocusExercise> createState() => _ObjectFocusExerciseState();
}

class _ObjectFocusExerciseState extends State<ObjectFocusExercise> {
  bool _isObserving = false;
  int _timeRemaining = 60; // 1 minute
  Timer? _timer;
  int _currentPrompt = 0;

  final List<String> _observationPrompts = [
    'What color is it?',
    'What shape does it have?',
    'What texture can you see?',
    'How does light reflect off it?',
    'What details do you notice?',
    'If you could touch it, how would it feel?',
    'What purpose does it serve?',
    'What makes it unique?',
  ];

  @override
  void dispose() {
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
          if (_timeRemaining % 8 == 0 && _currentPrompt < _observationPrompts.length - 1) {
            _currentPrompt++;
          }
        });
      } else {
        timer.cancel();
        widget.onComplete({'completed': true});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isObserving) {
      return _buildIntroScreen();
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          // Timer
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.warningColor,
                width: 8,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_timeRemaining',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.warningColor,
                    ),
                  ),
                  const Text(
                    'seconds',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),

          // Current prompt
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.warningColor.withValues(alpha:0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.visibility,
                  size: 32,
                  color: AppTheme.warningColor,
                ),
                const SizedBox(height: 16),
                Text(
                  _observationPrompts[_currentPrompt],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Progress indicator
          LinearProgressIndicator(
            value: (_currentPrompt + 1) / _observationPrompts.length,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.warningColor),
          ),
          const SizedBox(height: 8),
          Text(
            'Prompt ${_currentPrompt + 1} of ${_observationPrompts.length}',
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textSecondary,
            ),
          ),

          const Spacer(),

          // Instruction
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: AppTheme.primaryColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Keep your focus on the object. If your mind wanders, gently bring it back.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildIntroScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          const Icon(
            Icons.center_focus_strong,
            size: 80,
            color: AppTheme.warningColor,
          ),
          const SizedBox(height: 24),

          Text(
            'Object Focus',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'Choose an object in your environment and focus on it intensely for 60 seconds.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose any object:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildObjectExample('📱', 'Your phone'),
                  _buildObjectExample('☕', 'A cup or mug'),
                  _buildObjectExample('🖊️', 'A pen or pencil'),
                  _buildObjectExample('🪴', 'A plant'),
                  _buildObjectExample('🖼️', 'A picture or poster'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.tips_and_updates, color: AppTheme.primaryColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'This technique breaks the cycle of intrusive thoughts by redirecting your attention.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _startObservation,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Start Observing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildObjectExample(String emoji, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Text(name),
        ],
      ),
    );
  }
}
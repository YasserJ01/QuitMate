import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CountingExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const CountingExercise({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<CountingExercise> createState() => _CountingExerciseState();
}

class _CountingExerciseState extends State<CountingExercise> {
  int _currentNumber = 100;
  int _attempts = 0;
  bool _hasStarted = false;
  final List<int> _history = [];

  void _subtract7() {
    setState(() {
      _history.add(_currentNumber);
      _currentNumber -= 7;
      _attempts++;

      if (_currentNumber <= 0) {
        widget.onComplete({
          'attempts': _attempts,
          'completed': true,
        });
      }
    });
  }

  void _undo() {
    if (_history.isNotEmpty) {
      setState(() {
        _currentNumber = _history.removeLast();
        _attempts--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasStarted) {
      return _buildIntroScreen();
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          // Current number display
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppTheme.warningColor,
                width: 3,
              ),
            ),
            child: Column(
              children: [
                Text(
                  '$_currentNumber',
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.warningColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$_attempts ${_attempts == 1 ? "step" : "steps"}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Subtract button
          SizedBox(
            width: 200,
            height: 200,
            child: ElevatedButton(
              onPressed: _subtract7,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                shape: const CircleBorder(),
                elevation: 8,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '- 7',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Subtract',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Undo button
          if (_history.isNotEmpty)
            OutlinedButton.icon(
              onPressed: _undo,
              icon: const Icon(Icons.undo),
              label: const Text('Undo'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 48),
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
                Icon(Icons.lightbulb_outline, color: AppTheme.primaryColor),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Keep subtracting 7 until you reach 0 or below. Focus on the math!',
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
            Icons.calculate,
            size: 80,
            color: AppTheme.warningColor,
          ),
          const SizedBox(height: 24),

          Text(
            'Counting Exercise',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),

          const Text(
            'Count backwards from 100 by 7s. This mental math exercise redirects your focus.',
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
                    'Why this works:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBenefitItem('Engages your prefrontal cortex'),
                  _buildBenefitItem('Interrupts automatic thought patterns'),
                  _buildBenefitItem('Reduces anxiety through focus'),
                  _buildBenefitItem('Can be done anywhere, anytime'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Text('💡', style: TextStyle(fontSize: 24)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Example: 100 → 93 → 86 → 79 → 72...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasStarted = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.warningColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Start Counting',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            size: 16,
            color: AppTheme.successColor,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
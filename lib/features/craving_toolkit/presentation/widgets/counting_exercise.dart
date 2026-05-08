import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CountingExercise extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  const CountingExercise({super.key, required this.onComplete});

  @override
  State<CountingExercise> createState() => _CountingExerciseState();
}

class _CountingExerciseState extends State<CountingExercise> {
  int _currentNumber = 107;
  int _attempts = 0;
  bool _hasStarted = false;
  final List<int> _history = [];
  CountingDifficulty _difficulty = CountingDifficulty.easy;
  bool _isCompleted = false;

  int get _startNumber => _difficulty.startNumber;

  void _subtract7() {
    if (_isCompleted) return;
    setState(() {
      _history.add(_currentNumber);
      final nextNumber = _currentNumber - 7;
      _currentNumber = nextNumber < 0 ? 0 : nextNumber;
      _attempts++;

      if (_currentNumber == 0) {
        _isCompleted = true;
        widget.onComplete({'attempts': _attempts, 'completed': true});
      }
    });
  }

  void _undo() {
    if (_history.isNotEmpty) {
      setState(() {
        _currentNumber = _history.removeLast();
        _attempts--;
        if (_currentNumber > 0) {
          _isCompleted = false;
        }
      });
    }
  }

  void _setDifficulty(CountingDifficulty difficulty) {
    setState(() {
      _difficulty = difficulty;
      _resetExercise();
    });
  }

  void _resetExercise() {
    _currentNumber = _startNumber;
    _attempts = 0;
    _history.clear();
    _isCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasStarted) {
      return _buildIntroScreen();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildDifficultySelector(),
            const SizedBox(height: 16),
            const SizedBox(height: 32),

            // Current number display
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.warningColor.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.warningColor, width: 3),
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
                onPressed: _isCompleted ? null : _subtract7,
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
                      style: TextStyle(fontSize: 16, color: Colors.white),
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

            const SizedBox(height: 32),

            // Instruction
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Keep subtracting 7 until you reach 0. Focus on the math!',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),

            const Icon(Icons.calculate, size: 80, color: AppTheme.warningColor),
            const SizedBox(height: 24),

            Text(
              'Counting Exercise',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),

            Text(
              'Count backwards from ${_difficulty.startNumber} by 7s. This mental math exercise redirects your focus.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),

            _buildDifficultySelector(),
            const SizedBox(height: 24),

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
                color: AppTheme.warningColor.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Text('💡', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Example: ${_difficulty.startNumber} → ${_difficulty.startNumber - 7} → ${_difficulty.startNumber - 14} → ${_difficulty.startNumber - 21} → ${_difficulty.startNumber - 28}...',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasStarted = true;
                    _resetExercise();
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

  Widget _buildDifficultySelector() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha:0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.warningColor.withValues(alpha:0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Difficulty',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildDifficultyChip(CountingDifficulty.easy),
              const SizedBox(width: 8),
              _buildDifficultyChip(CountingDifficulty.medium),
              const SizedBox(width: 8),
              _buildDifficultyChip(CountingDifficulty.hard),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Start at ${_difficulty.startNumber}',
            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultyChip(CountingDifficulty difficulty) {
    final isSelected = _difficulty == difficulty;
    return ChoiceChip(
      label: Text(difficulty.label),
      selected: isSelected,
      onSelected: (_) => _setDifficulty(difficulty),
      selectedColor: AppTheme.warningColor,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppTheme.warningColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

enum CountingDifficulty {
  easy,
  medium,
  hard;

  String get label {
    switch (this) {
      case CountingDifficulty.easy:
        return 'Easy';
      case CountingDifficulty.medium:
        return 'Medium';
      case CountingDifficulty.hard:
        return 'Hard';
    }
  }

  int get startNumber {
    switch (this) {
      case CountingDifficulty.easy:
        return 107;
      case CountingDifficulty.medium:
        return 500;
      case CountingDifficulty.hard:
        return 1000;
    }
  }
}

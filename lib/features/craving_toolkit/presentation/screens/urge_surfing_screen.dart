import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/post_exercise_feedback_sheet.dart';

/// Guided urge surfing exercise with mode-specific wording and timer.
class UrgeSurfingScreen extends ConsumerStatefulWidget {
  final String mode; // GoalType.name

  const UrgeSurfingScreen({super.key, required this.mode});

  @override
  ConsumerState<UrgeSurfingScreen> createState() => _UrgeSurfingScreenState();
}

class _UrgeSurfingScreenState extends ConsumerState<UrgeSurfingScreen> {
  int _selectedMinutes = 5;
  int _elapsedSeconds = 0;
  bool _isRunning = false;
  bool _isCompleted = false;
  late DateTime _startTime;

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urge Surfing'),
        actions: [
          if (_isRunning)
            TextButton(
              onPressed: _exit,
              child: const Text('Skip'),
            ),
        ],
      ),
      body: _isCompleted
          ? _buildCompletion()
          : _isRunning
              ? _buildExercise()
              : _buildIntro(),
    );
  }

  Widget _buildIntro() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text('🌊', style: TextStyle(fontSize: 80)),
          const SizedBox(height: 24),
          Text(
            'Urge Surfing',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            _isSmoking
                ? 'Nicotine cravings typically peak within 3–5 minutes. '
                    'You do not need to fight it — just observe it.'
                : 'Urges follow the same wave pattern. They rise, peak, '
                    'and fall. You are not the urge.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text('Duration', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            children: [3, 5, 10].map((m) {
              final selected = _selectedMinutes == m;
              return ChoiceChip(
                label: Text('$m min'),
                selected: selected,
                onSelected: (_) => setState(() => _selectedMinutes = m),
                selectedColor: AppTheme.primaryColor,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : AppTheme.textPrimary,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _start,
              child: const Text('Start', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercise() {
    final remaining =
        (_selectedMinutes * 60 - _elapsedSeconds).clamp(0, _selectedMinutes * 60);
    final progress = _elapsedSeconds / (_selectedMinutes * 60);
    final third = (_selectedMinutes * 60) ~/ 3;

    String? prompt;
    if (_elapsedSeconds >= third * 2) {
      prompt = 'The wave is peaking. You are still here. You are in control.';
    } else if (_elapsedSeconds >= third) {
      prompt = 'Where do you feel the urge in your body? Just notice.';
    }

    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
          minHeight: 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${remaining ~/ 60}:${(remaining % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 32),
                if (prompt != null)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      prompt,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompletion() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, size: 80, color: AppTheme.successColor),
          const SizedBox(height: 24),
          Text(
            'Well done!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          const Text('The wave has passed.'),
          const SizedBox(height: 32),
          const Text('Did the urge pass?'),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _showFeedback(0),
              child: const Text('Yes, completely'),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _showFeedback(1),
              child: const Text('Reduced'),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _showFeedback(2),
              child: const Text('Still present'),
            ),
          ),
        ],
      ),
    );
  }

  void _start() {
    setState(() {
      _isRunning = true;
      _startTime = DateTime.now();
    });
    _tick();
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted || !_isRunning) return;
      final elapsed = DateTime.now().difference(_startTime).inSeconds;
      if (elapsed >= _selectedMinutes * 60) {
        setState(() {
          _isRunning = false;
          _isCompleted = true;
          _elapsedSeconds = _selectedMinutes * 60;
        });
      } else {
        setState(() => _elapsedSeconds = elapsed);
        _tick();
      }
    });
  }

  void _exit() {
    setState(() => _isRunning = false);
    _showFeedbackSheet();
  }

  void _showFeedback(int rating) {
    _showFeedbackSheet();
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
          exerciseName: 'Urge Surfing',
          wasCompleted: _isCompleted,
          onRatingSelected: (rating) {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
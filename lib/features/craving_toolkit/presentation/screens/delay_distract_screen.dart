import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/toolkit_provider.dart';
import '../widgets/post_exercise_feedback_sheet.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// Mode-specific delay-and-distract exercise with timer and activity suggestions.
class DelayDistractScreen extends ConsumerStatefulWidget {
  final String mode; // GoalType.name

  const DelayDistractScreen({super.key, required this.mode});

  @override
  ConsumerState<DelayDistractScreen> createState() =>
      _DelayDistractScreenState();
}

class _DelayDistractScreenState extends ConsumerState<DelayDistractScreen> {
  int _selectedMinutes = 5;
  int _elapsedSeconds = 0;
  bool _isRunning = false;
  bool _isCompleted = false;
  late DateTime _startTime;

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

  List<String> get _suggestions => _isSmoking
      ? [
          'Chew sugar-free gum',
          'Drink a full glass of water',
          'Do a quick puzzle on your phone',
          'Step outside for fresh air',
          'Call or text a friend',
          'Squeeze a stress ball',
        ]
      : [
          'Do 10 push-ups right now',
          'Go for a brisk walk',
          'Read a book for 10 minutes',
          'Call or text a friend',
          'Stretch your whole body',
          'Write in your journal',
        ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
      final exerciseId = _isSmoking
          ? 'delay-distract-smoking'
          : 'delay-distract-reduction';
      if (userId.isNotEmpty) {
        ref.read(toolkitSessionProvider.notifier).startSessionById(
              exerciseId: exerciseId,
              exerciseName: 'Delay & Distract',
              exerciseCategory: 'delayAndDistract',
              userId: userId,
              mode: widget.mode,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Keep the unified session notifier alive for this screen's lifetime
    // (it is autoDispose) so the session started in initState survives.
    ref.watch(toolkitSessionProvider);
    return PopScope(
      canPop: !_isRunning,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final confirm = await _showExitConfirmation();
        if (confirm == true && mounted) {
          ref
              .read(toolkitSessionProvider.notifier)
              .endSession(completed: false);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delay & Distract'),
          actions: [
            if (_isRunning)
              TextButton(
                onPressed: () => setState(() {
                  _isRunning = false;
                  _isCompleted = true;
                }),
                child: const Text('Done'),
              ),
          ],
        ),
        body: _isCompleted
            ? _buildCompletion()
            : _isRunning
                ? _buildExercise()
                : _buildIntro(),
      ),
    );
  }

  Widget _buildIntro() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text('⏰', style: TextStyle(fontSize: 80)),
          const SizedBox(height: 24),
          Text('Delay & Distract',
              style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 16),
          Text(
            'Tell yourself to wait 10 minutes. Then 10 more. '
            'Cravings rarely survive that.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text('Timer', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            children: [5, 10, 15, 20].map((m) {
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
              onPressed: () {
                setState(() {
                  _isRunning = true;
                  _startTime = DateTime.now();
                });
                _tick();
              },
              child:
                  const Text('Start Timer', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercise() {
    final remaining = (_selectedMinutes * 60 - _elapsedSeconds)
        .clamp(0, _selectedMinutes * 60);

    return Column(
      children: [
        LinearProgressIndicator(
          value: _elapsedSeconds / (_selectedMinutes * 60),
          backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
          minHeight: 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  '${remaining ~/ 60}:${(remaining % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                      fontSize: 64, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 32),
                Text('Try one of these:',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                ..._suggestions.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              size: 18, color: AppTheme.successColor),
                          const SizedBox(width: 8),
                          Text(s),
                        ],
                      ),
                    )),
                const Spacer(),
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
          const Icon(Icons.check_circle,
              size: 80, color: AppTheme.successColor),
          const SizedBox(height: 24),
          Text('Time is up!',
              style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 16),
          const Text('How do you feel now?'),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showFeedbackSheet(),
              child: const Text('I am okay — close'),
            ),
          ),
        ],
      ),
    );
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted || !_isRunning) return;
      final elapsed = DateTime.now().difference(_startTime).inSeconds;
      if (elapsed >= _selectedMinutes * 60) {
        setState(() {
          _isRunning = false;
          _isCompleted = true;
        });
      } else {
        setState(() => _elapsedSeconds = elapsed);
        _tick();
      }
    });
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
          exerciseName: 'Delay & Distract',
          wasCompleted: _isCompleted,
          onRatingSelected: (rating) {
            ref.read(toolkitSessionProvider.notifier).endSessionWithFeedback(
                  completed: _isCompleted,
                  rating: rating,
                );
          },
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Exercise?'),
        content: const Text(
          'Your progress won\'t be saved if you exit now. Are you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Continue Exercise'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../providers/toolkit_provider.dart';
import '../widgets/breathing_animation.dart';
import '../widgets/effectiveness_rating_dialog.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

class BreathingExerciseScreen extends ConsumerStatefulWidget {
  final BreathingPattern pattern;
  final int? cravingId;

  const BreathingExerciseScreen({
    super.key,
    required this.pattern,
    this.cravingId,
  });

  @override
  ConsumerState<BreathingExerciseScreen> createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState
    extends ConsumerState<BreathingExerciseScreen> {
  int _selectedDuration = 60; // Default 1 minute

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(breathingExerciseProvider(widget.pattern).notifier)
          .setDuration(_selectedDuration);

      // Start session tracking via unified session notifier
      final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
      if (userId.isNotEmpty) {
        final exerciseId = _exerciseIdForPattern(widget.pattern);
        ref.read(toolkitSessionProvider.notifier).startSessionById(
              exerciseId: exerciseId,
              exerciseName: widget.pattern.displayName,
              exerciseCategory: 'breathing',
              userId: userId,
              mode: ref.read(currentModeProvider).valueOrNull ?? 'quitSmoking',
            );
      }
    });
  }

  String _exerciseIdForPattern(BreathingPattern pattern) => switch (pattern) {
        BreathingPattern.box => 'breathing-box',
        BreathingPattern.relaxing => 'breathing-relaxing',
        BreathingPattern.energizing => 'breathing-energizing',
        BreathingPattern.calm => 'breathing-calm',
        BreathingPattern.custom => 'breathing-box',
      };

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(breathingExerciseProvider(widget.pattern));
    ref.listen<BreathingExerciseState>(
      breathingExerciseProvider(widget.pattern),
      (previous, next) {
        if ((previous?.isCompleted ?? false) == false && next.isCompleted) {
          ref.invalidate(toolkitStatisticsProvider);
        }
      },
    );

    return PopScope(
      canPop: !state.isRunning,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldExit = await _showExitConfirmation();
          if (shouldExit == true && context.mounted) {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () async {
              if (state.isRunning) {
                final shouldExit = await _showExitConfirmation();
                if (shouldExit == true && context.mounted) {
                  Navigator.pop(context);
                }
              } else {
                Navigator.pop(context);
              }
            },
          ),
          title: Text(
            widget.pattern.displayName,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            if (!state.isRunning && !state.isCompleted)
              IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.white),
                onPressed: () => _showPatternInfo(),
              ),
          ],
        ),
        body: SafeArea(
          child: state.isCompleted
              ? _buildCompletionScreen(state)
              : !state.isRunning && state.elapsedSeconds == 0
              ? _buildSetupScreen()
              : _buildExerciseScreen(state),
        ),
      ),
    );
  }

  Widget _buildSetupScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      // 1. The main layout is a Column.
      child: Column(
        children: [
          // 2. This Expanded widget contains a SingleChildScrollView.
          //    This makes only the top section scrollable if the content is too long.
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // All the content that should scroll goes here.
                  Text(
                    widget.pattern.emoji,
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.pattern.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.pattern.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _buildPatternRow('Inhale', widget.pattern.inhaleSeconds),
                        if (widget.pattern.holdSeconds > 0) ...[
                          const SizedBox(height: 12),
                          _buildPatternRow('Hold', widget.pattern.holdSeconds),
                        ],
                        const SizedBox(height: 12),
                        _buildPatternRow('Exhale', widget.pattern.exhaleSeconds),
                        if (widget.pattern.pauseSeconds > 0) ...[
                          const SizedBox(height: 12),
                          _buildPatternRow('Pause', widget.pattern.pauseSeconds),
                        ],
                        const Divider(height: 24, color: Colors.white24),
                _buildPatternRow(
                  'Total Cycle',
                  widget.pattern.totalCycleSeconds,
                  isTotal: true,
                ),
                const SizedBox(height: 12),
                Text(
                  'Durations are aligned to full cycles.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
                  const SizedBox(height: 32),
                  Text(
                    'Duration',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center, // Horizontal alignment
                    spacing: 12.0,                  // Gap between adjacent chips
                    runSpacing: 8.0,                // Gap between lines
                    children: [
                      _buildDurationChip(30, '30s'),
                      _buildDurationChip(60, '1m'),
                      _buildDurationChip(90, '90s'),
                      _buildDurationChip(120, '2m'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(breathingExerciseProvider(widget.pattern).notifier)
                            .start();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Start Exercise',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),// Extra padding at the bottom of the scroll view
                ],
              ),
            ),
          ),
          // 3. The "Start" button is outside the Expanded/SingleChildScrollView,
          //    so it will always be at the bottom of the screen.

        ],
      ),
    );
  }

  Widget _buildPatternRow(String label, int seconds, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          '${seconds}s',
          style: TextStyle(
            color: Colors.white,
            fontSize: isTotal ? 20 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDurationChip(int seconds, String label) {
    final isSelected = _selectedDuration == seconds;
    final cycleSeconds = widget.pattern.totalCycleSeconds;
    final alignedSeconds = cycleSeconds == 0
        ? seconds
        : seconds + ((cycleSeconds - (seconds % cycleSeconds)) % cycleSeconds);
    final displayLabel = alignedSeconds == seconds
        ? label
        : '$label (${_formatTime(alignedSeconds)})';
    return ChoiceChip(
      label: Text(displayLabel),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedDuration = seconds;
          });
          ref
              .read(breathingExerciseProvider(widget.pattern).notifier)
              .setDuration(seconds);
        }
      },
      selectedColor: Colors.white,
      backgroundColor: Colors.white.withValues(alpha: 0.2),
      labelStyle: TextStyle(
        color: isSelected ? AppTheme.primaryColor : Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildExerciseScreen(BreathingExerciseState state) {
    return Column(
      children: [
        // Progress bar
        LinearProgressIndicator(
          value: state.progress,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          minHeight: 4,
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Time remaining
                Text(
                  _formatTime(
                    (state.targetDuration - state.elapsedSeconds)
                        .clamp(0, state.targetDuration),
                  ),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),

                // Cycle count
                Text(
                  'Cycle ${state.currentCycle + 1}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),

                const Spacer(),

                // Breathing animation
                BreathingAnimation(
                  phase: state.currentPhase,
                  secondsRemaining: state.phaseSecondsRemaining,
                  pattern: widget.pattern,
                ),

                const Spacer(),

                // Phase instruction
                Text(
                  state.phaseInstruction,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Phase countdown
                Text(
                  '${state.phaseSecondsRemaining}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                const Spacer(),

                // Control buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.isRunning)
                      FloatingActionButton(
                        onPressed: () {
                          ref
                              .read(breathingExerciseProvider(widget.pattern)
                              .notifier)
                              .pause();
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.pause,
                          color: AppTheme.primaryColor,
                          size: 32,
                        ),
                      )
                    else
                      FloatingActionButton(
                        onPressed: () {
                          ref
                              .read(breathingExerciseProvider(widget.pattern)
                              .notifier)
                              .resume();
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.play_arrow,
                          color: AppTheme.primaryColor,
                          size: 32,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompletionScreen(BreathingExerciseState state) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // Success icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),

          // Completion message
          const Text(
            'Exercise Complete!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'You completed ${state.currentCycle} breathing cycles',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 48),

          // Stats
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildStatRow(
                  'Duration',
                  _formatTime(state.targetDuration),
                ),
                const Divider(height: 24, color: Colors.white24),
                _buildStatRow(
                  'Cycles',
                  '${state.currentCycle}',
                ),
                const Divider(height: 24, color: Colors.white24),
                _buildStatRow(
                  'Pattern',
                  widget.pattern.displayName,
                ),
              ],
            ),
          ),

          const Spacer(),

          // Action buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showEffectivenessRating(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                'Rate Effectiveness',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                ref
                    .read(breathingExerciseProvider(widget.pattern).notifier)
                    .reset();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                'Do Another Session',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _showPatternInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(widget.pattern.emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Text(widget.pattern.displayName),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.pattern.description),
            const SizedBox(height: 16),
            const Text(
              'Benefits:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildBenefitPoint('Reduces anxiety and stress'),
            _buildBenefitPoint('Calms the nervous system'),
            _buildBenefitPoint('Improves focus and clarity'),
            _buildBenefitPoint('Helps manage cravings'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 16, color: AppTheme.successColor),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Future<bool?> _showExitConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Exercise?'),
        content: const Text(
          'Your progress won\'t be saved if you exit now.',
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

  void _showEffectivenessRating() async {
    final rating = await showDialog<int>(
      context: context,
      builder: (context) => const EffectivenessRatingDialog(),
    );

    final effectivenessRating = rating ?? 3;
    await ref
        .read(breathingExerciseProvider(widget.pattern).notifier)
        .complete(effectivenessRating);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Great job! Keep up the practice.'),
          backgroundColor: AppTheme.successColor,
        ),
      );
      Navigator.pop(context);
    }
  }
}

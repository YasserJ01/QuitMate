import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/toolkit_provider.dart';
import '../providers/journal_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// Toolkit exercise for writing a personal relapse recovery plan.
///
/// Distinct from the panic mode screen — this is a deliberate, reflective
/// exercise accessed from the toolkit catalogue.
class RelapseRecoveryPlanScreen extends ConsumerStatefulWidget {
  final String mode;

  const RelapseRecoveryPlanScreen({super.key, required this.mode});

  @override
  ConsumerState<RelapseRecoveryPlanScreen> createState() =>
      _RelapseRecoveryPlanScreenState();
}

class _RelapseRecoveryPlanScreenState
    extends ConsumerState<RelapseRecoveryPlanScreen> {
  final _triggerController = TextEditingController();
  final _learnController = TextEditingController();
  final _supportController = TextEditingController();
  final _nextTimeController = TextEditingController();
  final _intentionController = TextEditingController();

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.read(currentUserIdProvider).valueOrNull ?? '';
      if (userId.isNotEmpty) {
        ref.read(toolkitSessionProvider.notifier).startSessionById(
              exerciseId: 'relapse-recovery-plan',
              exerciseName: 'Recovery Plan Exercise',
              exerciseCategory: 'relapseRecoveryPlanning',
              userId: userId,
              mode: widget.mode,
            );
      }
    });
  }

  @override
  void dispose() {
    _triggerController.dispose();
    _learnController.dispose();
    _supportController.dispose();
    _nextTimeController.dispose();
    _intentionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recovery Plan Exercise')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('🛡️', style: TextStyle(fontSize: 64)),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'This is a data point, not a failure.',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                _isSmoking
                    ? 'Every smoke-free stretch you have had was real. '
                        'Let us use this moment to learn and move forward.'
                    : 'Your goal is self-control, not self-punishment. '
                        'Let us take this one step at a time.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            _buildPrompt(
              'What triggered this?',
              'Understanding triggers helps prevent the next one.',
              _triggerController,
            ),
            _buildPrompt(
              'What can you learn from this?',
              'Every lapse carries a lesson. What did this experience teach you?',
              _learnController,
            ),
            _buildPrompt(
              'Who can you reach out to?',
              'Name specific people who can support you right now.',
              _supportController,
            ),
            _buildPrompt(
              'What will you do differently next time?',
              'Create a concrete plan for the next time this trigger appears.',
              _nextTimeController,
            ),
            _buildPrompt(
              'Set a new intention',
              'What is one positive action you will take today?',
              _intentionController,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSave,
                child: const Text('Save My Plan',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildPrompt(
    String title,
    String subtitle,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppTheme.textSecondary)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Write your thoughts here...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSave() async {
    // End session as completed
    ref.read(toolkitSessionProvider.notifier).endSession(completed: true);

    // Build plan content for journal
    final content = _buildPlanContent();

    // Offer journal save
    if (content.isNotEmpty) {
      final saveToJournal = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Save to Journal?'),
          content: const Text(
            'Would you like to save this recovery plan to your journal?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No thanks'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Save'),
            ),
          ],
        ),
      );

      if (saveToJournal == true && mounted) {
        await ref.read(journalNotifierProvider.notifier).createEntry(
              content: content,
              sourceExerciseId: 'relapse-recovery-plan',
              sourceExerciseName: 'Recovery Plan Exercise',
            );
      }
    }

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your recovery plan is ready.'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    }
  }

  String _buildPlanContent() {
    final buffer = StringBuffer();
    if (_triggerController.text.trim().isNotEmpty) {
      buffer.writeln('Trigger: ${_triggerController.text.trim()}');
    }
    if (_learnController.text.trim().isNotEmpty) {
      buffer.writeln('Lesson: ${_learnController.text.trim()}');
    }
    if (_supportController.text.trim().isNotEmpty) {
      buffer.writeln('Support: ${_supportController.text.trim()}');
    }
    if (_nextTimeController.text.trim().isNotEmpty) {
      buffer.writeln('Next Time: ${_nextTimeController.text.trim()}');
    }
    if (_intentionController.text.trim().isNotEmpty) {
      buffer.writeln('Intention: ${_intentionController.text.trim()}');
    }
    return buffer.toString();
  }
}
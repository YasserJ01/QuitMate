import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Toolkit exercise for writing a personal relapse recovery plan.
///
/// Distinct from the panic mode screen — this is a deliberate, reflective
/// exercise accessed from the toolkit catalogue.
class RelapseRecoveryPlanScreen extends StatefulWidget {
  final String mode;

  const RelapseRecoveryPlanScreen({super.key, required this.mode});

  @override
  State<RelapseRecoveryPlanScreen> createState() =>
      _RelapseRecoveryPlanScreenState();
}

class _RelapseRecoveryPlanScreenState extends State<RelapseRecoveryPlanScreen> {
  final _triggerController = TextEditingController();
  final _learnController = TextEditingController();
  final _supportController = TextEditingController();
  final _nextTimeController = TextEditingController();
  final _intentionController = TextEditingController();

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

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
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your recovery plan is ready.'),
                      backgroundColor: AppTheme.successColor,
                    ),
                  );
                },
                child: const Text('Save My Plan', style: TextStyle(fontSize: 16)),
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
}
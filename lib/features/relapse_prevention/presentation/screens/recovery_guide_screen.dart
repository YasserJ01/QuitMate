import 'package:flutter/material.dart';

/// Static, mode-specific recovery guide article.
///
/// Content is hardcoded Dart strings — no network, no API.
/// Two versions: one for smoking, one for reduction.
class RecoveryGuideScreen extends StatelessWidget {
  final String mode;

  const RecoveryGuideScreen({super.key, required this.mode});

  bool get _isSmoking => mode.toLowerCase() == 'quitsmoking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recovery Guide')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              'This is a data point, not a failure.',
              _isSmoking
                  ? 'Every person who has ever quit smoking has had moments '
                      'like this. What matters is not that you slipped — it is '
                      'what you do next. You have already proven you can go '
                      'without smoking. That strength has not disappeared.'
                  : 'Compulsive patterns are challenging precisely because they '
                      'feel automatic. Noticing a lapse is itself an act of '
                      'awareness. You are building self-control, and self-control '
                      'is a skill that grows with practice.',
            ),
            _buildSection(
              context,
              'What to do in the next 10 minutes',
              '1. Take three slow, deep breaths.\n'
                  '2. Drink a full glass of water.\n'
                  '3. Step outside or change your environment.\n'
                  '4. Open the craving toolkit and try a grounding exercise.\n'
                  '5. Remind yourself: this moment will pass.',
            ),
            _buildSection(
              context,
              'What to do today',
              '• Be kind to yourself. Self-criticism does not help.\n'
                  '• Identify what triggered this moment.\n'
                  '• Reach out to one person in your support network.\n'
                  '• Do something you enjoy — you deserve care.\n'
                  '• Write in your journal about what you learned.',
            ),
            _buildSection(
              context,
              'What to do this week',
              '• Review your relapse prevention plan.\n'
                  '• Practice your favorite toolkit exercise daily.\n'
                  '• Notice your progress, not just this moment.\n'
                  '• Adjust your environment to reduce triggers.\n'
                  '• Celebrate every small win.',
            ),
            _buildSection(
              context,
              'Remember your reasons',
              _isSmoking
                  ? 'You started this journey for a reason. Your health, your '
                      'family, your freedom, your finances — those reasons are '
                      'still true. One moment does not erase your progress.'
                  : 'You chose this path because you want more control over your '
                      'life. That desire is still there. Every moment of awareness '
                      'is a step toward the person you want to be.',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(height: 1.6)),
        ],
      ),
    );
  }
}
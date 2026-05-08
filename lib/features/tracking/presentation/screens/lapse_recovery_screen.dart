import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../data/models/log_entry.dart';
import '../providers/lapse_recovery_provider.dart';
import '../providers/tracking_provider.dart';

/// Multi-step lapse recovery flow per SRS §8.4.
/// Triggered immediately after a lapse event is logged.
/// Never shows shame language — "This is a data point, not a failure."
class LapseRecoveryScreen extends ConsumerStatefulWidget {
  final LogType lapseType;

  const LapseRecoveryScreen({super.key, required this.lapseType});

  @override
  ConsumerState<LapseRecoveryScreen> createState() =>
      _LapseRecoveryScreenState();
}

class _LapseRecoveryScreenState extends ConsumerState<LapseRecoveryScreen> {
  @override
  void initState() {
    super.initState();
    // Log the lapse with recovery on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logLapseEvent();
    });
  }

  Future<void> _logLapseEvent() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    await ref.read(lapseRecoveryProvider.notifier).logLapseWithRecovery(
          userId: userId,
          lapseType: widget.lapseType,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lapseRecoveryProvider);
    final notifier = ref.read(lapseRecoveryProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // Step content
              switch (state.step) {
                LapseRecoveryStep.acknowledgment =>
                  _AcknowledgmentStep(onContinue: () => notifier.goToStep(LapseRecoveryStep.triggerSelect)),
                LapseRecoveryStep.triggerSelect =>
                  _TriggerSelectStep(
                    selectedTriggers: state.selectedTriggers,
                    onToggle: (t) => notifier.toggleTrigger(t),
                    onContinue: () => notifier.goToStep(LapseRecoveryStep.nextAction),
                  ),
                LapseRecoveryStep.nextAction =>
                  _NextActionStep(
                    onDismiss: () {
                      notifier.complete();
                      Navigator.of(context).pop();
                    },
                  ),
              },

              const Spacer(),

              if (state.isLoading)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Step 1: Acknowledgment ────────────────────────────────────────────────

class _AcknowledgmentStep extends StatelessWidget {
  final VoidCallback onContinue;

  const _AcknowledgmentStep({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppTheme.successColor.withValues(alpha:0.1),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text('💚', style: TextStyle(fontSize: 60)),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'This is a data point, not a failure.',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Let\'s keep going. Your journey continues right now.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onContinue,
            child: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}

// ─── Step 2: Trigger Identification (optional) ─────────────────────────────

class _TriggerSelectStep extends StatelessWidget {
  final List<String> selectedTriggers;
  final ValueChanged<String> onToggle;
  final VoidCallback onContinue;

  const _TriggerSelectStep({
    required this.selectedTriggers,
    required this.onToggle,
    required this.onContinue,
  });

  static const _commonTriggers = [
    'Stress', 'Boredom', 'Social', 'Anxiety',
    'Loneliness', 'Alcohol', 'After Meals', 'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.search, size: 48, color: AppTheme.primaryColor),
        const SizedBox(height: 16),
        Text(
          'What triggered this?',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Identifying triggers helps you prepare for next time.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _commonTriggers.map((trigger) {
            final isSelected = selectedTriggers.contains(trigger);
            return FilterChip(
              label: Text(trigger),
              selected: isSelected,
              onSelected: (_) => onToggle(trigger),
              selectedColor: AppTheme.primaryColor.withValues(alpha:0.2),
              checkmarkColor: AppTheme.primaryColor,
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onContinue,
                child: const Text('Skip this step'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: onContinue,
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Step 3: Next Action ───────────────────────────────────────────────────

class _NextActionStep extends StatelessWidget {
  final VoidCallback onDismiss;

  const _NextActionStep({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.directions_run, size: 48, color: AppTheme.primaryColor),
        const SizedBox(height: 16),
        Text(
          'What would you like to do next?',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        _ActionCard(
          icon: Icons.self_improvement,
          title: 'Open the Craving Toolkit',
          subtitle: 'Breathing exercises, grounding, and more',
          color: AppTheme.primaryColor,
          onTap: () {
            Navigator.of(context).pop(); // Close recovery screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CravingToolkitScreen()),
            );
          },
        ),
        const SizedBox(height: 12),
        _ActionCard(
          icon: Icons.menu_book,
          title: 'Read the Recovery Guide',
          subtitle: 'Evidence-based tips for getting back on track',
          color: AppTheme.secondaryColor,
          onTap: () {
            // TODO: Navigate to recovery guide article
            onDismiss();
          },
        ),
        const SizedBox(height: 12),
        _ActionCard(
          icon: Icons.check_circle_outline,
          title: 'I\'m ready to continue',
          subtitle: 'Return to the dashboard',
          color: AppTheme.successColor,
          onTap: onDismiss,
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha:0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            )),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/lapse_recovery_session_model.dart';
import '../providers/relapse_provider.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import 'recovery_guide_screen.dart';

/// Multi-step post-lapse recovery flow per SRS §8.4.
///
/// Triggered when the user logs a lapse event. Guides them through
/// acknowledgment → trigger identification → next action.
class LapseRecoveryScreen extends ConsumerStatefulWidget {
  final String mode; // GoalType.name

  const LapseRecoveryScreen({super.key, required this.mode});

  @override
  ConsumerState<LapseRecoveryScreen> createState() =>
      _LapseRecoveryScreenState();
}

class _LapseRecoveryScreenState extends ConsumerState<LapseRecoveryScreen> {
  int _currentStep = 0;
  final List<String> _selectedTriggers = [];
  String? _sessionId;

  bool get _isSmoking => widget.mode.toLowerCase() == 'quitsmoking';

  List<String> get _triggerOptions => _isSmoking
      ? [
          'Stress',
          'After a meal',
          'Social situation',
          'Morning routine',
          'Boredom',
          'Alcohol / drinks',
          'Difficult emotion',
          'Automatic habit',
          'Other',
        ]
      : [
          'Stress',
          'Boredom',
          'Bedtime',
          'Solitude',
          'Phone / screen',
          'Difficult emotion',
          'Fatigue',
          'Other',
        ];

  @override
  void initState() {
    super.initState();
    _startSession();
  }

  Future<void> _startSession() async {
    final userId = await ref.read(relapseUserIdProvider.future);
    final repo = ref.read(relapseRepositoryProvider);
    _sessionId = await repo.createRecoverySession(
      userId: userId,
      mode: widget.mode,
    );
  }

  Future<void> _saveTriggers() async {
    if (_sessionId == null) return;
    await ref.read(relapseRepositoryProvider).updateRecoverySessionTriggers(
          sessionId: _sessionId!,
          triggers: _selectedTriggers,
        );
  }

  Future<void> _completeSession(LapseRecoveryAction action,
      {bool openedToolkit = false, bool readRecoveryGuide = false}) async {
    if (_sessionId == null) return;
    await ref.read(relapseRepositoryProvider).completeRecoverySession(
          sessionId: _sessionId!,
          action: action,
          openedToolkit: openedToolkit,
          readRecoveryGuide: readRecoveryGuide,
        );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentStep == 0,
      child: Scaffold(
        appBar: AppBar(
          leading: _currentStep > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => setState(() => _currentStep--),
                )
              : null,
        ),
        body: [_buildStep0(), _buildStep1(), _buildStep2()][_currentStep],
      ),
    );
  }

  // ── Step 0: Acknowledgment ──────────────────────────────────────────────

  Widget _buildStep0() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text('🫂', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 24),
          Text(
            'This is a data point, not a failure.',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'You noticed. That is the first step.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            _isSmoking
                ? 'Every smoke-free stretch you have had was real. '
                    'Let us use this moment to learn and move forward.'
                : 'Your goal is self-control, not self-punishment. '
                    'Let us take this one step at a time.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => setState(() => _currentStep = 1),
              child: const Text("I am ready — what is next?"),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              _completeSession(LapseRecoveryAction.skipped);
              Navigator.pop(context);
            },
            child: const Text('I need a moment'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── Step 1: Trigger Identification ──────────────────────────────────────

  Widget _buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What triggered this?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Understanding triggers helps prevent the next one.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _triggerOptions.map((trigger) {
                  final selected = _selectedTriggers.contains(trigger);
                  return FilterChip(
                    label: Text(trigger),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        selected
                            ? _selectedTriggers.remove(trigger)
                            : _selectedTriggers.add(trigger);
                      });
                    },
                    selectedColor:
                        AppTheme.primaryColor.withValues(alpha: 0.15),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    await _saveTriggers();
                    setState(() => _currentStep = 2);
                  },
                  child: const Text('Save & Continue'),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => setState(() => _currentStep = 2),
                child: const Text('Skip — I am not sure'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Step 2: Choose Next Action ──────────────────────────────────────────

  Widget _buildStep2() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What would help right now?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          _OptionCard(
            emoji: '🧰',
            title: 'Open the Craving Toolkit',
            subtitle: 'Use a breathing or grounding exercise',
            onTap: () {
              _completeSession(LapseRecoveryAction.openedToolkit,
                  openedToolkit: true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const CravingToolkitScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _OptionCard(
            emoji: '📖',
            title: 'Read the Recovery Guide',
            subtitle: 'Short, compassionate next-step guide',
            onTap: () {
              _completeSession(LapseRecoveryAction.readRecoveryGuide,
                  readRecoveryGuide: true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RecoveryGuideScreen(mode: widget.mode),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _OptionCard(
            emoji: '✓',
            title: 'I am okay — close',
            subtitle: 'Just acknowledge and move on',
            onTap: () {
              _completeSession(LapseRecoveryAction.skipped);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _OptionCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
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
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../data/models/log_entry.dart';
import '../providers/checkin_provider.dart';
import '../providers/tracking_provider.dart';

class DailyCheckinSheet extends ConsumerStatefulWidget {
  const DailyCheckinSheet({super.key});

  @override
  ConsumerState<DailyCheckinSheet> createState() => _DailyCheckinSheetState();
}

class _DailyCheckinSheetState extends ConsumerState<DailyCheckinSheet> {
  int _moodScore = 3; // neutral default
  bool _hadCraving = false;
  int _distressRating = 5; // reduction mode
  bool? _actedOnUrge; // reduction mode
  bool? _smokedToday; // smoking mode
  String? _cravingLevel; // smoking mode
  bool _isSubmitting = false;

  GoalType? _mode;

  @override
  void initState() {
    super.initState();
    _loadMode();
  }

  Future<void> _loadMode() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;
    final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
    if (mounted) {
      setState(() => _mode = profile?.goalType);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSmoking = _mode == GoalType.quitSmoking;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Check-in',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              'A quick reflection on how your day is going.',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // ── Mood ──────────────────────────────────────────────────
            Text('How do you feel right now?',
                style: theme.textTheme.titleSmall),
            const SizedBox(height: 12),
            _MoodSelector(
              selected: _moodScore,
              onChanged: (v) => setState(() => _moodScore = v),
            ),
            const SizedBox(height: 20),

            // ── Craving ───────────────────────────────────────────────
            Text('Any cravings today?',
                style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('No'),
                  selected: !_hadCraving,
                  onSelected: (_) =>
                      setState(() => _hadCraving = false),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Yes'),
                  selected: _hadCraving,
                  onSelected: (_) =>
                      setState(() => _hadCraving = true),
                ),
              ],
            ),

            // ── Mode-specific fields ──────────────────────────────────
            if (isSmoking) ...[
              const SizedBox(height: 20),
              Text('Did you smoke today?',
                  style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('No'),
                    selected: _smokedToday == false,
                    onSelected: (_) =>
                        setState(() => _smokedToday = false),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Yes'),
                    selected: _smokedToday == true,
                    onSelected: (_) =>
                        setState(() => _smokedToday = true),
                  ),
                ],
              ),
              if (_hadCraving) ...[
                const SizedBox(height: 16),
                Text('Craving level today?',
                    style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ['low', 'medium', 'high'].map((level) {
                    return ChoiceChip(
                      label: Text(level[0].toUpperCase() +
                          level.substring(1)),
                      selected: _cravingLevel == level,
                      onSelected: (_) =>
                          setState(() => _cravingLevel = level),
                    );
                  }).toList(),
                ),
              ],
            ],

            if (!isSmoking) ...[
              const SizedBox(height: 20),
              Text('Distress level today (1–10)?',
                  style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('1',
                      style: theme.textTheme.bodySmall),
                  Expanded(
                    child: Slider(
                      value: _distressRating.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      label: '$_distressRating',
                      onChanged: (v) => setState(
                          () => _distressRating = v.round()),
                    ),
                  ),
                  Text('10',
                      style: theme.textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 16),
              Text('Did you act on any urge today?',
                  style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('No'),
                    selected: _actedOnUrge == false,
                    onSelected: (_) =>
                        setState(() => _actedOnUrge = false),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Yes'),
                    selected: _actedOnUrge == true,
                    onSelected: (_) =>
                        setState(() => _actedOnUrge = true),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Submit'),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    try {
      await ref.read(checkInProvider.notifier).submit(
        moodScore: _moodScore,
        hadCraving: _hadCraving,
        distressRating:
            _mode == GoalType.reduceMasturbation ? _distressRating : null,
        actedOnUrge:
            _mode == GoalType.reduceMasturbation ? _actedOnUrge : null,
        smokedToday:
            _mode == GoalType.quitSmoking ? _smokedToday : null,
        cravingLevel:
            _mode == GoalType.quitSmoking && _hadCraving ? _cravingLevel : null,
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Check-in failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }
}

// ─── Mood selector (emoji scale 1–5) ──────────────────────────────────────

class _MoodSelector extends StatelessWidget {
  final int selected;
  final void Function(int) onChanged;

  const _MoodSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MoodType.values.map((mood) {
        final isSelected = mood.value == selected;
        return GestureDetector(
          onTap: () => onChanged(mood.value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Text(mood.emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 4),
                Text(
                  mood.displayName,
                  style: TextStyle(
                    fontSize: 11,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
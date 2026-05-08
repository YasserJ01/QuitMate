import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';

import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import 'goal_setting_screen.dart';

class ReductionProfileFormScreen extends ConsumerStatefulWidget {
  const ReductionProfileFormScreen({super.key});

  @override
  ConsumerState<ReductionProfileFormScreen> createState() =>
      _ReductionProfileFormScreenState();
}

class _ReductionProfileFormScreenState
    extends ConsumerState<ReductionProfileFormScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  static const _timeOfDayOptions = [
    'Morning',
    'Afternoon',
    'Evening',
    'Night',
    'Bedtime',
  ];
  static const _effectOptions = [
    'Not affected',
    'Slightly',
    'Moderately',
    'Severely',
  ];
  static const _previousAttemptOptions = ['0', '1', '2', '3+'];
  static const _valueOptions = [
    'Focus',
    'Sleep',
    'Relationships',
    'Spiritual goals',
    'Emotional regulation',
    'Energy',
    'Self-control',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _currentPage > 0
              ? () => _goToPage(_currentPage - 1)
              : () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Step indicator
            _StepIndicator(currentStep: _currentPage, totalSteps: 4),

            // Personalization explanation (US-ON03)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Your answers help personalize your dashboard and recommendations. All data stays on your device.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),

            // Page view
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) =>
                    setState(() => _currentPage = page),
                children: [
                  _buildStep1(notifier, state),
                  _buildStep2(notifier, state),
                  _buildStep3(notifier, state),
                  _buildStep4(notifier, state),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 1: Frequency & Patterns ───────────────────────────────────────

  Widget _buildStep1(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Frequency & Patterns',
            style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 16),

        // Episodes per week slider
        _buildSliderField(
          label: 'Episodes per week',
          value: (state.episodesPerWeek ?? 7).toDouble(),
          min: 1,
          max: 21,
          divisions: 20,
          displayValue: '${state.episodesPerWeek ?? 7}',
          onChanged: (v) => notifier.setEpisodesPerWeek(v.round()),
          onSkip: () => notifier.setEpisodesPerWeek(null),
        ),
        const SizedBox(height: 24),

        // Episode duration (for time reclaimed calc)
        _buildSliderField(
          label: 'Average episode duration (minutes)',
          value: (state.episodeDurationMinutes ?? 15).toDouble(),
          min: 1,
          max: 120,
          divisions: 119,
          displayValue: '${state.episodeDurationMinutes ?? 15} min',
          onChanged: (v) => notifier.setEpisodeDurationMinutes(v.round()),
          onSkip: () => notifier.setEpisodeDurationMinutes(null),
        ),
        const SizedBox(height: 24),

        // Time-of-day patterns
        _buildChipSection(
          label: 'Time-of-day patterns',
          options: _timeOfDayOptions,
          selected: state.timeOfDayPatterns,
          onToggle: (p) => notifier.toggleTimeOfDayPattern(p),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () => _goToPage(_currentPage + 1),
          child: const Text(AppStrings.next),
        ),
      ],
    );
  }

  // ── Step 2: Triggers & Context ─────────────────────────────────────────

  Widget _buildStep2(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Triggers & Context',
            style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 16),

        // Common triggers
        _buildChipSection(
          label: 'Common triggers',
          options: TriggerType.values.map((t) => t.displayName).toList(),
          selected: state.triggers.map((t) => t.displayName).toList(),
          onToggle: (name) {
            final trigger = TriggerType.values.firstWhere(
              (t) => t.displayName == name,
              orElse: () => TriggerType.other,
            );
            notifier.toggleTrigger(trigger);
          },
        ),
        const SizedBox(height: 24),

        // Pornography involvement (optional, neutral label FR-M02, BR-06)
        _buildSwitchField(
          label: 'Does pornography play a role?',
          value: state.pornInvolvementFlag ?? false,
          onChanged: (v) => notifier.setPornInvolvementFlag(v),
          onSkip: () => notifier.setPornInvolvementFlag(null),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () => _goToPage(_currentPage + 1),
          child: const Text(AppStrings.next),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => _goToPage(_currentPage + 1),
          child: const Text(AppStrings.skip),
        ),
      ],
    );
  }

  // ── Step 3: Impact & History ───────────────────────────────────────────

  Widget _buildStep3(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Impact & History',
            style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 16),

        // Distress level
        _buildSliderField(
          label: 'Distress level',
          value: (state.distressLevel ?? 5).toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          displayValue: '${state.distressLevel ?? 5}/10',
          onChanged: (v) => notifier.setDistressLevel(v.round()),
          onSkip: () => notifier.setDistressLevel(null),
        ),
        const SizedBox(height: 24),

        // Effect on sleep
        _buildEffectDropdown(
          label: 'Effect on sleep',
          value: state.sleepEffectIndex,
          onChanged: (v) => notifier.setSleepEffectIndex(v),
          onSkip: () => notifier.setSleepEffectIndex(null),
        ),
        const SizedBox(height: 16),

        // Effect on focus
        _buildEffectDropdown(
          label: 'Effect on focus',
          value: state.focusEffectIndex,
          onChanged: (v) => notifier.setFocusEffectIndex(v),
          onSkip: () => notifier.setFocusEffectIndex(null),
        ),
        const SizedBox(height: 16),

        // Effect on relationships
        _buildEffectDropdown(
          label: 'Effect on relationships',
          value: state.relationshipEffectIndex,
          onChanged: (v) => notifier.setRelationshipEffectIndex(v),
          onSkip: () => notifier.setRelationshipEffectIndex(null),
        ),
        const SizedBox(height: 24),

        // Previous reduction attempts
        _buildDropdownField(
          label: 'Previous reduction attempts',
          value: state.previousReductionAttempts,
          items: _previousAttemptOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
          onChanged: (v) => notifier.setPreviousReductionAttempts(v),
          onSkip: () => notifier.setPreviousReductionAttempts(null),
        ),
        const SizedBox(height: 24),

        // Confidence to reduce
        _buildConfidenceSlider(
          label: 'Confidence to reduce',
          value: state.confidenceToReduce ?? 5,
          onChanged: (v) => notifier.setConfidenceToReduce(v),
          onSkip: () => notifier.setConfidenceToReduce(null),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () => _goToPage(_currentPage + 1),
          child: const Text(AppStrings.next),
        ),
      ],
    );
  }

  // ── Step 4: Values Clarification (skippable) ──────────────────────────

  Widget _buildStep4(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Values Clarification',
            style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 8),
        Text(
          'Understanding your core values helps personalize your recovery journey.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
        const SizedBox(height: 16),

        // Personal values
        _buildChipSection(
          label: 'What matters most to you?',
          options: _valueOptions,
          selected: state.values,
          onToggle: (v) => notifier.toggleValue(v),
        ),
        const SizedBox(height: 32),

        // Skip for now — prominent button (FR-M07)
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const GoalSettingScreen()),
            );
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: AppTheme.textSecondary),
          ),
          child: const Text('Skip for now'),
        ),
        const SizedBox(height: 12),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const GoalSettingScreen()),
            );
          },
          child: const Text(AppStrings.next),
        ),
      ],
    );
  }

  // ── Reusable builders ──────────────────────────────────────────────────

  Widget _buildSliderField({
    required String label,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String displayValue,
    required ValueChanged<double> onChanged,
    required VoidCallback onSkip,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
            TextButton(
              onPressed: onSkip,
              child: const Text(AppStrings.skip),
            ),
          ],
        ),
        Text(displayValue,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor)),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required int? value,
    required List<DropdownMenuItem<int>> items,
    required ValueChanged<int?> onChanged,
    required VoidCallback onSkip,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
            TextButton(
              onPressed: onSkip,
              child: const Text(AppStrings.skip),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          initialValue: value,
          items: items,
          onChanged: onChanged,
          decoration: const InputDecoration(hintText: 'Select...'),
        ),
      ],
    );
  }

  Widget _buildEffectDropdown({
    required String label,
    required int? value,
    required ValueChanged<int?> onChanged,
    required VoidCallback onSkip,
  }) {
    return _buildDropdownField(
      label: label,
      value: value,
      items: _effectOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
      onChanged: onChanged,
      onSkip: onSkip,
    );
  }

  Widget _buildSwitchField({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required VoidCallback onSkip,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
            TextButton(
              onPressed: onSkip,
              child: const Text(AppStrings.skip),
            ),
          ],
        ),
        SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: Text(label),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildChipSection({
    required String label,
    required List<String> options,
    required List<String> selected,
    required ValueChanged<String> onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = selected.contains(option);
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (_) => onToggle(option),
              selectedColor: AppTheme.primaryColor.withValues(alpha:0.2),
              checkmarkColor: AppTheme.primaryColor,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConfidenceSlider({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
    required VoidCallback onSkip,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            TextButton(
              onPressed: onSkip,
              child: const Text(AppStrings.skip),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(_confidenceEmoji(value), style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: Slider(
                value: value.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                label: '$value',
                onChanged: (v) => onChanged(v.round()),
              ),
            ),
            Text('$value/10',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ],
    );
  }

  String _confidenceEmoji(int value) {
    if (value <= 2) return '😟';
    if (value <= 4) return '😐';
    if (value <= 6) return '🙂';
    if (value <= 8) return '😊';
    return '💪';
  }
}

// ── Step Indicator ────────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const _StepIndicator({
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index <= currentStep;
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: index < totalSteps - 1 ? 8 : 0),
              decoration: BoxDecoration(
                color: isActive ? AppTheme.primaryColor : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}

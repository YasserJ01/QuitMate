import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';

import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import 'quit_date_screen.dart';

class SmokingProfileFormScreen extends ConsumerStatefulWidget {
  const SmokingProfileFormScreen({super.key});

  @override
  ConsumerState<SmokingProfileFormScreen> createState() =>
      _SmokingProfileFormScreenState();
}

class _SmokingProfileFormScreenState
    extends ConsumerState<SmokingProfileFormScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Step 1 controllers
  final _costPerPackController = TextEditingController();
  final _cigarettesPerPackController = TextEditingController();

  static const _ttfcOptions = ['≤5 min', '6–30 min', '31–60 min', '>60 min'];
  static const _smokingWindowOptions = [
    'Morning',
    'After meals',
    'Social',
    'Stress',
    'Evening',
    'Driving',
  ];
  static const _previousAidOptions = [
    'NRT',
    'Medication',
    'App',
    'Counseling',
    'Cold turkey',
    'Other',
  ];
  static const _previousQuitAttemptOptions = ['0', '1', '2', '3', '4+'];

  @override
  void initState() {
    super.initState();
    final state = ref.read(onboardingProvider);
    _costPerPackController.text =
        state.costPerPack?.toStringAsFixed(2) ?? '';
    _cigarettesPerPackController.text =
        (state.cigarettesPerPack ?? AppConstants.defaultCigarettesPerPack)
            .toString();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _costPerPackController.dispose();
    _cigarettesPerPackController.dispose();
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

  void _saveCurrentStepAndContinue() {
    final notifier = ref.read(onboardingProvider.notifier);
    // Save text field values
    final costText = _costPerPackController.text.trim();
    final packText = _cigarettesPerPackController.text.trim();
    if (costText.isNotEmpty) {
      notifier.setCostPerPack(double.tryParse(costText));
    }
    if (packText.isNotEmpty) {
      notifier.setCigarettesPerPack(int.tryParse(packText));
    }
    _goToPage(_currentPage + 1);
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
            _StepIndicator(currentStep: _currentPage, totalSteps: 3),

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
                  // Step 1: Baseline Habits
                  _buildStep1(notifier, state),
                  // Step 2: Triggers & Windows
                  _buildStep2(notifier, state),
                  // Step 3: History & Confidence
                  _buildStep3(notifier, state),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 1: Baseline Habits ────────────────────────────────────────────

  Widget _buildStep1(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Baseline Habits', style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 16),

        // CPD Slider
        _buildSliderField(
          label: 'Cigarettes per day',
          value: (state.cigarettesPerDay ?? 10).toDouble(),
          min: 1,
          max: 60,
          divisions: 59,
          displayValue: '${state.cigarettesPerDay ?? 10}',
          onChanged: (v) => notifier.setCigarettesPerDay(v.round()),
          onSkip: () => notifier.setCigarettesPerDay(null),
        ),
        const SizedBox(height: 24),

        // TTFC Dropdown
        _buildDropdownField(
          label: 'Time to first cigarette (TTFC)',
          value: state.ttfcMinutesIndex,
          items: _ttfcOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
          onChanged: (v) => notifier.setTtfcMinutesIndex(v),
          onSkip: () => notifier.setTtfcMinutesIndex(null),
        ),
        const SizedBox(height: 24),

        // Years smoking Slider
        _buildSliderField(
          label: 'Years smoking',
          value: (state.yearsSmoking ?? 5).toDouble(),
          min: 1,
          max: 50,
          divisions: 49,
          displayValue: '${state.yearsSmoking ?? 5}',
          onChanged: (v) => notifier.setYearsSmoking(v.round()),
          onSkip: () => notifier.setYearsSmoking(null),
        ),
        const SizedBox(height: 24),

        // Cost per pack
        _buildTextFieldWithSkip(
          label: 'Cost per pack',
          controller: _costPerPackController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          hint: '10.00',
          prefixIcon: Icons.attach_money,
          onSkip: () {
            _costPerPackController.clear();
            notifier.setCostPerPack(null);
          },
        ),
        const SizedBox(height: 16),

        // Cigarettes per pack
        _buildTextFieldWithSkip(
          label: 'Cigarettes per pack',
          controller: _cigarettesPerPackController,
          keyboardType: TextInputType.number,
          hint: '20',
          prefixIcon: Icons.inventory,
          onSkip: () {
            _cigarettesPerPackController.clear();
            notifier.setCigarettesPerPack(null);
          },
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: _saveCurrentStepAndContinue,
          child: const Text(AppStrings.next),
        ),
      ],
    );
  }

  // ── Step 2: Triggers & Windows ─────────────────────────────────────────

  Widget _buildStep2(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Triggers & Windows', style: Theme.of(context).textTheme.displaySmall),
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

        // Smoking windows
        _buildChipSection(
          label: 'Daily smoking windows',
          options: _smokingWindowOptions,
          selected: state.smokingWindows,
          onToggle: (window) => notifier.toggleSmokingWindow(window),
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

  // ── Step 3: History & Confidence ───────────────────────────────────────

  Widget _buildStep3(OnboardingNotifier notifier, OnboardingState state) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('History & Confidence', style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 16),

        // Previous quit attempts
        _buildDropdownField(
          label: 'Previous quit attempts',
          value: state.previousQuitAttempts,
          items: _previousQuitAttemptOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
          onChanged: (v) => notifier.setPreviousQuitAttempts(v),
          onSkip: () => notifier.setPreviousQuitAttempts(null),
        ),
        const SizedBox(height: 24),

        // Previous aids
        _buildChipSection(
          label: 'Previous aids used',
          options: _previousAidOptions,
          selected: state.previousAids,
          onToggle: (aid) => notifier.togglePreviousAid(aid),
        ),
        const SizedBox(height: 24),

        // Confidence slider with emoji feedback
        _buildConfidenceSlider(
          label: 'Confidence to quit',
          value: state.confidenceToQuit ?? 5,
          onChanged: (v) => notifier.setConfidenceToQuit(v),
          onSkip: () => notifier.setConfidenceToQuit(null),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const QuitDateScreen()),
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
            Text(label, style: Theme.of(context).textTheme.titleMedium),
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
          decoration: const InputDecoration(
            hintText: 'Select...',
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldWithSkip({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String hint,
    required IconData prefixIcon,
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
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(prefixIcon),
          ),
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
            Text(_confidenceEmoji(value),
                style: const TextStyle(fontSize: 32)),
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
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

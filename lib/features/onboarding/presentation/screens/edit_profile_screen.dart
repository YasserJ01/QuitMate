import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import '../../data/models/user_profile.dart';
import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import '../providers/profile_completeness_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// Sections that can be deep-linked from dashboard nudge cards.
enum ProfileSection {
  smokingCosts,
  smokingDetails,
  reductionDetails,
  valuesSection,
}

/// Post-onboarding profile editor.
/// Accessible from Settings → Edit Profile or from dashboard nudge cards.
/// On save, updates Isar profile and invalidates profileCompletenessProvider.
class EditProfileScreen extends ConsumerStatefulWidget {
  /// Optional section to scroll or focus to on open.
  final ProfileSection? section;

  const EditProfileScreen({super.key, this.section});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  UserProfile? _profile;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _error;

  // ── Smoking field controllers ─────────────────────────────────────────────
  final _cpd = TextEditingController();
  final _costPerPack = TextEditingController();
  final _cigPerPack = TextEditingController();
  int? _ttfcIndex;
  int? _yearsSmoking;
  final List<String> _smokingWindows = [];
  int? _previousQuitAttempts;
  final List<String> _previousAids = [];
  int? _confidenceToQuit;

  // ── Reduction field controllers ───────────────────────────────────────────
  int? _episodesPerWeek;
  int? _episodeDurationMinutes;
  int? _distressLevel;
  int? _sleepEffectIndex;
  int? _focusEffectIndex;
  int? _relationshipEffectIndex;
  int? _previousReductionAttempts;
  int? _confidenceToReduce;
  final List<String> _values = [];
  final List<String> _timeOfDayPatterns = [];

  static const _ttfcOptions = ['≤5 min', '6–30 min', '31–60 min', '>60 min'];
  static const _effectOptions = ['Not affected', 'Slightly', 'Moderately', 'Severely'];
  static const _aidOptions = ['NRT', 'Medication', 'App', 'Counseling', 'Cold turkey', 'Other'];
  static const _windowOptions = ['Morning', 'After meals', 'Social', 'Stress', 'Evening', 'Driving'];
  static const _timeOfDayOptions = ['Morning', 'Afternoon', 'Evening', 'Night', 'Bedtime'];
  static const _valueOptions = [
    'Focus', 'Sleep', 'Relationships', 'Spiritual goals',
    'Emotional regulation', 'Energy', 'Self-control',
  ];

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _cpd.dispose();
    _costPerPack.dispose();
    _cigPerPack.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) {
        setState(() { _error = 'No user found'; _isLoading = false; });
        return;
      }
      final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
      if (profile == null) {
        setState(() { _error = 'Profile not found'; _isLoading = false; });
        return;
      }

      setState(() {
        _profile = profile;
        _isLoading = false;

        // Pre-fill smoking fields
        _cpd.text = profile.cigarettesPerDay?.toString() ?? '';
        _costPerPack.text = profile.costPerPack?.toStringAsFixed(2) ?? '';
        _cigPerPack.text = profile.cigarettesPerPack?.toString() ?? '';
        _ttfcIndex = profile.ttfcMinutesIndex;
        _yearsSmoking = profile.yearsSmoking;
        _smokingWindows
          ..clear()
          ..addAll(profile.smokingWindows);
        _previousQuitAttempts = profile.previousQuitAttempts;
        _previousAids
          ..clear()
          ..addAll(profile.previousAids);
        _confidenceToQuit = profile.confidenceToQuit;

        // Pre-fill reduction fields
        _episodesPerWeek = profile.episodesPerWeek;
        _episodeDurationMinutes = profile.episodeDurationMinutes;
        _distressLevel = profile.distressLevel;
        _sleepEffectIndex = profile.sleepEffectIndex;
        _focusEffectIndex = profile.focusEffectIndex;
        _relationshipEffectIndex = profile.relationshipEffectIndex;
        _previousReductionAttempts = profile.previousReductionAttempts;
        _confidenceToReduce = profile.confidenceToReduce;
        _values
          ..clear()
          ..addAll(profile.values);
        _timeOfDayPatterns
          ..clear()
          ..addAll(profile.timeOfDayPatterns);
      });
    } catch (e) {
      setState(() { _error = 'Failed to load profile: $e'; _isLoading = false; });
    }
  }

  Future<void> _save() async {
    if (_profile == null) return;
    setState(() => _isSaving = true);

    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final p = _profile!;
      // Apply smoking fields
      p.cigarettesPerDay = int.tryParse(_cpd.text.trim());
      p.costPerPack = double.tryParse(_costPerPack.text.trim());
      p.cigarettesPerPack = int.tryParse(_cigPerPack.text.trim());
      p.ttfcMinutesIndex = _ttfcIndex;
      p.yearsSmoking = _yearsSmoking;
      p.smokingWindows = List.from(_smokingWindows);
      p.previousQuitAttempts = _previousQuitAttempts;
      p.previousAids = List.from(_previousAids);
      p.confidenceToQuit = _confidenceToQuit;

      // Apply reduction fields
      p.episodesPerWeek = _episodesPerWeek;
      p.episodeDurationMinutes = _episodeDurationMinutes;
      p.distressLevel = _distressLevel;
      p.sleepEffectIndex = _sleepEffectIndex;
      p.focusEffectIndex = _focusEffectIndex;
      p.relationshipEffectIndex = _relationshipEffectIndex;
      p.previousReductionAttempts = _previousReductionAttempts;
      p.confidenceToReduce = _confidenceToReduce;
      p.values = List.from(_values);
      p.timeOfDayPatterns = List.from(_timeOfDayPatterns);
      p.updatedAt = DateTime.now().toUtc();

      await ref.read(profileRepositoryProvider).updateProfile(userId, p);

      // Invalidate completeness provider so dashboard refreshes gate conditions
      ref.invalidate(profileCompletenessProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated ✓'),
            backgroundColor: AppTheme.successColor,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20, height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              ),
            )
          else
            TextButton(
              onPressed: _save,
              child: const Text('Save', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : _buildForm(),
    );
  }

  Widget _buildForm() {
    final profile = _profile!;
    final isSmokingMode = profile.goalType == GoalType.quitSmoking;

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // Personalization note
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.2)),
          ),
          child: Text(
            'Your answers help personalize your dashboard and recommendations. All data stays on your device.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 24),

        if (isSmokingMode) ..._buildSmokingFields()
        else ..._buildReductionFields(),
      ],
    );
  }

  List<Widget> _buildSmokingFields() => [
    _sectionHeader('🚬 Smoking Baseline'),
    const SizedBox(height: 16),
    _textField('Cigarettes per day', _cpd, TextInputType.number, hint: '10'),
    const SizedBox(height: 16),
    _textField('Cost per pack', _costPerPack, const TextInputType.numberWithOptions(decimal: true), hint: '10.00', prefix: '\$'),
    const SizedBox(height: 16),
    _textField('Cigarettes per pack', _cigPerPack, TextInputType.number, hint: '20'),
    const SizedBox(height: 24),
    _dropdownField<int>(
      label: 'Time to first cigarette (TTFC)',
      value: _ttfcIndex,
      items: _ttfcOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
      onChanged: (v) => setState(() => _ttfcIndex = v),
    ),
    const SizedBox(height: 24),
    _sliderField(
      label: 'Years smoking',
      value: (_yearsSmoking ?? 5).toDouble(),
      min: 1, max: 50, divisions: 49,
      displayValue: '${_yearsSmoking ?? 5}',
      onChanged: (v) => setState(() => _yearsSmoking = v.round()),
      onSkip: () => setState(() => _yearsSmoking = null),
    ),
    const SizedBox(height: 24),
    _chipSection('Daily smoking windows', _windowOptions, _smokingWindows),
    const SizedBox(height: 24),
    _chipSection('Previous aids used', _aidOptions, _previousAids),
    const SizedBox(height: 24),
    _confidenceSlider(
      label: 'Confidence to quit',
      value: _confidenceToQuit ?? 5,
      onChanged: (v) => setState(() => _confidenceToQuit = v),
      onSkip: () => setState(() => _confidenceToQuit = null),
    ),
    const SizedBox(height: 32),
  ];

  List<Widget> _buildReductionFields() => [
    _sectionHeader('🎯 Frequency & Patterns'),
    const SizedBox(height: 16),
    _sliderField(
      label: 'Episodes per week',
      value: (_episodesPerWeek ?? 7).toDouble(),
      min: 1, max: 21, divisions: 20,
      displayValue: '${_episodesPerWeek ?? 7}',
      onChanged: (v) => setState(() => _episodesPerWeek = v.round()),
      onSkip: () => setState(() => _episodesPerWeek = null),
    ),
    const SizedBox(height: 24),
    _sliderField(
      label: 'Average episode duration (min)',
      value: (_episodeDurationMinutes ?? 15).toDouble(),
      min: 1, max: 120, divisions: 119,
      displayValue: '${_episodeDurationMinutes ?? 15} min',
      onChanged: (v) => setState(() => _episodeDurationMinutes = v.round()),
      onSkip: () => setState(() => _episodeDurationMinutes = null),
    ),
    const SizedBox(height: 24),
    _chipSection('Time-of-day patterns', _timeOfDayOptions, _timeOfDayPatterns),
    const SizedBox(height: 24),
    _sectionHeader('📊 Impact'),
    const SizedBox(height: 16),
    _sliderField(
      label: 'Distress level (1–10)',
      value: (_distressLevel ?? 5).toDouble(),
      min: 1, max: 10, divisions: 9,
      displayValue: '${_distressLevel ?? 5}/10',
      onChanged: (v) => setState(() => _distressLevel = v.round()),
      onSkip: () => setState(() => _distressLevel = null),
    ),
    const SizedBox(height: 24),
    _dropdownField<int>(
      label: 'Effect on sleep',
      value: _sleepEffectIndex,
      items: _effectOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
      onChanged: (v) => setState(() => _sleepEffectIndex = v),
    ),
    const SizedBox(height: 16),
    _dropdownField<int>(
      label: 'Effect on focus',
      value: _focusEffectIndex,
      items: _effectOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
      onChanged: (v) => setState(() => _focusEffectIndex = v),
    ),
    const SizedBox(height: 16),
    _dropdownField<int>(
      label: 'Effect on relationships',
      value: _relationshipEffectIndex,
      items: _effectOptions.asMap().entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
      onChanged: (v) => setState(() => _relationshipEffectIndex = v),
    ),
    const SizedBox(height: 24),
    _confidenceSlider(
      label: 'Confidence to reduce',
      value: _confidenceToReduce ?? 5,
      onChanged: (v) => setState(() => _confidenceToReduce = v),
      onSkip: () => setState(() => _confidenceToReduce = null),
    ),
    const SizedBox(height: 24),
    _sectionHeader('💡 Your Values'),
    const SizedBox(height: 8),
    Text(
      'Values shown on your dashboard as a motivation anchor.',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
    ),
    const SizedBox(height: 12),
    _chipSection('What matters most to you?', _valueOptions, _values),
    const SizedBox(height: 32),
  ];

  // ── Reusable builders ───────────────────────────────────────────────────

  Widget _sectionHeader(String title) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600));
  }

  Widget _textField(String label, TextEditingController controller, TextInputType keyboardType, {String? hint, String? prefix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixText: prefix,
          ),
        ),
      ],
    );
  }

  Widget _dropdownField<T>({
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items,
          onChanged: onChanged,
          decoration: const InputDecoration(hintText: 'Select...'),
        ),
      ],
    );
  }

  Widget _sliderField({
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
            TextButton(onPressed: onSkip, child: const Text('Skip')),
          ],
        ),
        Text(displayValue, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
        Slider(value: value, min: min, max: max, divisions: divisions, onChanged: onChanged),
      ],
    );
  }

  Widget _chipSection(String label, List<String> options, List<String> selected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((opt) {
            final isSelected = selected.contains(opt);
            return FilterChip(
              label: Text(opt),
              selected: isSelected,
              onSelected: (_) => setState(() {
                if (isSelected) {
                  selected.remove(opt);
                } else {
                  selected.add(opt);
                }
              }),
              selectedColor: AppTheme.primaryColor.withValues(alpha: 0.2),
              checkmarkColor: AppTheme.primaryColor,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _confidenceSlider({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
    required VoidCallback onSkip,
  }) {
    final emoji = value <= 2 ? '😟' : value <= 4 ? '😐' : value <= 6 ? '🙂' : value <= 8 ? '😊' : '💪';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            TextButton(onPressed: onSkip, child: const Text('Skip')),
          ],
        ),
        Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: Slider(
                value: value.toDouble(),
                min: 1, max: 10, divisions: 9,
                label: '$value',
                onChanged: (v) => onChanged(v.round()),
              ),
            ),
            Text('$value/10', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ],
    );
  }
}

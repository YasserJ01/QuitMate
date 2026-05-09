import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';
import 'package:quitmate/core/widgets/common_widgets.dart';

import '../providers/onboarding_provider.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../../../tracking/presentation/screens/dashboard_screen.dart';

/// Goal setting screen for reduction mode (FR-M08).
/// Offers: full abstinence goal OR frequency reduction target.
class GoalSettingScreen extends ConsumerStatefulWidget {
  const GoalSettingScreen({super.key});

  @override
  ConsumerState<GoalSettingScreen> createState() => _GoalSettingScreenState();
}

class _GoalSettingScreenState extends ConsumerState<GoalSettingScreen> {
  bool _isAbstinenceGoal = true;
  final _frequencyTargetController = TextEditingController(text: '3');
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _isAbstinenceGoal = ref.read(onboardingProvider).isAbstinenceGoal;
    _selectedDate = ref.read(onboardingProvider).quitDate;
  }

  @override
  void dispose() {
    _frequencyTargetController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppTheme.primaryColor),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
      ref.read(onboardingProvider.notifier).setQuitDate(picked);
    }
  }

  Future<void> _completeOnboarding() async {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a start date'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    final notifier = ref.read(onboardingProvider.notifier);
    notifier.setAbstinenceGoal(_isAbstinenceGoal);

    if (!_isAbstinenceGoal) {
      final target = int.tryParse(_frequencyTargetController.text);
      if (target != null && target >= 0) {
        notifier.setFrequencyTarget(target);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid target frequency'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
        return;
      }
    }

    final success = await notifier.completeOnboarding();

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ref.read(onboardingProvider).error ?? 'Failed to complete setup'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    _scheduleFirstNotifications();

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
        (route) => false,
      );
    }
  }

  Future<void> _scheduleFirstNotifications() async {
    try {
      final userId = ref.read(onboardingProvider).userId;
      final manager = await ref.read(notificationManagerProvider.future);
      final granted = await manager.requestPermissions();
      if (!granted) return;
      await manager.scheduleAll(userId);
      await manager.schedulePreventive(userId);
    } catch (e) {
      debugPrint('First-run notification scheduling failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        message: 'Setting up your journey…',
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                Text('Set Your Goal',
                    style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 8),
                Text(
                  'Choose the type of goal that works best for you.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),
                const SizedBox(height: 32),

                // Goal type selection
                RadioGroup<bool>(
                  groupValue: _isAbstinenceGoal,
                  onChanged: (v) {
                    if (v != null) setState(() => _isAbstinenceGoal = v);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        RadioListTile<bool>(
                          title: const Text('Full abstinence'),
                          subtitle: const Text(
                              'Stop completely and count every day clean'),
                          value: true,
                        ),
                        const Divider(height: 1),
                        RadioListTile<bool>(
                          title: const Text('Frequency target'),
                          subtitle: const Text(
                              'Reduce to a specific number per week'),
                          value: false,
                        ),
                      ],
                    ),
                  ),
                ),

                // Frequency target input
                if (!_isAbstinenceGoal) ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _frequencyTargetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Target episodes per week',
                      hintText: '3',
                      suffixText: 'per week',
                      prefixIcon: Icon(Icons.track_changes),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Current baseline: ${state.episodesPerWeek ?? '?'} per week',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                  ),
                ],

                const SizedBox(height: 32),

                // Start date
                Text('Start Date',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: _selectDate,
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    _selectedDate != null
                        ? '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}'
                        : 'Choose start date',
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),

                const SizedBox(height: 32),

                GradientButton(
                  text: AppStrings.finish,
                  onPressed:
                      _selectedDate != null ? _completeOnboarding : null,
                  icon: Icons.check,
                  isLoading: state.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

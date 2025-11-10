import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import 'quit_date_screen.dart';

class BaselineScreen extends ConsumerStatefulWidget {
  const BaselineScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BaselineScreen> createState() => _BaselineScreenState();
}

class _BaselineScreenState extends ConsumerState<BaselineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cigarettesController = TextEditingController();
  final _costPerPackController = TextEditingController();
  final _cigarettesPerPackController = TextEditingController();
  final _episodesController = TextEditingController();

  final List<TriggerType> _commonTriggers = [
    TriggerType.stress,
    TriggerType.boredom,
    TriggerType.social,
    TriggerType.loneliness,
    TriggerType.anxiety,
    TriggerType.afterMeal,
  ];

  @override
  void initState() {
    super.initState();
    final state = ref.read(onboardingProvider);

    // Pre-fill with default or existing values
    _cigarettesController.text = (state.cigarettesPerDay ??
        AppConstants.defaultCigarettesPerDay).toString();
    _costPerPackController.text = (state.costPerPack ??
        AppConstants.defaultCostPerPack).toString();
    _cigarettesPerPackController.text = (state.cigarettesPerPack ??
        AppConstants.defaultCigarettesPerPack).toString();
    _episodesController.text = (state.episodesPerWeek ??
        AppConstants.defaultEpisodesPerWeek).toString();
  }

  @override
  void dispose() {
    _cigarettesController.dispose();
    _costPerPackController.dispose();
    _cigarettesPerPackController.dispose();
    _episodesController.dispose();
    super.dispose();
  }

  bool _shouldShowSmokingFields() {
    final goalType = ref.watch(onboardingProvider).goalType;
    return goalType == GoalType.quitSmoking || goalType == GoalType.both;
  }

  bool _shouldShowMasturbationFields() {
    final goalType = ref.watch(onboardingProvider).goalType;
    return goalType == GoalType.reduceMasturbation || goalType == GoalType.both;
  }

  void _saveAndContinue() {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(onboardingProvider.notifier);

      if (_shouldShowSmokingFields()) {
        notifier.setCigarettesPerDay(int.parse(_cigarettesController.text));
        notifier.setCostPerPack(double.parse(_costPerPackController.text));
        notifier.setCigarettesPerPack(int.parse(_cigarettesPerPackController.text));
      }

      if (_shouldShowMasturbationFields()) {
        notifier.setEpisodesPerWeek(int.parse(_episodesController.text));
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const QuitDateScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              // Title
              Text(
                AppStrings.baselineTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.baselineSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              // Smoking Fields
              if (_shouldShowSmokingFields()) ...[
                _buildSectionTitle('🚬 Smoking Habits'),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _cigarettesController,
                  decoration: const InputDecoration(
                    labelText: 'Cigarettes per day',
                    hintText: 'e.g., 10',
                    prefixIcon: Icon(Icons.smoking_rooms),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    final number = int.tryParse(value);
                    if (number == null || number < 1 || number > AppConstants.maxCigarettesPerDay) {
                      return 'Enter a valid number (1-${AppConstants.maxCigarettesPerDay})';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _costPerPackController,
                        decoration: const InputDecoration(
                          labelText: 'Cost per pack',
                          hintText: '10.00',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter cost';
                          }
                          final number = double.tryParse(value);
                          if (number == null || number <= 0) {
                            return 'Enter a valid amount';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _cigarettesPerPackController,
                        decoration: const InputDecoration(
                          labelText: 'Per pack',
                          hintText: '20',
                          prefixIcon: Icon(Icons.inventory),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          final number = int.tryParse(value);
                          if (number == null || number < 1) {
                            return 'Invalid';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],

              // Masturbation Fields
              if (_shouldShowMasturbationFields()) ...[
                _buildSectionTitle('🎯 Current Habits'),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _episodesController,
                  decoration: const InputDecoration(
                    labelText: 'Episodes per week',
                    hintText: 'e.g., 7',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    final number = int.tryParse(value);
                    if (number == null || number < 1 || number > AppConstants.maxEpisodesPerWeek) {
                      return 'Enter a valid number (1-${AppConstants.maxEpisodesPerWeek})';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
              ],

              // Triggers Section
              _buildSectionTitle('⚡ Common Triggers'),
              const SizedBox(height: 8),
              Text(
                'Select situations that trigger your habits',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _commonTriggers.map((trigger) {
                  final isSelected = onboardingState.triggers.contains(trigger);
                  return FilterChip(
                    label: Text(trigger.displayName),
                    selected: isSelected,
                    onSelected: (_) {
                      ref.read(onboardingProvider.notifier).toggleTrigger(trigger);
                    },
                    selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                    checkmarkColor: AppTheme.primaryColor,
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveAndContinue,
                  child: const Text(AppStrings.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/constants/app_constants.dart';
import 'package:quitmate/core/theme/app_theme.dart';

import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/goal_card.dart';
import 'smoking_profile_form_screen.dart';
import 'reduction_profile_form_screen.dart';

class GoalSelectionScreen extends ConsumerStatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  ConsumerState<GoalSelectionScreen> createState() =>
      _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends ConsumerState<GoalSelectionScreen> {
  GoalType? _expandedGoal;

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                AppStrings.selectGoalTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.selectGoalSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
              ),
              const SizedBox(height: 8),

              // Personalization explanation line (US-ON03, BR-03)
              Text(
                'Your answers help personalize your dashboard and recommendations. All data stays on your device.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 24),

              // Goal Cards — exactly 2 options, no pre-selection (BR-01, US-ON01)
              Expanded(
                child: ListView(
                  children: [
                    GoalCard(
                      goalType: GoalType.quitSmoking,
                      isSelected:
                          onboardingState.goalType == GoalType.quitSmoking,
                      isExpanded: _expandedGoal == GoalType.quitSmoking,
                      onTap: () {
                        // First tap expands description; second tap confirms
                        if (_expandedGoal != GoalType.quitSmoking) {
                          setState(() => _expandedGoal = GoalType.quitSmoking);
                        }
                        ref
                            .read(onboardingProvider.notifier)
                            .setGoalType(GoalType.quitSmoking);
                      },
                    ),
                    const SizedBox(height: 16),
                    GoalCard(
                      goalType: GoalType.reduceMasturbation,
                      isSelected: onboardingState.goalType ==
                          GoalType.reduceMasturbation,
                      isExpanded:
                          _expandedGoal == GoalType.reduceMasturbation,
                      onTap: () {
                        if (_expandedGoal != GoalType.reduceMasturbation) {
                          setState(() =>
                              _expandedGoal = GoalType.reduceMasturbation);
                        }
                        ref
                            .read(onboardingProvider.notifier)
                            .setGoalType(GoalType.reduceMasturbation);
                      },
                    ),
                  ],
                ),
              ),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onboardingState.goalType != null
                      ? () {
                          final goal = onboardingState.goalType!;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => goal ==
                                      GoalType.quitSmoking
                                  ? const SmokingProfileFormScreen()
                                  : const ReductionProfileFormScreen(),
                            ),
                          );
                        }
                      : null,
                  child: const Text(AppStrings.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

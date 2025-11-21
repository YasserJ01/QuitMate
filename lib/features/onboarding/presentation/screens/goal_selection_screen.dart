import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../domain/entities/goal_type.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/goal_card.dart';
import 'baseline_screen.dart';

class GoalSelectionScreen extends ConsumerWidget {
  const GoalSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(height: 32),

              // Goal Cards
              Expanded(
                child: ListView(
                  children: [
                    GoalCard(
                      goalType: GoalType.quitSmoking,
                      isSelected:
                          onboardingState.goalType == GoalType.quitSmoking,
                      onTap: () {
                        ref.read(onboardingProvider.notifier).setGoalType(
                              GoalType.quitSmoking,
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    GoalCard(
                      goalType: GoalType.reduceMasturbation,
                      isSelected: onboardingState.goalType ==
                          GoalType.reduceMasturbation,
                      onTap: () {
                        ref.read(onboardingProvider.notifier).setGoalType(
                              GoalType.reduceMasturbation,
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    GoalCard(
                      goalType: GoalType.both,
                      isSelected: onboardingState.goalType == GoalType.both,
                      onTap: () {
                        ref.read(onboardingProvider.notifier).setGoalType(
                              GoalType.both,
                            );
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const BaselineScreen(),
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

import 'package:flutter/material.dart';
import '../../data/models/toolkit_models.dart';
import 'urge_surfing_steps.dart';
import 'thought_challenge_steps.dart';
import 'consequence_analysis_steps.dart';
import 'delay_tactic_steps.dart';
import 'alternative_behavior_steps.dart';

class CbtTechniqueContent extends StatelessWidget {
  final CbtTechnique technique;
  final int currentStep;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final Function(Map<String, dynamic>) onComplete;

  const CbtTechniqueContent({
    Key? key,
    required this.technique,
    required this.currentStep,
    required this.pageController,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (technique) {
      case CbtTechnique.urgeSurfing:
        return UrgeSurfingSteps(
          currentStep: currentStep,
          pageController: pageController,
          onNext: onNext,
          onPrevious: onPrevious,
          onComplete: onComplete,
        );
      case CbtTechnique.thoughtChallenge:
        return ThoughtChallengeSteps(
          currentStep: currentStep,
          pageController: pageController,
          onNext: onNext,
          onPrevious: onPrevious,
          onComplete: onComplete,
        );
      case CbtTechnique.consequenceAnalysis:
        return ConsequenceAnalysisSteps(
          currentStep: currentStep,
          pageController: pageController,
          onNext: onNext,
          onPrevious: onPrevious,
          onComplete: onComplete,
        );
      case CbtTechnique.delayTactic:
        return DelayTacticSteps(
          currentStep: currentStep,
          pageController: pageController,
          onNext: onNext,
          onPrevious: onPrevious,
          onComplete: onComplete,
        );
      case CbtTechnique.alternativeBehavior:
        return AlternativeBehaviorSteps(
          currentStep: currentStep,
          pageController: pageController,
          onNext: onNext,
          onPrevious: onPrevious,
          onComplete: onComplete,
        );
    }
  }
}
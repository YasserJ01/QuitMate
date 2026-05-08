enum GoalType {
  quitSmoking,
  reduceMasturbation;

  String get displayName {
    switch (this) {
      case GoalType.quitSmoking:
        return 'Quit Smoking';
      case GoalType.reduceMasturbation:
        return 'My Focus Journey';
    }
  }

  String get emoji {
    switch (this) {
      case GoalType.quitSmoking:
        return '🚭';
      case GoalType.reduceMasturbation:
        return '🎯';
    }
  }

  String get shortDescription {
    switch (this) {
      case GoalType.quitSmoking:
        return 'Break free from nicotine addiction and improve your health';
      case GoalType.reduceMasturbation:
        return 'Build healthier habits and improve self-control';
    }
  }

  String get extendedDescription {
    switch (this) {
      case GoalType.quitSmoking:
        return 'Track cigarettes, cravings, and money saved. '
            'Get personalized health milestones and craving support.';
      case GoalType.reduceMasturbation:
        return 'Track urges, build resilience, and reconnect with your values. '
            'Get distress trends and a personalized values anchor.';
    }
  }
}

enum TriggerType {
  stress,
  boredom,
  social,
  alcohol,
  afterMeal,
  morning,
  evening,
  loneliness,
  anxiety,
  other;

  String get displayName {
    switch (this) {
      case TriggerType.stress:
        return 'Stress';
      case TriggerType.boredom:
        return 'Boredom';
      case TriggerType.social:
        return 'Social Situations';
      case TriggerType.alcohol:
        return 'Alcohol';
      case TriggerType.afterMeal:
        return 'After Meals';
      case TriggerType.morning:
        return 'Morning';
      case TriggerType.evening:
        return 'Evening';
      case TriggerType.loneliness:
        return 'Loneliness';
      case TriggerType.anxiety:
        return 'Anxiety';
      case TriggerType.other:
        return 'Other';
    }
  }
}

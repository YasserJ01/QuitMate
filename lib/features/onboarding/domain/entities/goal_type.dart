enum GoalType {
  quitSmoking,
  reduceMasturbation,
  both;

  String get displayName {
    switch (this) {
      case GoalType.quitSmoking:
        return 'Quit Smoking';
      case GoalType.reduceMasturbation:
        return 'Reduce Masturbation';
      case GoalType.both:
        return 'Both Goals';
    }
  }

  String get emoji {
    switch (this) {
      case GoalType.quitSmoking:
        return '🚭';
      case GoalType.reduceMasturbation:
        return '🎯';
      case GoalType.both:
        return '💪';
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
import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';

void main() {
  group('GoalType', () {
    test('should have correct display names', () {
      expect(GoalType.quitSmoking.displayName, 'Quit Smoking');
      expect(GoalType.reduceMasturbation.displayName, 'Reduce Masturbation');
      expect(GoalType.both.displayName, 'Both Goals');
    });

    test('should have correct emojis', () {
      expect(GoalType.quitSmoking.emoji, '🚭');
      expect(GoalType.reduceMasturbation.emoji, '🎯');
      expect(GoalType.both.emoji, '💪');
    });

    test('should contain all expected values', () {
      expect(GoalType.values.length, 3);
      expect(GoalType.values, contains(GoalType.quitSmoking));
      expect(GoalType.values, contains(GoalType.reduceMasturbation));
      expect(GoalType.values, contains(GoalType.both));
    });
  });

  group('TriggerType', () {
    test('should have correct display names', () {
      expect(TriggerType.stress.displayName, 'Stress');
      expect(TriggerType.boredom.displayName, 'Boredom');
      expect(TriggerType.social.displayName, 'Social Situations');
      expect(TriggerType.alcohol.displayName, 'Alcohol');
      expect(TriggerType.afterMeal.displayName, 'After Meals');
      expect(TriggerType.morning.displayName, 'Morning');
      expect(TriggerType.evening.displayName, 'Evening');
      expect(TriggerType.loneliness.displayName, 'Loneliness');
      expect(TriggerType.anxiety.displayName, 'Anxiety');
      expect(TriggerType.other.displayName, 'Other');
    });

    test('should contain all expected values', () {
      expect(TriggerType.values.length, 10);
    });
  });
}
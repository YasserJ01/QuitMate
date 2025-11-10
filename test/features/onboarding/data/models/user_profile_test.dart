import 'package:flutter_test/flutter_test.dart';
import 'package:quitmate/features/onboarding/data/models/user_profile.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';

void main() {
  group('UserProfile', () {
    late UserProfile profile;

    setUp(() {
      profile = UserProfile()
        ..userId = 'test-user-123'
        ..nickname = 'TestUser'
        ..goalType = GoalType.quitSmoking
        ..cigarettesPerDay = 10
        ..costPerPack = 12.0
        ..cigarettesPerPack = 20
        ..triggers = [TriggerType.stress, TriggerType.boredom]
        ..quitDate = DateTime(2025, 12, 31);
    });

    test('should create profile with required fields', () {
      expect(profile.userId, 'test-user-123');
      expect(profile.goalType, GoalType.quitSmoking);
      expect(profile.createdAt, isNotNull);
    });

    test('should calculate daily smoking cost correctly', () {
      // (12.0 / 20) * 10 = 6.0
      expect(profile.dailySmokingCost, 6.0);
    });

    test('should return null for daily smoking cost if data is incomplete', () {
      profile.costPerPack = null;
      expect(profile.dailySmokingCost, isNull);

      profile.costPerPack = 12.0;
      profile.cigarettesPerPack = null;
      expect(profile.dailySmokingCost, isNull);

      profile.cigarettesPerPack = 20;
      profile.cigarettesPerDay = null;
      expect(profile.dailySmokingCost, isNull);
    });

    test('should calculate days until quit correctly', () {
      final futureDate = DateTime.now().add(const Duration(days: 10));
      profile.quitDate = futureDate;

      expect(profile.daysUntilQuit, closeTo(10, 1));
    });

    test('should return null for days until quit if date is not set', () {
      profile.quitDate = null;
      expect(profile.daysUntilQuit, isNull);
    });

    test('should correctly identify if quit date has passed', () {
      profile.quitDate = DateTime.now().subtract(const Duration(days: 1));
      expect(profile.hasQuitDatePassed, isTrue);

      profile.quitDate = DateTime.now().add(const Duration(days: 1));
      expect(profile.hasQuitDatePassed, isFalse);
    });

    test('should return false for hasQuitDatePassed if date is not set', () {
      profile.quitDate = null;
      expect(profile.hasQuitDatePassed, isFalse);
    });

    test('should store multiple triggers', () {
      expect(profile.triggers.length, 2);
      expect(profile.triggers, contains(TriggerType.stress));
      expect(profile.triggers, contains(TriggerType.boredom));
    });

    test('should handle empty triggers list', () {
      profile.triggers = [];
      expect(profile.triggers, isEmpty);
    });

    test('should set updatedAt timestamp', () {
      expect(profile.updatedAt, isNull);
      profile.updatedAt = DateTime.now();
      expect(profile.updatedAt, isNotNull);
    });
  });

  group('UserProfile - Different Goal Types', () {
    test('should handle quit smoking goal', () {
      final profile = UserProfile()
        ..userId = 'user-1'
        ..goalType = GoalType.quitSmoking
        ..cigarettesPerDay = 15
        ..costPerPack = 10.0
        ..cigarettesPerPack = 20;

      expect(profile.goalType, GoalType.quitSmoking);
      expect(profile.dailySmokingCost, 7.5);
      expect(profile.episodesPerWeek, isNull);
    });

    test('should handle reduce masturbation goal', () {
      final profile = UserProfile()
        ..userId = 'user-2'
        ..goalType = GoalType.reduceMasturbation
        ..episodesPerWeek = 7;

      expect(profile.goalType, GoalType.reduceMasturbation);
      expect(profile.episodesPerWeek, 7);
      expect(profile.cigarettesPerDay, isNull);
      expect(profile.dailySmokingCost, isNull);
    });

    test('should handle both goals', () {
      final profile = UserProfile()
        ..userId = 'user-3'
        ..goalType = GoalType.both
        ..cigarettesPerDay = 20
        ..costPerPack = 15.0
        ..cigarettesPerPack = 20
        ..episodesPerWeek = 5;

      expect(profile.goalType, GoalType.both);
      expect(profile.cigarettesPerDay, 20);
      expect(profile.episodesPerWeek, 5);
      expect(profile.dailySmokingCost, 15.0);
    });
  });
}
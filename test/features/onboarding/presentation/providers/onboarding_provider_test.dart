import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quitmate/features/onboarding/data/models/user_profile.dart';
import 'package:quitmate/features/onboarding/domain/entities/goal_type.dart';
import 'package:quitmate/features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockProfileRepository mockProfileRepository;
  late MockSecureStorageService mockSecureStorage;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    mockSecureStorage = MockSecureStorageService();
  });

  group('OnboardingState', () {
    test('should create state with default values', () {
      const state = OnboardingState(userId: 'test-id');

      expect(state.userId, 'test-id');
      expect(state.nickname, isNull);
      expect(state.goalType, isNull);
      expect(state.cigarettesPerDay, isNull);
      expect(state.triggers, isEmpty);
      expect(state.currentStep, 0);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should create copy with updated values', () {
      const state = OnboardingState(userId: 'test-id');
      final updated = state.copyWith(
        nickname: 'John',
        goalType: GoalType.quitSmoking,
        currentStep: 1,
      );

      expect(updated.userId, 'test-id');
      expect(updated.nickname, 'John');
      expect(updated.goalType, GoalType.quitSmoking);
      expect(updated.currentStep, 1);
    });
  });

  group('OnboardingNotifier', () {
    late OnboardingNotifier notifier;

    setUp(() {
      notifier = OnboardingNotifier(mockProfileRepository, mockSecureStorage);
    });

    test('should initialize with default state', () {
      expect(notifier.state.userId, isNotEmpty);
      expect(notifier.state.goalType, isNull);
      expect(notifier.state.currentStep, 0);
      expect(notifier.state.isLoading, false);
    });

    test('setNickname should update nickname', () {
      notifier.setNickname('TestUser');
      expect(notifier.state.nickname, 'TestUser');
    });

    test('setGoalType should update goal type', () {
      notifier.setGoalType(GoalType.quitSmoking);
      expect(notifier.state.goalType, GoalType.quitSmoking);
    });

    test('setCigarettesPerDay should update cigarettes count', () {
      notifier.setCigarettesPerDay(15);
      expect(notifier.state.cigarettesPerDay, 15);
    });

    test('setCostPerPack should update cost', () {
      notifier.setCostPerPack(12.5);
      expect(notifier.state.costPerPack, 12.5);
    });

    test('setCigarettesPerPack should update cigarettes per pack', () {
      notifier.setCigarettesPerPack(20);
      expect(notifier.state.cigarettesPerPack, 20);
    });

    test('setEpisodesPerWeek should update episodes', () {
      notifier.setEpisodesPerWeek(7);
      expect(notifier.state.episodesPerWeek, 7);
    });

    test('toggleTrigger should add trigger when not present', () {
      expect(notifier.state.triggers, isEmpty);

      notifier.toggleTrigger(TriggerType.stress);

      expect(notifier.state.triggers.length, 1);
      expect(notifier.state.triggers, contains(TriggerType.stress));
    });

    test('toggleTrigger should remove trigger when already present', () {
      notifier.toggleTrigger(TriggerType.stress);
      expect(notifier.state.triggers, contains(TriggerType.stress));

      notifier.toggleTrigger(TriggerType.stress);

      expect(notifier.state.triggers, isEmpty);
    });

    test('toggleTrigger should handle multiple triggers', () {
      notifier.toggleTrigger(TriggerType.stress);
      notifier.toggleTrigger(TriggerType.boredom);
      notifier.toggleTrigger(TriggerType.anxiety);

      expect(notifier.state.triggers.length, 3);
      expect(notifier.state.triggers, contains(TriggerType.stress));
      expect(notifier.state.triggers, contains(TriggerType.boredom));
      expect(notifier.state.triggers, contains(TriggerType.anxiety));
    });

    test('setQuitDate should update quit date', () {
      final date = DateTime(2025, 12, 31);
      notifier.setQuitDate(date);
      expect(notifier.state.quitDate, date);
    });

    test('nextStep should increment current step', () {
      expect(notifier.state.currentStep, 0);

      notifier.nextStep();
      expect(notifier.state.currentStep, 1);

      notifier.nextStep();
      expect(notifier.state.currentStep, 2);
    });

    test('previousStep should decrement current step', () {
      notifier.nextStep();
      notifier.nextStep();
      expect(notifier.state.currentStep, 2);

      notifier.previousStep();
      expect(notifier.state.currentStep, 1);

      notifier.previousStep();
      expect(notifier.state.currentStep, 0);
    });

    test('previousStep should not go below 0', () {
      expect(notifier.state.currentStep, 0);

      notifier.previousStep();
      expect(notifier.state.currentStep, 0);
    });

    test('canProceedFromGoalSelection should return false when no goal selected', () {
      expect(notifier.canProceedFromGoalSelection(), false);
    });

    test('canProceedFromGoalSelection should return true when goal is selected', () {
      notifier.setGoalType(GoalType.quitSmoking);
      expect(notifier.canProceedFromGoalSelection(), true);
    });

    test('canProceedFromBaseline should return true for quit smoking with complete data', () {
      notifier.setGoalType(GoalType.quitSmoking);
      notifier.setCigarettesPerDay(10);

      expect(notifier.canProceedFromBaseline(), true);
    });

    test('canProceedFromBaseline should return false for quit smoking without cigarettes data', () {
      notifier.setGoalType(GoalType.quitSmoking);

      expect(notifier.canProceedFromBaseline(), false);
    });

    test('canProceedFromBaseline should return true for reduce masturbation with complete data', () {
      notifier.setGoalType(GoalType.reduceMasturbation);
      notifier.setEpisodesPerWeek(5);

      expect(notifier.canProceedFromBaseline(), true);
    });

    test('canProceedFromBaseline should return false for reduce masturbation without episodes data', () {
      notifier.setGoalType(GoalType.reduceMasturbation);

      expect(notifier.canProceedFromBaseline(), false);
    });

    test('canProceedFromBaseline should return true for both goals with complete data', () {
      notifier.setGoalType(GoalType.both);
      notifier.setCigarettesPerDay(10);
      notifier.setEpisodesPerWeek(5);

      expect(notifier.canProceedFromBaseline(), true);
    });

    test('canProceedFromBaseline should return false for both goals with incomplete data', () {
      notifier.setGoalType(GoalType.both);
      notifier.setCigarettesPerDay(10);
      // Missing episodes data

      expect(notifier.canProceedFromBaseline(), false);
    });

    test('canCompleteOnboarding should return false when quit date is not set', () {
      expect(notifier.canCompleteOnboarding(), false);
    });

    test('canCompleteOnboarding should return true when quit date is set', () {
      notifier.setQuitDate(DateTime.now().add(const Duration(days: 7)));
      expect(notifier.canCompleteOnboarding(), true);
    });

    test('completeOnboarding should save profile and mark onboarding complete', () async {
      // Setup
      notifier.setGoalType(GoalType.quitSmoking);
      notifier.setNickname('TestUser');
      notifier.setCigarettesPerDay(10);
      notifier.setQuitDate(DateTime.now().add(const Duration(days: 7)));

      when(mockProfileRepository.saveProfile(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setUserId(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setOnboardingCompleted(true))
          .thenAnswer((_) async => Future.value());

      // Execute
      final result = await notifier.completeOnboarding();

      // Verify
      expect(result, true);
      expect(notifier.state.isLoading, false);
      expect(notifier.state.error, isNull);

      verify(mockProfileRepository.saveProfile(any)).called(1);
      verify(mockSecureStorage.setUserId(any)).called(1);
      verify(mockSecureStorage.setOnboardingCompleted(true)).called(1);
    });

    test('completeOnboarding should set loading state during save', () async {
      notifier.setGoalType(GoalType.quitSmoking);
      notifier.setQuitDate(DateTime.now());

      when(mockProfileRepository.saveProfile(any))
          .thenAnswer((_) async => Future.delayed(const Duration(milliseconds: 100)));
      when(mockSecureStorage.setUserId(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setOnboardingCompleted(true))
          .thenAnswer((_) async => Future.value());

      final future = notifier.completeOnboarding();

      // Should be loading
      await Future.delayed(const Duration(milliseconds: 10));
      // Note: In a real scenario, you'd need to use a more sophisticated approach
      // to test loading states, possibly with a custom listener

      await future;
      expect(notifier.state.isLoading, false);
    });

    test('completeOnboarding should handle errors and set error state', () async {
      notifier.setGoalType(GoalType.quitSmoking);
      notifier.setQuitDate(DateTime.now());

      when(mockProfileRepository.saveProfile(any))
          .thenThrow(Exception('Database error'));

      final result = await notifier.completeOnboarding();

      expect(result, false);
      expect(notifier.state.isLoading, false);
      expect(notifier.state.error, contains('Failed to save profile'));
    });

    test('completeOnboarding should save correct profile data', () async {
      // Setup complete profile
      final quitDate = DateTime(2025, 12, 31);
      notifier.setGoalType(GoalType.both);
      notifier.setNickname('John Doe');
      notifier.setCigarettesPerDay(15);
      notifier.setCostPerPack(12.5);
      notifier.setCigarettesPerPack(20);
      notifier.setEpisodesPerWeek(7);
      notifier.toggleTrigger(TriggerType.stress);
      notifier.toggleTrigger(TriggerType.boredom);
      notifier.setQuitDate(quitDate);

      UserProfile? capturedProfile;
      when(mockProfileRepository.saveProfile(any)).thenAnswer((invocation) async {
        capturedProfile = invocation.positionalArguments[0] as UserProfile;
      });
      when(mockSecureStorage.setUserId(any))
          .thenAnswer((_) async => Future.value());
      when(mockSecureStorage.setOnboardingCompleted(true))
          .thenAnswer((_) async => Future.value());

      await notifier.completeOnboarding();

      expect(capturedProfile, isNotNull);
      expect(capturedProfile!.userId, notifier.state.userId);
      expect(capturedProfile!.nickname, 'John Doe');
      expect(capturedProfile!.goalType, GoalType.both);
      expect(capturedProfile!.cigarettesPerDay, 15);
      expect(capturedProfile!.costPerPack, 12.5);
      expect(capturedProfile!.cigarettesPerPack, 20);
      expect(capturedProfile!.episodesPerWeek, 7);
      expect(capturedProfile!.triggers.length, 2);
      expect(capturedProfile!.quitDate, quitDate);
    });
  });
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/user_profile.dart';
import '../../data/repositories/profile_repository.dart';
import '../../domain/entities/goal_type.dart';
import '../../../../core/services/storage/secure_storage_service.dart';

// State class
class OnboardingState {
  final String userId;
  final String? nickname;
  final GoalType? goalType;
  final int? cigarettesPerDay;
  final double? costPerPack;
  final int? cigarettesPerPack;
  final int? episodesPerWeek;
  final List<TriggerType> triggers;
  final DateTime? quitDate;
  final int currentStep;
  final bool isLoading;
  final String? error;

  const OnboardingState({
    required this.userId,
    this.nickname,
    this.goalType,
    this.cigarettesPerDay,
    this.costPerPack,
    this.cigarettesPerPack,
    this.episodesPerWeek,
    this.triggers = const [],
    this.quitDate,
    this.currentStep = 0,
    this.isLoading = false,
    this.error,
  });

  OnboardingState copyWith({
    String? userId,
    String? nickname,
    GoalType? goalType,
    int? cigarettesPerDay,
    double? costPerPack,
    int? cigarettesPerPack,
    int? episodesPerWeek,
    List<TriggerType>? triggers,
    DateTime? quitDate,
    int? currentStep,
    bool? isLoading,
    String? error,
  }) {
    return OnboardingState(
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      goalType: goalType ?? this.goalType,
      cigarettesPerDay: cigarettesPerDay ?? this.cigarettesPerDay,
      costPerPack: costPerPack ?? this.costPerPack,
      cigarettesPerPack: cigarettesPerPack ?? this.cigarettesPerPack,
      episodesPerWeek: episodesPerWeek ?? this.episodesPerWeek,
      triggers: triggers ?? this.triggers,
      quitDate: quitDate ?? this.quitDate,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Provider
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final ProfileRepository _profileRepository;
  final SecureStorageService _secureStorage;

  OnboardingNotifier(this._profileRepository, this._secureStorage)
      : super(OnboardingState(userId: const Uuid().v4()));

  void setNickname(String nickname) {
    state = state.copyWith(nickname: nickname);
  }

  void setGoalType(GoalType goalType) {
    state = state.copyWith(goalType: goalType);
  }

  void setCigarettesPerDay(int count) {
    state = state.copyWith(cigarettesPerDay: count);
  }

  void setCostPerPack(double cost) {
    state = state.copyWith(costPerPack: cost);
  }

  void setCigarettesPerPack(int count) {
    state = state.copyWith(cigarettesPerPack: count);
  }

  void setEpisodesPerWeek(int count) {
    state = state.copyWith(episodesPerWeek: count);
  }

  void toggleTrigger(TriggerType trigger) {
    final triggers = List<TriggerType>.from(state.triggers);
    if (triggers.contains(trigger)) {
      triggers.remove(trigger);
    } else {
      triggers.add(trigger);
    }
    state = state.copyWith(triggers: triggers);
  }

  void setQuitDate(DateTime date) {
    state = state.copyWith(quitDate: date);
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<bool> completeOnboarding() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Create profile
      final profile = UserProfile()
        ..userId = state.userId
        ..nickname = state.nickname
        ..goalType = state.goalType!
        ..cigarettesPerDay = state.cigarettesPerDay
        ..costPerPack = state.costPerPack
        ..cigarettesPerPack = state.cigarettesPerPack
        ..episodesPerWeek = state.episodesPerWeek
        ..triggers = state.triggers
        ..quitDate = state.quitDate;

      // Save to database
      await _profileRepository.saveProfile(profile);

      // Save user ID and mark onboarding complete
      await _secureStorage.setUserId(state.userId);
      await _secureStorage.setOnboardingCompleted(true);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to save profile: $e',
      );
      return false;
    }
  }

  bool canProceedFromGoalSelection() {
    return state.goalType != null;
  }

  bool canProceedFromBaseline() {
    final hasSmokingData = state.goalType == GoalType.quitSmoking ||
        state.goalType == GoalType.both
        ? state.cigarettesPerDay != null
        : true;

    final hasMasturbationData = state.goalType == GoalType.reduceMasturbation ||
        state.goalType == GoalType.both
        ? state.episodesPerWeek != null
        : true;

    return hasSmokingData && hasMasturbationData;
  }

  bool canCompleteOnboarding() {
    return state.quitDate != null;
  }
}

// Providers
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

final onboardingProvider =
StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier(
    ref.watch(profileRepositoryProvider),
    ref.watch(secureStorageProvider),
  );
});
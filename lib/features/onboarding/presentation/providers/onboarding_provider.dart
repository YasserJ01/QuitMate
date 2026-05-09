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
  final int currentStep;
  final bool isLoading;
  final String? error;

  // Smoking profile fields
  final int? cigarettesPerDay;
  final double? costPerPack;
  final int? cigarettesPerPack;
  final int? ttfcMinutesIndex; // 0=≤5min, 1=6-30min, 2=31-60min, 3=>60min
  final int? yearsSmoking;
  final List<String> smokingWindows;
  final int? previousQuitAttempts;
  final List<String> previousAids;
  final int? confidenceToQuit; // 1–10
  final bool isGradualReduction;
  final String? reductionPlanJson;

  // Reduction profile fields
  final int? episodesPerWeek;
  final int? episodeDurationMinutes;
  final bool? pornInvolvementFlag;
  final int? distressLevel; // 1–10
  final int? sleepEffectIndex; // 0=None, 1=Slight, 2=Moderate, 3=Severe
  final int? focusEffectIndex;
  final int? relationshipEffectIndex;
  final int? previousReductionAttempts;
  final int? confidenceToReduce; // 1–10
  final int? frequencyTarget; // episodes/week goal
  final List<String> timeOfDayPatterns;
  final List<String> values; // personal motivation values
  final bool isAbstinenceGoal; // true=full abstinence, false=frequency target

  // Shared
  final List<TriggerType> triggers;
  final DateTime? quitDate;

  const OnboardingState({
    required this.userId,
    this.nickname,
    this.goalType,
    this.currentStep = 0,
    this.isLoading = false,
    this.error,
    this.cigarettesPerDay,
    this.costPerPack,
    this.cigarettesPerPack,
    this.ttfcMinutesIndex,
    this.yearsSmoking,
    this.smokingWindows = const [],
    this.previousQuitAttempts,
    this.previousAids = const [],
    this.confidenceToQuit,
    this.isGradualReduction = false,
    this.reductionPlanJson,
    this.episodesPerWeek,
    this.episodeDurationMinutes,
    this.pornInvolvementFlag,
    this.distressLevel,
    this.sleepEffectIndex,
    this.focusEffectIndex,
    this.relationshipEffectIndex,
    this.previousReductionAttempts,
    this.confidenceToReduce,
    this.frequencyTarget,
    this.timeOfDayPatterns = const [],
    this.values = const [],
    this.isAbstinenceGoal = true,
    this.triggers = const [],
    this.quitDate,
  });

  OnboardingState copyWith({
    String? userId,
    String? nickname,
    GoalType? goalType,
    int? currentStep,
    bool? isLoading,
    String? error,
    int? cigarettesPerDay,
    double? costPerPack,
    int? cigarettesPerPack,
    int? ttfcMinutesIndex,
    int? yearsSmoking,
    List<String>? smokingWindows,
    int? previousQuitAttempts,
    List<String>? previousAids,
    int? confidenceToQuit,
    bool? isGradualReduction,
    String? reductionPlanJson,
    int? episodesPerWeek,
    int? episodeDurationMinutes,
    bool? pornInvolvementFlag,
    int? distressLevel,
    int? sleepEffectIndex,
    int? focusEffectIndex,
    int? relationshipEffectIndex,
    int? previousReductionAttempts,
    int? confidenceToReduce,
    int? frequencyTarget,
    List<String>? timeOfDayPatterns,
    List<String>? values,
    bool? isAbstinenceGoal,
    List<TriggerType>? triggers,
    DateTime? quitDate,
    // Nullable wrappers to allow explicit null-setting
    bool clearCigarettesPerDay = false,
    bool clearCostPerPack = false,
    bool clearCigarettesPerPack = false,
    bool clearTtfcMinutesIndex = false,
    bool clearYearsSmoking = false,
    bool clearPreviousQuitAttempts = false,
    bool clearConfidenceToQuit = false,
    bool clearEpisodesPerWeek = false,
    bool clearEpisodeDurationMinutes = false,
    bool clearPornInvolvementFlag = false,
    bool clearDistressLevel = false,
    bool clearSleepEffectIndex = false,
    bool clearFocusEffectIndex = false,
    bool clearRelationshipEffectIndex = false,
    bool clearPreviousReductionAttempts = false,
    bool clearConfidenceToReduce = false,
    bool clearFrequencyTarget = false,
    bool clearQuitDate = false,
  }) {
    return OnboardingState(
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      goalType: goalType ?? this.goalType,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      cigarettesPerDay: clearCigarettesPerDay ? null : (cigarettesPerDay ?? this.cigarettesPerDay),
      costPerPack: clearCostPerPack ? null : (costPerPack ?? this.costPerPack),
      cigarettesPerPack: clearCigarettesPerPack ? null : (cigarettesPerPack ?? this.cigarettesPerPack),
      ttfcMinutesIndex: clearTtfcMinutesIndex ? null : (ttfcMinutesIndex ?? this.ttfcMinutesIndex),
      yearsSmoking: clearYearsSmoking ? null : (yearsSmoking ?? this.yearsSmoking),
      smokingWindows: smokingWindows ?? this.smokingWindows,
      previousQuitAttempts: clearPreviousQuitAttempts ? null : (previousQuitAttempts ?? this.previousQuitAttempts),
      previousAids: previousAids ?? this.previousAids,
      confidenceToQuit: clearConfidenceToQuit ? null : (confidenceToQuit ?? this.confidenceToQuit),
      isGradualReduction: isGradualReduction ?? this.isGradualReduction,
      reductionPlanJson: reductionPlanJson ?? this.reductionPlanJson,
      episodesPerWeek: clearEpisodesPerWeek ? null : (episodesPerWeek ?? this.episodesPerWeek),
      episodeDurationMinutes: clearEpisodeDurationMinutes ? null : (episodeDurationMinutes ?? this.episodeDurationMinutes),
      pornInvolvementFlag: clearPornInvolvementFlag ? null : (pornInvolvementFlag ?? this.pornInvolvementFlag),
      distressLevel: clearDistressLevel ? null : (distressLevel ?? this.distressLevel),
      sleepEffectIndex: clearSleepEffectIndex ? null : (sleepEffectIndex ?? this.sleepEffectIndex),
      focusEffectIndex: clearFocusEffectIndex ? null : (focusEffectIndex ?? this.focusEffectIndex),
      relationshipEffectIndex: clearRelationshipEffectIndex ? null : (relationshipEffectIndex ?? this.relationshipEffectIndex),
      previousReductionAttempts: clearPreviousReductionAttempts ? null : (previousReductionAttempts ?? this.previousReductionAttempts),
      confidenceToReduce: clearConfidenceToReduce ? null : (confidenceToReduce ?? this.confidenceToReduce),
      frequencyTarget: clearFrequencyTarget ? null : (frequencyTarget ?? this.frequencyTarget),
      timeOfDayPatterns: timeOfDayPatterns ?? this.timeOfDayPatterns,
      values: values ?? this.values,
      isAbstinenceGoal: isAbstinenceGoal ?? this.isAbstinenceGoal,
      triggers: triggers ?? this.triggers,
      quitDate: clearQuitDate ? null : (quitDate ?? this.quitDate),
    );
  }
}

// Provider
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final ProfileRepository _profileRepository;
  final SecureStorageService _secureStorage;

  OnboardingNotifier(this._profileRepository, this._secureStorage)
      : super(OnboardingState(userId: const Uuid().v4()));

  // ── Basic setters ──────────────────────────────────────────────────────

  void setNickname(String nickname) {
    state = state.copyWith(nickname: nickname);
  }

  void setGoalType(GoalType goalType) {
    state = state.copyWith(goalType: goalType);
  }

  void setQuitDate(DateTime date) {
    state = state.copyWith(quitDate: date);
  }

  // ── Smoking profile setters ────────────────────────────────────────────

  void setCigarettesPerDay(int? count) {
    if (count != null) {
      state = state.copyWith(cigarettesPerDay: count);
    } else {
      state = state.copyWith(clearCigarettesPerDay: true);
    }
  }

  void setCostPerPack(double? cost) {
    if (cost != null) {
      state = state.copyWith(costPerPack: cost);
    } else {
      state = state.copyWith(clearCostPerPack: true);
    }
  }

  void setCigarettesPerPack(int? count) {
    if (count != null) {
      state = state.copyWith(cigarettesPerPack: count);
    } else {
      state = state.copyWith(clearCigarettesPerPack: true);
    }
  }

  void setTtfcMinutesIndex(int? index) {
    if (index != null) {
      state = state.copyWith(ttfcMinutesIndex: index);
    } else {
      state = state.copyWith(clearTtfcMinutesIndex: true);
    }
  }

  void setYearsSmoking(int? years) {
    if (years != null) {
      state = state.copyWith(yearsSmoking: years);
    } else {
      state = state.copyWith(clearYearsSmoking: true);
    }
  }

  void toggleSmokingWindow(String window) {
    final windows = List<String>.from(state.smokingWindows);
    if (windows.contains(window)) {
      windows.remove(window);
    } else {
      windows.add(window);
    }
    state = state.copyWith(smokingWindows: windows);
  }

  void setPreviousQuitAttempts(int? attempts) {
    if (attempts != null) {
      state = state.copyWith(previousQuitAttempts: attempts);
    } else {
      state = state.copyWith(clearPreviousQuitAttempts: true);
    }
  }

  void togglePreviousAid(String aid) {
    final aids = List<String>.from(state.previousAids);
    if (aids.contains(aid)) {
      aids.remove(aid);
    } else {
      aids.add(aid);
    }
    state = state.copyWith(previousAids: aids);
  }

  void setConfidenceToQuit(int? confidence) {
    if (confidence != null) {
      state = state.copyWith(confidenceToQuit: confidence);
    } else {
      state = state.copyWith(clearConfidenceToQuit: true);
    }
  }

  void setGradualReduction(bool isGradual) {
    state = state.copyWith(isGradualReduction: isGradual);
  }

  void setReductionPlanJson(String? json) {
    state = state.copyWith(reductionPlanJson: json);
  }

  // ── Reduction profile setters ──────────────────────────────────────────

  void setEpisodesPerWeek(int? count) {
    if (count != null) {
      state = state.copyWith(episodesPerWeek: count);
    } else {
      state = state.copyWith(clearEpisodesPerWeek: true);
    }
  }

  void setEpisodeDurationMinutes(int? minutes) {
    if (minutes != null) {
      state = state.copyWith(episodeDurationMinutes: minutes);
    } else {
      state = state.copyWith(clearEpisodeDurationMinutes: true);
    }
  }

  void setPornInvolvementFlag(bool? involved) {
    if (involved != null) {
      state = state.copyWith(pornInvolvementFlag: involved);
    } else {
      state = state.copyWith(clearPornInvolvementFlag: true);
    }
  }

  void setDistressLevel(int? level) {
    if (level != null) {
      state = state.copyWith(distressLevel: level);
    } else {
      state = state.copyWith(clearDistressLevel: true);
    }
  }

  void setSleepEffectIndex(int? index) {
    if (index != null) {
      state = state.copyWith(sleepEffectIndex: index);
    } else {
      state = state.copyWith(clearSleepEffectIndex: true);
    }
  }

  void setFocusEffectIndex(int? index) {
    if (index != null) {
      state = state.copyWith(focusEffectIndex: index);
    } else {
      state = state.copyWith(clearFocusEffectIndex: true);
    }
  }

  void setRelationshipEffectIndex(int? index) {
    if (index != null) {
      state = state.copyWith(relationshipEffectIndex: index);
    } else {
      state = state.copyWith(clearRelationshipEffectIndex: true);
    }
  }

  void setPreviousReductionAttempts(int? attempts) {
    if (attempts != null) {
      state = state.copyWith(previousReductionAttempts: attempts);
    } else {
      state = state.copyWith(clearPreviousReductionAttempts: true);
    }
  }

  void setConfidenceToReduce(int? confidence) {
    if (confidence != null) {
      state = state.copyWith(confidenceToReduce: confidence);
    } else {
      state = state.copyWith(clearConfidenceToReduce: true);
    }
  }

  void setFrequencyTarget(int? target) {
    if (target != null) {
      state = state.copyWith(frequencyTarget: target);
    } else {
      state = state.copyWith(clearFrequencyTarget: true);
    }
  }

  void toggleTimeOfDayPattern(String pattern) {
    final patterns = List<String>.from(state.timeOfDayPatterns);
    if (patterns.contains(pattern)) {
      patterns.remove(pattern);
    } else {
      patterns.add(pattern);
    }
    state = state.copyWith(timeOfDayPatterns: patterns);
  }

  void toggleValue(String value) {
    final values = List<String>.from(state.values);
    if (values.contains(value)) {
      values.remove(value);
    } else {
      values.add(value);
    }
    state = state.copyWith(values: values);
  }

  void setAbstinenceGoal(bool isAbstinence) {
    state = state.copyWith(isAbstinenceGoal: isAbstinence);
  }

  // ── Shared trigger toggle ──────────────────────────────────────────────

  void toggleTrigger(TriggerType trigger) {
    final triggers = List<TriggerType>.from(state.triggers);
    if (triggers.contains(trigger)) {
      triggers.remove(trigger);
    } else {
      triggers.add(trigger);
    }
    state = state.copyWith(triggers: triggers);
  }

  // ── Navigation ─────────────────────────────────────────────────────────

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  // ── Completion ─────────────────────────────────────────────────────────

  Future<bool> completeOnboarding() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Create profile
      final profile = UserProfile()
        ..userId = state.userId
        ..nickname = state.nickname
        ..goalType = state.goalType!
        ..modeLocked = true
        // Smoking profile
        ..cigarettesPerDay = state.cigarettesPerDay
        ..costPerPack = state.costPerPack
        ..cigarettesPerPack = state.cigarettesPerPack
        ..ttfcMinutesIndex = state.ttfcMinutesIndex
        ..yearsSmoking = state.yearsSmoking
        ..smokingWindows = state.smokingWindows
        ..previousQuitAttempts = state.previousQuitAttempts
        ..previousAids = state.previousAids
        ..confidenceToQuit = state.confidenceToQuit
        ..reductionPlanJson = state.isGradualReduction ? state.reductionPlanJson : null
        // Reduction profile
        ..episodesPerWeek = state.episodesPerWeek
        ..episodeDurationMinutes = state.episodeDurationMinutes
        ..pornInvolvementFlag = state.pornInvolvementFlag
        ..distressLevel = state.distressLevel
        ..sleepEffectIndex = state.sleepEffectIndex
        ..focusEffectIndex = state.focusEffectIndex
        ..relationshipEffectIndex = state.relationshipEffectIndex
        ..previousReductionAttempts = state.previousReductionAttempts
        ..confidenceToReduce = state.confidenceToReduce
        ..frequencyTarget = state.isAbstinenceGoal ? null : state.frequencyTarget
        ..timeOfDayPatterns = state.timeOfDayPatterns
        ..values = state.values
        // Shared
        ..triggers = state.triggers
        ..quitDate = state.quitDate?.toUtc();

      // Save to database
      await _profileRepository.saveProfile(profile);

      // Save user ID, mark onboarding complete, and lock mode
      await _secureStorage.setUserId(state.userId);
      await _secureStorage.setOnboardingCompleted(true);
      await _secureStorage.lockMode();

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

  // ── Validation helpers ─────────────────────────────────────────────────

  bool canProceedFromGoalSelection() {
    return state.goalType != null;
  }

  bool canCompleteOnboarding() {
    if (state.quitDate == null) return false;

    // In reduction mode, if not an abstinence goal, they must have a valid frequency target
    if (state.goalType == GoalType.reduceMasturbation && !state.isAbstinenceGoal) {
      return state.frequencyTarget != null && state.frequencyTarget! >= 0;
    }

    return true;
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

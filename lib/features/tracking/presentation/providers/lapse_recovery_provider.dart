import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/log_entry.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../providers/statistics_provider.dart';
import 'tracking_provider.dart';

enum LapseRecoveryStep { acknowledgment, triggerSelect, nextAction }

class LapseRecoveryState {
  final LapseRecoveryStep step;
  final List<String> selectedTriggers;
  final bool isCompleted;
  final bool isLoading;
  final String? error;

  const LapseRecoveryState({
    this.step = LapseRecoveryStep.acknowledgment,
    this.selectedTriggers = const [],
    this.isCompleted = false,
    this.isLoading = false,
    this.error,
  });

  LapseRecoveryState copyWith({
    LapseRecoveryStep? step,
    List<String>? selectedTriggers,
    bool? isCompleted,
    bool? isLoading,
    String? error,
  }) {
    return LapseRecoveryState(
      step: step ?? this.step,
      selectedTriggers: selectedTriggers ?? this.selectedTriggers,
      isCompleted: isCompleted ?? this.isCompleted,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class LapseRecoveryNotifier extends StateNotifier<LapseRecoveryState> {
  final Ref _ref;

  LapseRecoveryNotifier(this._ref)
      : super(const LapseRecoveryState());

  void goToStep(LapseRecoveryStep step) {
    state = state.copyWith(step: step);
  }

  void toggleTrigger(String trigger) {
    final triggers = List<String>.from(state.selectedTriggers);
    if (triggers.contains(trigger)) {
      triggers.remove(trigger);
    } else {
      triggers.add(trigger);
    }
    state = state.copyWith(selectedTriggers: triggers);
  }

  Future<void> logLapseWithRecovery({
    required String userId,
    required LogType lapseType,
    List<String> triggers = const [],
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final trackingRepo = _ref.read(trackingRepositoryProvider);
      final profileRepo = _ref.read(profileRepositoryProvider);

      // 1. Write lapse LogEntry
      final entry = LogEntry()
        ..userId = userId
        ..type = lapseType
        ..triggers = triggers
        ..timestamp = DateTime.now().toUtc();

      await trackingRepo.addLogEntry(entry);

      // 2. Update UserProfile: currentStreak reset, longestStreak preserved,
      //    recoveryCount++, lastLapseAt stored
      final profile = await profileRepo.getProfile(userId);
      if (profile != null) {
        profile.recoveryCount++;
        profile.lastLapseAt = DateTime.now().toUtc();
        profile.updatedAt = DateTime.now().toUtc();
        await profileRepo.updateProfile(userId, profile);
      }

      // 3. Write a lapseRecovery LogEntry to track the recovery event
      final recoveryEntry = LogEntry()
        ..userId = userId
        ..type = LogType.lapseRecovery
        ..triggers = triggers
        ..timestamp = DateTime.now().toUtc();
      await trackingRepo.addLogEntry(recoveryEntry);

      // 4. Invalidate statistics provider
      _ref.invalidate(statisticsProvider);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to log lapse: $e',
      );
    }
  }

  void complete() {
    state = state.copyWith(isCompleted: true);
  }
}

final lapseRecoveryProvider =
    StateNotifierProvider.autoDispose<LapseRecoveryNotifier, LapseRecoveryState>(
  (ref) => LapseRecoveryNotifier(ref),
);

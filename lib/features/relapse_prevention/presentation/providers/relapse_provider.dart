import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/relapse_models.dart';
import '../../data/repositories/relapse_repository.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// Repository provider
final relapseRepositoryProvider = Provider<RelapseRepository>((ref) {
  return RelapseRepository();
});

// ============= RELAPSE PLAN PROVIDERS =============

// Relapse plan provider
final relapsePlanProvider = FutureProvider.autoDispose<RelapsePlan>((ref) async {
  final repository = ref.watch(relapseRepositoryProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();
  
  if (userId == null) {
    throw Exception('User not logged in');
  }
  
  // Try fresh query first to see what's actually in the database
  final freshPlan = await repository.getPlanFresh(userId);
  if (freshPlan != null) {
    return freshPlan;
  }
  
  // Fall back to getOrCreate if no plan exists
  return await repository.getOrCreatePlan(userId);
});

// Panic steps provider (for quick access)
final panicStepsProvider = FutureProvider.autoDispose<List<PanicStep>>((ref) async {
  final repository = ref.watch(relapseRepositoryProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();
  
  if (userId == null) {
    throw Exception('User not logged in');
  }
  
  return await repository.getPanicSteps(userId);
});

// ============= CONTACT PROVIDERS =============

// All contacts provider
final relapseContactsProvider = FutureProvider.autoDispose<List<RelapseContact>>((ref) async {
  final repository = ref.watch(relapseRepositoryProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();
  
  if (userId == null) {
    return [];
  }
  
  return await repository.getContacts(userId);
});

// Contacts with phone numbers only
final contactsWithPhoneProvider = FutureProvider.autoDispose<List<RelapseContact>>((ref) async {
  final repository = ref.watch(relapseRepositoryProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();
  
  if (userId == null) {
    return [];
  }
  
  return await repository.getContactsWithPhone(userId);
});

// ============= STATE NOTIFIER =============

class RelapseState {
  final bool isLoading;
  final String? error;
  final RelapsePlan? plan;
  final List<RelapseContact> contacts;

  const RelapseState({
    this.isLoading = false,
    this.error,
    this.plan,
    this.contacts = const [],
  });

  RelapseState copyWith({
    bool? isLoading,
    String? error,
    RelapsePlan? plan,
    List<RelapseContact>? contacts,
  }) {
    return RelapseState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      plan: plan ?? this.plan,
      contacts: contacts ?? this.contacts,
    );
  }
}

class RelapseNotifier extends StateNotifier<RelapseState> {
  final RelapseRepository _repository;
  final String _userId;

  RelapseNotifier(this._repository, this._userId) : super(const RelapseState()) {
    _loadData();
  }

  Future<void> _loadData() async {
    if (!mounted) return; // Don't load if already disposed
    
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final plan = await _repository.getOrCreatePlan(_userId);
      final contacts = await _repository.getContacts(_userId);
      
      if (!mounted) return; // Check again before updating state
      
      state = state.copyWith(
        isLoading: false,
        plan: plan,
        contacts: contacts,
      );
    } catch (e) {
      if (!mounted) return; // Check before updating state
      
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load data: $e',
      );
    }
  }

  // ============= PLAN OPERATIONS =============

  Future<void> updateCustomSteps(List<String> steps) async {
    try {
      await _repository.updateCustomSteps(_userId, steps);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to update steps: $e');
    }
  }

  Future<void> updatePanicSteps(List<PanicStep> steps) async {
    try {
      await _repository.updatePanicSteps(_userId, steps);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to update panic steps: $e');
    }
  }

  Future<void> resetPanicSteps() async {
    try {
      await _repository.resetPanicSteps(_userId);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to reset panic steps: $e');
    }
  }

  Future<void> resetCustomSteps() async {
    try {
      await _repository.resetCustomSteps(_userId);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to reset custom steps: $e');
    }
  }

  // ============= CONTACT OPERATIONS =============

  Future<void> addContact(RelapseContact contact) async {
    try {
      contact.userId = _userId;
      await _repository.addContact(contact);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to add contact: $e');
    }
  }

  Future<void> updateContact(RelapseContact contact) async {
    try {
      await _repository.updateContact(contact);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to update contact: $e');
    }
  }

  Future<void> deleteContact(int id) async {
    try {
      await _repository.deleteContact(id);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to delete contact: $e');
    }
  }

  Future<void> reorderContacts(List<RelapseContact> contacts) async {
    try {
      await _repository.reorderContacts(contacts);
      await _loadData();
    } catch (e) {
      state = state.copyWith(error: 'Failed to reorder contacts: $e');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> refresh() async {
    await _loadData();
  }
}

// Current user ID provider
final currentRelapseUserIdProvider = FutureProvider.autoDispose<String>((ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();
  
  if (userId == null || userId.isEmpty) {
    throw Exception('User not logged in');
  }
  
  return userId;
});

// Relapse notifier provider with proper userId
final relapseNotifierProvider = StateNotifierProvider.autoDispose<RelapseNotifier, RelapseState>((ref) {
  final repository = ref.watch(relapseRepositoryProvider);
  
  // Watch the userId provider to ensure we have it
  final userIdAsync = ref.watch(currentRelapseUserIdProvider);
  
  return userIdAsync.when(
    data: (userId) {
      return RelapseNotifier(repository, userId);
    },
    loading: () {
      // Return a notifier with empty state while loading
      return RelapseNotifier(repository, '');
    },
    error: (error, stack) {
      return RelapseNotifier(repository, '');
    },
  );
});

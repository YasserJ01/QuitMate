import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/database/database_provider.dart';
import '../../data/models/relapse_models.dart';
import '../../data/repositories/relapse_repository.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';

// Repository provider
final relapseRepositoryProvider = Provider<RelapseRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return RelapseRepository(db);
});

// ============= RELAPSE PLAN PROVIDERS =============

final relapseUserIdProvider = FutureProvider.autoDispose<String>((ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  final userId = await secureStorage.getUserId();

  if (userId == null || userId.isEmpty) {
    throw Exception('User not logged in');
  }

  return userId;
});

// Panic steps provider (for quick access)
final panicStepsProvider = FutureProvider.autoDispose<List<PanicStep>>((ref) async {
  final repository = ref.watch(relapseRepositoryProvider);
  final userId = await ref.watch(relapseUserIdProvider.future);

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
  final RelapsePlan? plan;
  final List<RelapseContact> contacts;

  const RelapseState({
    this.plan,
    this.contacts = const [],
  });

  RelapseState copyWith({
    RelapsePlan? plan,
    List<RelapseContact>? contacts,
  }) {
    return RelapseState(
      plan: plan ?? this.plan,
      contacts: contacts ?? this.contacts,
    );
  }
}

class RelapseNotifier extends AutoDisposeAsyncNotifier<RelapseState> {
  @override
  Future<RelapseState> build() async {
    final repository = ref.watch(relapseRepositoryProvider);
    final userId = await ref.watch(relapseUserIdProvider.future);

    final plan = await repository.getOrCreatePlan(userId);
    final contacts = await repository.getContacts(userId);

    return RelapseState(plan: plan, contacts: contacts);
  }

  // ============= PLAN OPERATIONS =============

  Future<void> updateCustomSteps(List<String> steps) async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(relapseUserIdProvider.future);
    await repository.updateCustomSteps(userId, steps);
    ref.invalidateSelf();
  }

  Future<void> updatePanicSteps(List<PanicStep> steps) async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(relapseUserIdProvider.future);
    await repository.updatePanicSteps(userId, steps);
    ref.invalidateSelf();
  }

  Future<void> resetPanicSteps() async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(relapseUserIdProvider.future);
    await repository.resetPanicSteps(userId);
    ref.invalidateSelf();
  }

  Future<void> resetCustomSteps() async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(relapseUserIdProvider.future);
    await repository.resetCustomSteps(userId);
    ref.invalidateSelf();
  }

  // ============= CONTACT OPERATIONS =============

  Future<void> addContact(RelapseContact contact) async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(relapseUserIdProvider.future);
    contact.userId = userId;
    await repository.addContact(contact);
    ref.invalidateSelf();
  }

  Future<void> updateContact(RelapseContact contact) async {
    final repository = ref.read(relapseRepositoryProvider);
    await repository.updateContact(contact);
    ref.invalidateSelf();
  }

  Future<void> deleteContact(int id) async {
    final repository = ref.read(relapseRepositoryProvider);
    await repository.deleteContact(id);
    ref.invalidateSelf();
  }

  Future<void> reorderContacts(List<RelapseContact> contacts) async {
    final repository = ref.read(relapseRepositoryProvider);
    await repository.reorderContacts(contacts);
    ref.invalidateSelf();
  }
}

final relapseNotifierProvider = AsyncNotifierProvider.autoDispose<RelapseNotifier, RelapseState>(
  RelapseNotifier.new,
);

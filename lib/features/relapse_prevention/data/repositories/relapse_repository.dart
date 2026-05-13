import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/relapse_models.dart';
import '../models/lapse_recovery_session_model.dart';
import '../../../../core/services/database/isar_service.dart';

class RelapseRepository {
  Future<Isar> get _db async => await IsarService.instance;

  // ============= RELAPSE PLAN OPERATIONS =============

  /// Get or create relapse plan for user
  Future<RelapsePlan> getOrCreatePlan(String userId) async {
    final isar = await _db;
    
    var plan = await isar.relapsePlans
        .filter()
        .userIdEqualTo(userId)
        .findFirst();

    if (plan == null) {
      plan = RelapsePlan()
        ..userId = userId
        ..customSteps = RelapsePlan.getDefaultCustomSteps();
      
      plan.ensureThreePanicSteps();
      
      await isar.writeTxn(() async {
        await isar.relapsePlans.put(plan!);
      });
    }

    return plan;
  }

  /// Force a fresh read from database, bypassing any caching
  Future<RelapsePlan?> getPlanFresh(String userId) async {
    final isar = await _db;
    
    // Query directly from database
    final plan = await isar.relapsePlans
        .filter()
        .userIdEqualTo(userId)
        .findFirst();
    
    return plan;
  }

  /// Update relapse plan
  Future<RelapsePlan> updatePlan(RelapsePlan plan) async {
    final isar = await _db;
    
    plan.updatedAt = DateTime.now();
    plan.ensureThreePanicSteps();
    
    await isar.writeTxn(() async {
      await isar.relapsePlans.put(plan);
    });

    return plan;
  }

  /// Update custom steps
  Future<void> updateCustomSteps(String userId, List<String> steps) async {
    final plan = await getOrCreatePlan(userId);
    plan.customSteps = steps;
    await updatePlan(plan);
  }

  /// Update panic steps
  Future<void> updatePanicSteps(String userId, List<PanicStep> steps) async {
    final plan = await getOrCreatePlan(userId);
    
    // Ensure exactly 3 steps
    if (steps.length != 3) {
      throw ArgumentError('Panic mode must have exactly 3 steps');
    }
    
    // CRITICAL FIX: Create completely NEW PanicStep instances
    // Isar doesn't detect changes to embedded objects properly,
    // so we need to create fresh instances to force persistence
    final List<PanicStep> newSteps = [];
    
    for (int i = 0; i < steps.length; i++) {
      final oldStep = steps[i];
      
      // Create a COMPLETELY NEW instance
      final newStep = PanicStep()
        ..title = oldStep.title
        ..description = oldStep.description
        ..icon = oldStep.icon
        ..actionType = oldStep.actionType
        ..contactId = oldStep.contactId
        ..actionData = oldStep.actionData
        ..displayOrder = i;
      
      newSteps.add(newStep);
    }
    
    // Replace the entire list with new instances
    plan.panicSteps = newSteps;
    
    await updatePlan(plan);
  }

  /// Get panic steps for quick access
  Future<List<PanicStep>> getPanicSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    return plan.panicSteps;
  }

  /// Reset panic steps to defaults
  Future<void> resetPanicSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    plan.panicSteps = PanicStep.getDefaults();
    await updatePlan(plan);
  }

  /// Reset custom steps to defaults
  Future<void> resetCustomSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    plan.customSteps = RelapsePlan.getDefaultCustomSteps();
    await updatePlan(plan);
  }

  // ============= CONTACT OPERATIONS =============

  /// Get all contacts for user
  Future<List<RelapseContact>> getContacts(String userId) async {
    final isar = await _db;
    
    return await isar.relapseContacts
        .filter()
        .userIdEqualTo(userId)
        .sortByDisplayOrder()
        .findAll();
  }

  /// Get single contact by ID
  Future<RelapseContact?> getContact(int id) async {
    final isar = await _db;
    return await isar.relapseContacts.get(id);
  }

  /// Add new contact
  Future<RelapseContact> addContact(RelapseContact contact) async {
    final isar = await _db;
    
    // Get current max display order
    final contacts = await getContacts(contact.userId);
    contact.displayOrder = contacts.isEmpty ? 0 : contacts.last.displayOrder + 1;
    
    await isar.writeTxn(() async {
      await isar.relapseContacts.put(contact);
    });

    return contact;
  }

  /// Update existing contact
  Future<RelapseContact> updateContact(RelapseContact contact) async {
    final isar = await _db;
    
    contact.updatedAt = DateTime.now();
    
    await isar.writeTxn(() async {
      await isar.relapseContacts.put(contact);
    });

    return contact;
  }

  /// Delete contact
  Future<bool> deleteContact(int id) async {
    final isar = await _db;
    
    bool deleted = false;
    await isar.writeTxn(() async {
      deleted = await isar.relapseContacts.delete(id);
    });

    return deleted;
  }

  /// Reorder contacts
  Future<void> reorderContacts(List<RelapseContact> contacts) async {
    final isar = await _db;
    
    // Update display order
    for (int i = 0; i < contacts.length; i++) {
      contacts[i].displayOrder = i;
      contacts[i].updatedAt = DateTime.now();
    }
    
    await isar.writeTxn(() async {
      await isar.relapseContacts.putAll(contacts);
    });
  }

  /// Get contact count for user
  Future<int> getContactCount(String userId) async {
    final isar = await _db;
    
    return await isar.relapseContacts
        .filter()
        .userIdEqualTo(userId)
        .count();
  }

  /// Get contacts with phone numbers only
  Future<List<RelapseContact>> getContactsWithPhone(String userId) async {
    final isar = await _db;
    
    return await isar.relapseContacts
        .filter()
        .userIdEqualTo(userId)
        .phoneNumberIsNotNull()
        .sortByDisplayOrder()
        .findAll();
  }

  // ============= LAPSE RECOVERY SESSIONS =============

  static const _uuid = Uuid();

  /// Create a new lapse recovery session and return its UUID.
  Future<String> createRecoverySession({
    required String userId,
    required String mode,
  }) async {
    final isar = await _db;
    final sessionId = _uuid.v4();

    final model = LapseRecoverySessionModel()
      ..sessionId = sessionId
      ..userId = userId
      ..startedAt = DateTime.now().toUtc()
      ..mode = mode;

    await isar.writeTxn(() => isar.lapseRecoverySessionModels.put(model));
    return sessionId;
  }

  /// Update the triggers selected during Step 1 of the recovery flow.
  Future<void> updateRecoverySessionTriggers({
    required String sessionId,
    required List<String> triggers,
  }) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.lapseRecoverySessionModels
          .filter()
          .sessionIdEqualTo(sessionId)
          .findFirst();
      if (model != null) {
        model.selectedTriggers = triggers;
        await isar.lapseRecoverySessionModels.put(model);
      }
    });
  }

  /// Mark a recovery session as completed with the chosen action.
  Future<void> completeRecoverySession({
    required String sessionId,
    required LapseRecoveryAction action,
    bool openedToolkit = false,
    bool readRecoveryGuide = false,
    String? recoveryNote,
  }) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.lapseRecoverySessionModels
          .filter()
          .sessionIdEqualTo(sessionId)
          .findFirst();
      if (model != null) {
        model.completedAt = DateTime.now().toUtc();
        model.chosenAction = action;
        model.openedToolkit = openedToolkit;
        model.readRecoveryGuide = readRecoveryGuide;
        model.recoveryNote = recoveryNote;
        await isar.lapseRecoverySessionModels.put(model);
      }
    });
  }

  /// Get all recovery sessions for a user, most recent first.
  Future<List<LapseRecoverySessionModel>> getRecoverySessions(
    String userId, {
    int? limit,
  }) async {
    final isar = await _db;
    // Use dynamic to bypass Isar's type-state QueryBuilder — the generic
    // parameter changes after .sortBy*() / .limit().
    dynamic query = isar.lapseRecoverySessionModels
        .filter()
        .userIdEqualTo(userId)
        .sortByStartedAtDesc();

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.findAll();
  }

  /// Count completed recovery sessions for a user.
  Future<int> getRecoveryCount(String userId) async {
    final isar = await _db;
    return isar.lapseRecoverySessionModels
        .filter()
        .userIdEqualTo(userId)
        .completedAtIsNotNull()
        .count();
  }

  /// Get the most common triggers from recovery sessions.
  Future<List<String>> getCommonTriggers(String userId) async {
    final sessions = await getRecoverySessions(userId);
    final counts = <String, int>{};
    for (final s in sessions) {
      for (final t in s.selectedTriggers) {
        counts[t] = (counts[t] ?? 0) + 1;
      }
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(3).map((e) => e.key).toList();
  }
}

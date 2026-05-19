import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/services/database/app_database.dart' as drift_db;
import '../models/relapse_models.dart';
import '../models/lapse_recovery_session_model.dart';

class RelapseRepository {
  final drift_db.AppDatabase db;
  static final _uuid = const Uuid();

  RelapseRepository(this.db);

  // ============= RELAPSE PLAN OPERATIONS =============

  Future<RelapsePlan> getOrCreatePlan(String userId) async {
    var row = await (db.select(db.relapsePlans)
        ..where((t) => t.userId.equals(userId))).getSingleOrNull();

    if (row == null) {
      final plan = RelapsePlan(userId: userId);
      final companion = _planToCompanion(plan);
      final id = await db.into(db.relapsePlans).insert(companion);
      row = (await (db.select(db.relapsePlans)
          ..where((t) => t.id.equals(id))).getSingleOrNull())!;
    }

    return _planFromRow(row);
  }

  Future<RelapsePlan?> getPlanFresh(String userId) async {
    final row = await (db.select(db.relapsePlans)
        ..where((t) => t.userId.equals(userId))).getSingleOrNull();
    if (row == null) return null;
    return _planFromRow(row);
  }

  Future<RelapsePlan> updatePlan(RelapsePlan plan) async {
    plan.updatedAt = DateTime.now();
    plan.ensureThreePanicSteps();
    final companion = _planToCompanion(plan);
    await (db.update(db.relapsePlans)
        ..where((t) => t.id.equals(plan.id))).write(companion);
    return plan;
  }

  Future<void> updateCustomSteps(String userId, List<String> steps) async {
    final plan = await getOrCreatePlan(userId);
    plan.customSteps = steps;
    await updatePlan(plan);
  }

  Future<void> updatePanicSteps(String userId, List<PanicStep> steps) async {
    final plan = await getOrCreatePlan(userId);

    if (steps.length != 3) {
      throw ArgumentError('Panic mode must have exactly 3 steps');
    }

    final List<PanicStep> newSteps = [];
    for (int i = 0; i < steps.length; i++) {
      final oldStep = steps[i];
      final newStep = PanicStep(
        title: oldStep.title,
        description: oldStep.description,
        icon: oldStep.icon,
        actionType: oldStep.actionType,
        contactId: oldStep.contactId,
        actionData: oldStep.actionData,
        displayOrder: i,
      );
      newSteps.add(newStep);
    }

    plan.panicSteps = newSteps;
    await updatePlan(plan);
  }

  Future<List<PanicStep>> getPanicSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    return plan.panicSteps;
  }

  Future<void> resetPanicSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    plan.panicSteps = PanicStep.getDefaults();
    await updatePlan(plan);
  }

  Future<void> resetCustomSteps(String userId) async {
    final plan = await getOrCreatePlan(userId);
    plan.customSteps = RelapsePlan.getDefaultCustomSteps();
    await updatePlan(plan);
  }

  // ============= CONTACT OPERATIONS =============

  Future<List<RelapseContact>> getContacts(String userId) async {
    final rows = await (db.select(db.relapseContacts)
      ..where((t) => t.userId.equals(userId))
      ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)])).get();
    return rows.map(_contactFromRow).toList();
  }

  Future<RelapseContact?> getContact(int id) async {
    final row = await (db.select(db.relapseContacts)
        ..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _contactFromRow(row);
  }

  Future<RelapseContact> addContact(RelapseContact contact) async {
    final contacts = await getContacts(contact.userId);
    contact.displayOrder = contacts.isEmpty ? 0 : contacts.last.displayOrder + 1;

    final companion = _contactToCompanion(contact);
    final id = await db.into(db.relapseContacts).insert(companion);
    return contact.copyWith(id: id);
  }

  Future<RelapseContact> updateContact(RelapseContact contact) async {
    contact.updatedAt = DateTime.now();
    final companion = _contactToCompanion(contact);
    await (db.update(db.relapseContacts)
        ..where((t) => t.id.equals(contact.id))).write(companion);
    return contact;
  }

  Future<bool> deleteContact(int id) async {
    final deleted = await (db.delete(db.relapseContacts)
        ..where((t) => t.id.equals(id))).go();
    return deleted > 0;
  }

  Future<void> reorderContacts(List<RelapseContact> contacts) async {
    await db.transaction(() async {
      for (int i = 0; i < contacts.length; i++) {
        contacts[i].displayOrder = i;
        contacts[i].updatedAt = DateTime.now();
        final companion = _contactToCompanion(contacts[i]);
        await (db.update(db.relapseContacts)
            ..where((t) => t.id.equals(contacts[i].id))).write(companion);
      }
    });
  }

  Future<int> getContactCount(String userId) async {
    final rows = await (db.select(db.relapseContacts)
        ..where((t) => t.userId.equals(userId))).get();
    return rows.length;
  }

  Future<List<RelapseContact>> getContactsWithPhone(String userId) async {
    final rows = await (db.select(db.relapseContacts)
      ..where((t) => t.userId.equals(userId))
      ..where((t) => t.phoneNumber.isNotNull())
      ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)])).get();
    return rows.map(_contactFromRow).toList();
  }

  // ============= LAPSE RECOVERY SESSIONS =============

  Future<String> createRecoverySession({
    required String userId,
    required String mode,
  }) async {
    final sessionId = _uuid.v4();

    final companion = drift_db.LapseRecoverySessionsCompanion(
      sessionId: Value(sessionId),
      userId: Value(userId),
      startedAt: Value(DateTime.now().toUtc()),
      mode: Value(mode),
    );

    await db.into(db.lapseRecoverySessions).insert(companion);
    return sessionId;
  }

  Future<void> updateRecoverySessionTriggers({
    required String sessionId,
    required List<String> triggers,
  }) async {
    final row = await (db.select(db.lapseRecoverySessions)
        ..where((t) => t.sessionId.equals(sessionId))).getSingleOrNull();
    if (row != null) {
      await (db.update(db.lapseRecoverySessions)
          ..where((t) => t.id.equals(row.id))).write(drift_db.LapseRecoverySessionsCompanion(
        selectedTriggers: Value(triggers),
      ));
    }
  }

  Future<void> completeRecoverySession({
    required String sessionId,
    required LapseRecoveryAction action,
    bool openedToolkit = false,
    bool readRecoveryGuide = false,
    String? recoveryNote,
  }) async {
    final row = await (db.select(db.lapseRecoverySessions)
        ..where((t) => t.sessionId.equals(sessionId))).getSingleOrNull();
    if (row != null) {
      await (db.update(db.lapseRecoverySessions)
          ..where((t) => t.id.equals(row.id))).write(drift_db.LapseRecoverySessionsCompanion(
        completedAt: Value(DateTime.now().toUtc()),
        chosenAction: Value(action.name),
        openedToolkit: Value(openedToolkit),
        readRecoveryGuide: Value(readRecoveryGuide),
        recoveryNote: Value(recoveryNote),
      ));
    }
  }

  Future<List<LapseRecoverySessionModel>> getRecoverySessions(
    String userId, {
    int? limit,
  }) async {
    final q = db.select(db.lapseRecoverySessions);
    q.where((t) => t.userId.equals(userId));
    q.orderBy([(t) => OrderingTerm.desc(t.startedAt)]);
    if (limit != null) {
      q.limit(limit);
    }
    final rows = await q.get();
    return rows.map(_recoverySessionFromRow).toList();
  }

  Future<int> getRecoveryCount(String userId) async {
    final q = db.select(db.lapseRecoverySessions);
    q.where((t) => t.userId.equals(userId));
    q.where((t) => t.completedAt.isNotNull());
    final rows = await q.get();
    return rows.length;
  }

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

  // ── Mappers ──────────────────────────────────────────────────────────────

  RelapsePlan _planFromRow(drift_db.DbRelapsePlan row) {
    final panicStepsData = row.panicSteps;
    final panicSteps = panicStepsData != null && panicStepsData.isNotEmpty
        ? panicStepsData
            .map((j) => PanicStep.fromJson(j))
            .toList()
        : PanicStep.getDefaults();

    return RelapsePlan(
      id: row.id,
      userId: row.userId,
      customSteps: row.customSteps ?? [],
      panicSteps: panicSteps,
      notes: row.notes,
      nextReviewDate: row.nextReviewDate,
      personalRecoveryNote: row.personalRecoveryNote,
      lastReviewedAt: row.lastReviewedAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.RelapsePlansCompanion _planToCompanion(RelapsePlan p) {
    return drift_db.RelapsePlansCompanion(
      userId: Value(p.userId),
      customSteps: Value(p.customSteps),
      panicSteps: Value(p.panicStepsToJson()),
      notes: Value(p.notes),
      nextReviewDate: Value(p.nextReviewDate),
      personalRecoveryNote: Value(p.personalRecoveryNote),
      lastReviewedAt: Value(p.lastReviewedAt),
      createdAt: Value(p.createdAt),
      updatedAt: Value(p.updatedAt),
    );
  }

  RelapseContact _contactFromRow(drift_db.DbRelapseContact row) {
    return RelapseContact(
      id: row.id,
      userId: row.userId,
      name: row.name,
      phoneNumber: row.phoneNumber,
      relationship: row.relationship,
      notes: row.notes,
      displayOrder: row.displayOrder,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  drift_db.RelapseContactsCompanion _contactToCompanion(RelapseContact c) {
    return drift_db.RelapseContactsCompanion(
      userId: Value(c.userId),
      name: Value(c.name),
      phoneNumber: Value(c.phoneNumber),
      relationship: Value(c.relationship),
      notes: Value(c.notes),
      displayOrder: Value(c.displayOrder),
      createdAt: Value(c.createdAt),
      updatedAt: Value(c.updatedAt),
    );
  }

  LapseRecoverySessionModel _recoverySessionFromRow(
      drift_db.DbLapseRecoverySession row) {
    return LapseRecoverySessionModel(
      id: row.id,
      sessionId: row.sessionId,
      userId: row.userId,
      startedAt: row.startedAt,
      completedAt: row.completedAt,
      chosenAction: row.chosenAction != null
          ? LapseRecoveryAction.values.byName(row.chosenAction!)
          : null,
      selectedTriggers: row.selectedTriggers ?? [],
      openedToolkit: row.openedToolkit,
      readRecoveryGuide: row.readRecoveryGuide,
      recoveryNote: row.recoveryNote,
      mode: row.mode,
    );
  }
}

extension on RelapseContact {
  RelapseContact copyWith({int? id}) => RelapseContact(
        id: id ?? this.id,
        userId: userId,
        name: name,
        phoneNumber: phoneNumber,
        relationship: relationship,
        notes: notes,
        displayOrder: displayOrder,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

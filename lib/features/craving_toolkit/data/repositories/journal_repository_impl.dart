import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/database/isar_service.dart';
import '../../domain/entities/journal_entry.dart';
import '../../domain/repositories/i_journal_repository.dart';
import '../models/journal_entry_model.dart';

class JournalRepositoryImpl implements IJournalRepository {
  static const _uuid = Uuid();

  Future<Isar> get _db async => await IsarService.instance;

  @override
  Future<List<JournalEntry>> getEntries({
    required String userId,
    String? moodFilter,
    int? limit,
  }) async {
    final isar = await _db;
    // Use dynamic to bypass Isar's type-state QueryBuilder — the generic
    // parameter changes after .sortBy*() / .filter() / .limit().
    dynamic query = isar.journalEntryModels
        .filter()
        .userIdEqualTo(userId)
        .sortByCreatedAtDesc();

    if (moodFilter != null) {
      query = query.filter().moodTagEqualTo(moodFilter);
    }
    if (limit != null) {
      query = query.limit(limit);
    }

    final models = await query.findAll();
    return models.map(_toEntity).toList();
  }

  @override
  Future<String> createEntry({
    required String userId,
    required String content,
    String? moodTag,
    String? sourceExerciseId,
    String? sourceExerciseName,
  }) async {
    final isar = await _db;
    final entryId = _uuid.v4();
    final now = DateTime.now().toUtc();

    final model = JournalEntryModel()
      ..entryId = entryId
      ..userId = userId
      ..createdAt = now
      ..content = content
      ..moodTag = moodTag
      ..sourceExerciseId = sourceExerciseId
      ..sourceExerciseName = sourceExerciseName;

    await isar.writeTxn(() => isar.journalEntryModels.put(model));
    return entryId;
  }

  @override
  Future<void> updateEntry({
    required String entryId,
    required String content,
    String? moodTag,
  }) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.journalEntryModels
          .filter()
          .entryIdEqualTo(entryId)
          .findFirst();
      if (model != null) {
        model.content = content;
        model.moodTag = moodTag;
        model.updatedAt = DateTime.now().toUtc();
        await isar.journalEntryModels.put(model);
      }
    });
  }

  @override
  Future<void> deleteEntry(String entryId) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      final model = await isar.journalEntryModels
          .filter()
          .entryIdEqualTo(entryId)
          .findFirst();
      if (model != null) {
        await isar.journalEntryModels.delete(model.id);
      }
    });
  }

  JournalEntry _toEntity(JournalEntryModel m) => JournalEntry(
        id: m.entryId,
        userId: m.userId,
        createdAt: m.createdAt,
        updatedAt: m.updatedAt,
        content: m.content,
        moodTag: m.moodTag,
        sourceExerciseId: m.sourceExerciseId,
        sourceExerciseName: m.sourceExerciseName,
      );
}
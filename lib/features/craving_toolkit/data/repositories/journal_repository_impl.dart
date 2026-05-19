import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/services/database/app_database.dart' show AppDatabase, JournalEntriesCompanion, DbJournalEntry;
import '../../domain/entities/journal_entry.dart';
import '../../domain/repositories/i_journal_repository.dart';

class JournalRepositoryImpl implements IJournalRepository {
  final AppDatabase db;
  static const _uuid = Uuid();

  JournalRepositoryImpl(this.db);

  @override
  Future<List<JournalEntry>> getEntries({
    required String userId,
    String? moodFilter,
    int? limit,
  }) async {
    final query = db.select(db.journalEntries)
      ..where((t) => t.userId.equals(userId))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    if (limit != null) {
      query.limit(limit);
    }

    final rows = await query.get();

    final filtered = moodFilter != null
        ? rows.where((r) => r.moodTag == moodFilter).toList()
        : rows;

    return filtered.map(_toEntity).toList();
  }

  @override
  Future<String> createEntry({
    required String userId,
    required String content,
    String? moodTag,
    String? sourceExerciseId,
    String? sourceExerciseName,
  }) async {
    final entryId = _uuid.v4();
    final now = DateTime.now().toUtc();

    final companion = JournalEntriesCompanion(
      entryId: Value(entryId),
      userId: Value(userId),
      createdAt: Value(now),
      content: Value(content),
      moodTag: Value(moodTag),
      sourceExerciseId: Value(sourceExerciseId),
      sourceExerciseName: Value(sourceExerciseName),
    );

    await db.into(db.journalEntries).insert(companion);
    return entryId;
  }

  @override
  Future<void> updateEntry({
    required String entryId,
    required String content,
    String? moodTag,
  }) async {
    final row = await (db.select(db.journalEntries)
      ..where((t) => t.entryId.equals(entryId))).getSingleOrNull();
    if (row != null) {
      await (db.update(db.journalEntries)
        ..where((t) => t.id.equals(row.id)))
          .write(JournalEntriesCompanion(
            content: Value(content),
            moodTag: Value(moodTag),
            updatedAt: Value(DateTime.now().toUtc()),
          ));
    }
  }

  @override
  Future<void> deleteEntry(String entryId) async {
    final row = await (db.select(db.journalEntries)
      ..where((t) => t.entryId.equals(entryId))).getSingleOrNull();
    if (row != null) {
      await (db.delete(db.journalEntries)
        ..where((t) => t.id.equals(row.id))).go();
    }
  }

  JournalEntry _toEntity(DbJournalEntry m) => JournalEntry(
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

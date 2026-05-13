import '../../domain/entities/journal_entry.dart';

/// Abstract interface for journal entry persistence.
abstract class IJournalRepository {
  Future<List<JournalEntry>> getEntries({
    required String userId,
    String? moodFilter,
    int? limit,
  });

  Future<String> createEntry({
    required String userId,
    required String content,
    String? moodTag,
    String? sourceExerciseId,
    String? sourceExerciseName,
  });

  Future<void> updateEntry({
    required String entryId,
    required String content,
    String? moodTag,
  });

  Future<void> deleteEntry(String entryId);
}
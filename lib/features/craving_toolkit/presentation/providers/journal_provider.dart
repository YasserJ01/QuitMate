import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/journal_repository_impl.dart';
import '../../domain/entities/journal_entry.dart';
import '../../domain/repositories/i_journal_repository.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

// ─── Repository ────────────────────────────────────────────────────────────

final journalRepositoryProvider = Provider<IJournalRepository>((ref) {
  return JournalRepositoryImpl();
});

// ─── Journal list (optionally filtered by mood) ────────────────────────────

final journalEntriesProvider = FutureProvider.autoDispose
    .family<List<JournalEntry>, String?>((ref, moodFilter) async {
  final userId = await ref.watch(currentUserIdProvider.future);
  if (userId == null) return [];
  final repo = ref.watch(journalRepositoryProvider);
  return repo.getEntries(userId: userId, moodFilter: moodFilter);
});

// ─── Journal notifier ──────────────────────────────────────────────────────

class JournalNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<String> createEntry({
    required String content,
    String? moodTag,
    String? sourceExerciseId,
    String? sourceExerciseName,
  }) async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) throw Exception('No user ID');
    final repo = ref.read(journalRepositoryProvider);
    final entryId = await repo.createEntry(
      userId: userId,
      content: content,
      moodTag: moodTag,
      sourceExerciseId: sourceExerciseId,
      sourceExerciseName: sourceExerciseName,
    );
    ref.invalidate(journalEntriesProvider);
    return entryId;
  }

  Future<void> updateEntry(String entryId, String content, String? moodTag) async {
    await ref.read(journalRepositoryProvider).updateEntry(
          entryId: entryId,
          content: content,
          moodTag: moodTag,
        );
    ref.invalidate(journalEntriesProvider);
  }

  Future<void> deleteEntry(String entryId) async {
    await ref.read(journalRepositoryProvider).deleteEntry(entryId);
    ref.invalidate(journalEntriesProvider);
  }
}

final journalNotifierProvider =
    AsyncNotifierProvider.autoDispose<JournalNotifier, void>(
  JournalNotifier.new,
);
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/journal_entry.dart';
import '../providers/journal_provider.dart';
import 'journal_entry_screen.dart';

/// Scrollable list of journal entries with mood filter and tap-to-edit.
class JournalListScreen extends ConsumerWidget {
  const JournalListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(journalEntriesProvider(null));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'New entry',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const JournalEntryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: entriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book, size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  const Text('No journal entries yet'),
                  const SizedBox(height: 8),
                  const Text('Start writing to track your journey'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return _JournalCard(
                entry: entry,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JournalEntryScreen(
                        sourceExerciseId: entry.id,
                      ),
                    ),
                  );
                },
                onDelete: () {
                  ref
                      .read(journalNotifierProvider.notifier)
                      .deleteEntry(entry.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _JournalCard extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _JournalCard({
    required this.entry,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final moodTag = entry.moodTag != null
        ? MoodTag.values.firstWhere(
            (t) => t.name == entry.moodTag,
            orElse: () => MoodTag.neutral,
          )
        : null;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _formatDate(entry.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  if (moodTag != null)
                    Text('${moodTag.emoji} ${moodTag.label}',
                        style: Theme.of(context).textTheme.bodySmall),
                  PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'delete') onDelete();
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete',
                            style: TextStyle(color: AppTheme.errorColor)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                entry.content,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (entry.sourceExerciseName != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'From: ${entry.sourceExerciseName}',
                    style: const TextStyle(
                        fontSize: 11, color: AppTheme.primaryColor),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
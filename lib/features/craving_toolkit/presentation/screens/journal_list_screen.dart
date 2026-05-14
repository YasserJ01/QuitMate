import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/journal_entry.dart';
import '../providers/journal_provider.dart';
import 'journal_entry_screen.dart';

/// Scrollable list of journal entries with mood filter and tap-to-edit.
class JournalListScreen extends ConsumerStatefulWidget {
  const JournalListScreen({super.key});

  @override
  ConsumerState<JournalListScreen> createState() => _JournalListScreenState();
}

class _JournalListScreenState extends ConsumerState<JournalListScreen> {
  String? _selectedMoodFilter;

  @override
  Widget build(BuildContext context) {
    final entriesAsync = ref.watch(journalEntriesProvider(_selectedMoodFilter));

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
      body: Column(
        children: [
          // Mood filter row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    label: const Text('All'),
                    selected: _selectedMoodFilter == null,
                    onSelected: (_) =>
                        setState(() => _selectedMoodFilter = null),
                    selectedColor:
                        AppTheme.primaryColor.withValues(alpha: 0.15),
                  ),
                  const SizedBox(width: 8),
                  ...MoodTag.values.map((tag) {
                    final selected = _selectedMoodFilter == tag.name;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text('${tag.emoji} ${tag.label}'),
                        selected: selected,
                        onSelected: (_) {
                          setState(() {
                            _selectedMoodFilter =
                                selected ? null : tag.name;
                          });
                        },
                        selectedColor: AppTheme.primaryColor
                            .withValues(alpha: 0.15),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // Entry list
          Expanded(
            child: entriesAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (entries) {
                if (entries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.book,
                            size: 80, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        const Text('No journal entries yet'),
                        const SizedBox(height: 8),
                        const Text(
                            'Start writing to track your journey'),
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
                              existingEntry: entry,
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
          ),
        ],
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
                            style:
                                TextStyle(color: AppTheme.errorColor)),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color:
                        AppTheme.primaryColor.withValues(alpha: 0.08),
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
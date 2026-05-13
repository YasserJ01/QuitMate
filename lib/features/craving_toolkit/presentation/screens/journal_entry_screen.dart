import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/journal_entry.dart';
import '../providers/journal_provider.dart';

/// Full-screen journal entry editor with mood tags and auto-save.
class JournalEntryScreen extends ConsumerStatefulWidget {
  final String? sourceExerciseId;
  final String? sourceExerciseName;

  const JournalEntryScreen({
    super.key,
    this.sourceExerciseId,
    this.sourceExerciseName,
  });

  @override
  ConsumerState<JournalEntryScreen> createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends ConsumerState<JournalEntryScreen> {
  final _contentController = TextEditingController();
  String? _selectedMood;
  Timer? _autoSaveTimer;
  bool _hasSaved = false;

  @override
  void initState() {
    super.initState();
    _startAutoSave();
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    _contentController.dispose();
    super.dispose();
  }

  void _startAutoSave() {
    _autoSaveTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (_contentController.text.trim().isNotEmpty && !_hasSaved) {
        _save();
      }
    });
  }

  Future<void> _save() async {
    if (_contentController.text.trim().isEmpty) return;
    try {
      await ref.read(journalNotifierProvider.notifier).createEntry(
            content: _contentController.text.trim(),
            moodTag: _selectedMood,
            sourceExerciseId: widget.sourceExerciseId,
            sourceExerciseName: widget.sourceExerciseName,
          );
      _hasSaved = true;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
        actions: [
          TextButton(
            onPressed: () async {
              await _save();
              if (mounted) Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mood tag row
            Text('How are you feeling?',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: MoodTag.values.map((tag) {
                final selected = _selectedMood == tag.name;
                return FilterChip(
                  label: Text('${tag.emoji} ${tag.label}'),
                  selected: selected,
                  onSelected: (_) {
                    setState(() {
                      _selectedMood = selected ? null : tag.name;
                    });
                  },
                  selectedColor: AppTheme.primaryColor.withValues(alpha: 0.15),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // Text field
            TextField(
              controller: _contentController,
              maxLines: null,
              minLines: 10,
              decoration: const InputDecoration(
                hintText: 'Write whatever comes to mind...',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
    );
  }
}
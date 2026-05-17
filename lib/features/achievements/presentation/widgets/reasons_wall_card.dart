import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/services/database/isar_service.dart';
import '../../../onboarding/data/models/user_profile.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// Displays the user's personal reasons/motivations on the dashboard.
/// Shows up to 3 reasons with a "View all" or "Edit" CTA.
class ReasonsWallCard extends ConsumerWidget {
  const ReasonsWallCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsync = ref.watch(currentUserIdProvider);

    return userIdAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (userId) {
        if (userId == null) return const SizedBox.shrink();
        return _buildWithProfile(context, ref, userId);
      },
    );
  }

  Future<UserProfile?> _loadProfile(WidgetRef ref, String userId) async {
    final repo = ref.read(profileRepositoryProvider);
    return repo.getProfile(userId);
  }

  Widget _buildWithProfile(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) {
    // Load profile via repository
    final profileFuture = _loadProfile(ref, userId);

    return FutureBuilder<UserProfile?>(
      future: profileFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }
        return _buildContent(context, ref, userId, snapshot.data!);
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    String userId,
    UserProfile profile,
  ) {
    final reasons = profile.reasons;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Text(
                  'My Reasons',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _openEditSheet(context, ref, userId, profile),
                  icon: Icon(
                    reasons.isEmpty ? Icons.add : Icons.edit,
                    size: 18,
                  ),
                  label: Text(reasons.isEmpty ? 'Add' : 'Edit'),
                ),
              ],
            ),
            if (reasons.isEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Add the reasons why you want to quit or reduce.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
            ] else ...[
              const SizedBox(height: 12),
              ...reasons.map(
                    (reason) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ',
                              style: TextStyle(fontSize: 16)),
                          Expanded(
                            child: Text(
                              reason,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }

  void _openEditSheet(
    BuildContext context,
    WidgetRef ref,
    String userId,
    UserProfile profile,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _ReasonsWallEditSheet(
        initialReasons: List<String>.from(profile.reasons),
        onSave: (reasons) => _saveReasons(ref, userId, profile, reasons),
      ),
    );
  }

  Future<void> _saveReasons(
    WidgetRef ref,
    String userId,
    UserProfile profile,
    List<String> reasons,
  ) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      profile.reasons = reasons;
      await isar.userProfiles.put(profile);
    });
  }
}

// ─── Edit sheet ────────────────────────────────────────────────────────────

class _ReasonsWallEditSheet extends StatefulWidget {
  final List<String> initialReasons;
  final void Function(List<String> reasons) onSave;

  const _ReasonsWallEditSheet({
    required this.initialReasons,
    required this.onSave,
  });

  @override
  State<_ReasonsWallEditSheet> createState() => _ReasonsWallEditSheetState();
}

class _ReasonsWallEditSheetState extends State<_ReasonsWallEditSheet> {
  late final List<TextEditingController> _controllers;
  late final List<String> _reasons;

  @override
  void initState() {
    super.initState();
    _reasons = List.from(widget.initialReasons);
    _controllers = _reasons.map((r) => TextEditingController(text: r)).toList();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Reasons',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 4),
          Text(
            'What motivates you to stay on track?',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _controllers.length + 1,
              itemBuilder: (context, index) {
                if (index == _controllers.length) {
                  // "Add reason" button
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: OutlinedButton.icon(
                      onPressed: _addReason,
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add reason'),
                    ),
                  );
                }
                return _ReasonRow(
                  controller: _controllers[index],
                  onRemove: () => _removeReason(index),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  void _addReason() {
    setState(() {
      _reasons.add('');
      _controllers.add(TextEditingController());
    });
  }

  void _removeReason(int index) {
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
      _reasons.removeAt(index);
    });
  }

  void _save() {
    final cleaned = _controllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();
    widget.onSave(cleaned);
    Navigator.pop(context);
  }
}

class _ReasonRow extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onRemove;

  const _ReasonRow({
    required this.controller,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'I want to quit because...',
                isDense: true,
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.remove_circle_outline,
                color: Colors.red, size: 20),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
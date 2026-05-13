import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/relapse_provider.dart';

/// Dedicated screen for editing custom relapse plan steps.
///
/// Replaces the old dialog-push-dialog pattern with a proper route
/// using [ReorderableListView] for drag-to-reorder.
class EditCustomStepsScreen extends ConsumerStatefulWidget {
  final List<String> initialSteps;

  const EditCustomStepsScreen({super.key, required this.initialSteps});

  @override
  ConsumerState<EditCustomStepsScreen> createState() =>
      _EditCustomStepsScreenState();
}

class _EditCustomStepsScreenState extends ConsumerState<EditCustomStepsScreen> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = widget.initialSteps
        .map((s) => TextEditingController(text: s))
        .toList();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Relapse Plan Steps'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Drag to reorder. Steps to follow if you experience a relapse.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.textSecondary),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _controllers.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  final c = _controllers.removeAt(oldIndex);
                  _controllers.insert(newIndex, c);
                });
              },
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey('step_$index'),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${index + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor)),
                        const Icon(Icons.drag_handle, size: 18),
                      ],
                    ),
                    title: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        hintText: 'Step ${index + 1}',
                        border: InputBorder.none,
                      ),
                      maxLines: 2,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete,
                          color: AppTheme.errorColor, size: 20),
                      onPressed: () {
                        setState(() {
                          _controllers[index].dispose();
                          _controllers.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _controllers.add(TextEditingController());
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Step'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _save() {
    final steps = _controllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    ref.read(relapseNotifierProvider.notifier).updateCustomSteps(steps);
    Navigator.pop(context);
  }
}
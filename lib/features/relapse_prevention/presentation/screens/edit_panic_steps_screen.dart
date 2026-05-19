import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/relapse_models.dart';
import '../providers/relapse_provider.dart';

class EditPanicStepsScreen extends ConsumerStatefulWidget {
  const EditPanicStepsScreen({super.key});

  @override
  ConsumerState<EditPanicStepsScreen> createState() => _EditPanicStepsScreenState();
}

class _EditPanicStepsScreenState extends ConsumerState<EditPanicStepsScreen> {
  List<PanicStep> _steps = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Use post-frame callback to ensure widget tree is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSteps();
    });
  }

  Future<void> _loadSteps() async {
    final repository = ref.read(relapseRepositoryProvider);
    final userId = await ref.read(secureStorageProvider).getUserId();
    if (userId == null) return;
    final plan = await repository.getPlanFresh(userId);
    if (plan == null) return;
    
    setState(() {
      // Create deep copies of steps to avoid reference issues
        _steps = plan.panicSteps.map((step) {
        return PanicStep(
          title: step.title,
          description: step.description,
          icon: step.icon,
          actionType: step.actionType,
          contactId: step.contactId,
          actionData: step.actionData,
          displayOrder: step.displayOrder,
        );
      }).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Panic Steps'),
        actions: [
          TextButton(
            onPressed: () async {
              await ref.read(relapseNotifierProvider.notifier).resetPanicSteps();
              Navigator.pop(context);
            },
            child: const Text('Reset to Default'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Configure the 3 steps shown in panic mode',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _steps.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final step = _steps.removeAt(oldIndex);
                  _steps.insert(newIndex, step);
                  
                  // Update display order
                  for (int i = 0; i < _steps.length; i++) {
                    _steps[i].displayOrder = i;
                  }
                });
              },
              itemBuilder: (context, index) {
                final step = _steps[index];
                return Card(
                  key: ValueKey(step.displayOrder),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const Icon(Icons.drag_handle, size: 20),
                      ],
                    ),
                    title: Row(
                      children: [
                        Text(step.icon, style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Expanded(child: Text(step.title)),
                      ],
                    ),
                    subtitle: Text(step.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editStep(index),
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
              child: ElevatedButton(
                onPressed: _saveSteps,
                child: const Text('Save Changes'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _editStep(int index) {
    final step = _steps[index];
    final titleController = TextEditingController(text: step.title);
    final descriptionController = TextEditingController(text: step.description);
    final iconController = TextEditingController(text: step.icon);
    PanicActionType selectedType = step.actionType;
    String? selectedActionData = step.actionData;



    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Edit Step ${index + 1}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: iconController,
                  decoration: const InputDecoration(
                    labelText: 'Icon (emoji)',
                    hintText: 'e.g., 🫁, 📞, 👁️',
                  ),
                  maxLength: 2,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Short, clear title',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Detailed instructions',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<PanicActionType>(
                  initialValue: selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Action Type',
                  ),
                  items: PanicActionType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() {
                        selectedType = value;
                        // Reset action data when type changes
                        selectedActionData = _getDefaultActionData(value);

                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                
                // Show specific technique selection based on action type
                if (selectedType == PanicActionType.breathing)
                  _buildBreathingPatternSelector(selectedActionData, (value) {
                    setDialogState(() {
                      selectedActionData = value;

                    });
                  }),
                
                if (selectedType == PanicActionType.grounding)
                  _buildGroundingExerciseSelector(selectedActionData, (value) {
                    setDialogState(() {
                      selectedActionData = value;

                    });
                  }),
                
                if (selectedType == PanicActionType.cbt)
                  _buildCbtTechniqueSelector(selectedActionData, (value) {
                    setDialogState(() {
                      selectedActionData = value;

                    });
                  }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppStrings.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step.icon = iconController.text.trim();
                  step.title = titleController.text.trim();
                  step.description = descriptionController.text.trim();
                  step.actionType = selectedType;
                  step.actionData = selectedActionData;
                });
                Navigator.pop(context);
              },
              child: const Text(AppStrings.save),
            ),
          ],
        ),
      ),
    );
  }

  String? _getDefaultActionData(PanicActionType type) {
    switch (type) {
      case PanicActionType.breathing:
        return 'box';
      case PanicActionType.grounding:
        return 'fiveSenses';
      case PanicActionType.cbt:
        return 'urgeSurfing';
      default:
        return null;
    }
  }

  Widget _buildBreathingPatternSelector(String? selectedValue, ValueChanged<String> onChanged) {
    final patterns = {
      'box': '🟦 Box Breathing (4-4-4-4)',
      'relaxing': '😌 Relaxing Breath (4-7-8)',
      'energizing': '⚡ Energizing Breath',
      'calm': '🧘 Calming Breath',
    };

    return DropdownButtonFormField<String>(
      initialValue: selectedValue ?? 'box',
      decoration: const InputDecoration(
        labelText: 'Breathing Pattern',
        helperText: 'Choose which breathing exercise to use',
      ),
      items: patterns.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }

  Widget _buildGroundingExerciseSelector(String? selectedValue, ValueChanged<String> onChanged) {
    final exercises = {
      'fiveSenses': '👁️ 5 Senses (5-4-3-2-1)',
      'bodyAwareness': '🧘 Body Scan',
      'objectFocus': '🎯 Object Focus',
      'counting': '🔢 Counting Exercise',
      'coldWater': '💧 Cold Water',
    };

    return DropdownButtonFormField<String>(
      initialValue: selectedValue ?? 'fiveSenses',
      decoration: const InputDecoration(
        labelText: 'Grounding Exercise',
        helperText: 'Choose which grounding technique to use',
      ),
      items: exercises.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }

  Widget _buildCbtTechniqueSelector(String? selectedValue, ValueChanged<String> onChanged) {
    final techniques = {
      'urgeSurfing': '🌊 Urge Surfing',
      'thoughtChallenge': '💭 Thought Challenge',
      'consequenceAnalysis': '⚖️ Consequence Analysis',
      'delayTactic': '⏱️ Delay Tactic',
      'alternativeBehavior': '🔄 Alternative Behavior',
    };

    return DropdownButtonFormField<String>(
      initialValue: selectedValue ?? 'urgeSurfing',
      decoration: const InputDecoration(
        labelText: 'CBT Technique',
        helperText: 'Choose which CBT technique to use',
      ),
      items: techniques.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }

  Future<void> _saveSteps() async {
    try {
      await ref.read(relapseNotifierProvider.notifier).updatePanicSteps(_steps);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Panic steps updated successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving steps: $e')),
        );
      }
    }
  }
}

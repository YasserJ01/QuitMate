import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../craving_toolkit/presentation/screens/craving_toolkit_screen.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../providers/tracking_provider.dart';
import '../providers/statistics_provider.dart';
import '../../data/models/log_entry.dart';
import '../../data/models/craving_entry.dart';

class QuickLogSheet extends ConsumerStatefulWidget {
  const QuickLogSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<QuickLogSheet> createState() => _QuickLogSheetState();
}

class _QuickLogSheetState extends ConsumerState<QuickLogSheet> {
  MoodType? _selectedMood;
  final List<String> _selectedTriggers = [];
  final int _cigaretteQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final quickLogState = ref.watch(quickLogProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Quick Log',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Log an event quickly (≤5 seconds)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 24),

              // Quick action buttons
              FutureBuilder(
                future: _getUserGoalType(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final goalType = snapshot.data!;
                  return _buildQuickActions(context, goalType, quickLogState);
                },
              ),

              const SizedBox(height: 24),

              // Optional: Mood selector
              Text(
                'How are you feeling? (Optional)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildMoodSelector(),

              const SizedBox(height: 24),

              // Optional: Common triggers
              Text(
                'Any triggers? (Optional)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildCommonTriggers(),

              if (quickLogState.error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.errorColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppTheme.errorColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          quickLogState.error!,
                          style: const TextStyle(color: AppTheme.errorColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(
      BuildContext context,
      GoalType goalType,
      QuickLogState state,
      ) {
    final actions = <Widget>[];

    if (goalType == GoalType.quitSmoking || goalType == GoalType.both) {
      actions.add(
        _buildQuickActionButton(
          context,
          icon: Icons.smoking_rooms,
          label: 'Smoked',
          emoji: '🚬',
          color: AppTheme.errorColor,
          isLoading: state.isLogging,
          onTap: () => _logCigarette(context),
        ),
      );
    }

    if (goalType == GoalType.reduceMasturbation || goalType == GoalType.both) {
      actions.add(
        _buildQuickActionButton(
          context,
          icon: Icons.warning_amber_rounded,
          label: 'Episode',
          emoji: '📱',
          color: AppTheme.warningColor,
          isLoading: state.isLogging,
          onTap: () => _logEpisode(context),
        ),
      );
    }

    actions.add(
      _buildQuickActionButton(
        context,
        icon: Icons.psychology,
        label: 'Craving',
        emoji: '😤',
        color: AppTheme.primaryColor,
        isLoading: state.isLogging,
        onTap: () => _logCraving(context),
      ),
    );

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: actions,
    );
  }

  Widget _buildQuickActionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String emoji,
        required Color color,
        required bool isLoading,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: (MediaQuery.of(context).size.width - 72) / 2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            if (isLoading)
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: MoodType.values.map((mood) {
          final isSelected = _selectedMood == mood;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(mood.emoji, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 6),
                  Text(mood.displayName),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedMood = selected ? mood : null;
                });
              },
              selectedColor: AppTheme.primaryColor.withOpacity(0.2),
              checkmarkColor: AppTheme.primaryColor,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCommonTriggers() {
    final commonTriggers = ['Stress', 'Boredom', 'Social', 'Anxiety'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: commonTriggers.map((trigger) {
        final isSelected = _selectedTriggers.contains(trigger);
        return FilterChip(
          label: Text(trigger),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedTriggers.add(trigger);
              } else {
                _selectedTriggers.remove(trigger);
              }
            });
          },
          selectedColor: AppTheme.primaryColor.withOpacity(0.2),
          checkmarkColor: AppTheme.primaryColor,
        );
      }).toList(),
    );
  }

  Future<void> _logCigarette(BuildContext context) async {
    final success = await ref.read(quickLogProvider.notifier).logCigarette(
      quantity: _cigaretteQuantity,
      triggers: _selectedTriggers.isNotEmpty ? _selectedTriggers : null,
      mood: _selectedMood,
    );

    if (success && mounted) {
      // Refresh statistics
      ref.read(statisticsProvider.notifier).refresh();

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cigarette logged'),
          backgroundColor: AppTheme.successColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _logEpisode(BuildContext context) async {
    final success = await ref.read(quickLogProvider.notifier).logEpisode(
      triggers: _selectedTriggers.isNotEmpty ? _selectedTriggers : null,
      mood: _selectedMood,
    );

    if (success && mounted) {
      // Refresh statistics
      ref.read(statisticsProvider.notifier).refresh();

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Episode logged'),
          backgroundColor: AppTheme.successColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _logCraving(BuildContext context) async {
    // Show intensity selector
    final intensity = await showDialog<CravingIntensity>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Craving Intensity'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: CravingIntensity.values.map((intensity) {
            return ListTile(
              title: Text(intensity.displayName),
              subtitle: LinearProgressIndicator(
                value: intensity.value / 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getIntensityColor(intensity),
                ),
              ),
              onTap: () => Navigator.pop(context, intensity),
            );
          }).toList(),
        ),
      ),
    );

    if (intensity == null || !mounted) return;

    final success = await ref.read(quickLogProvider.notifier).logCraving(
      intensity: intensity,
      triggers: _selectedTriggers.isNotEmpty ? _selectedTriggers : null,
    );

    if (success && mounted) {
      // Refresh statistics
      ref.read(statisticsProvider.notifier).refresh();

      // Get the newly created craving to pass its ID to the toolkit
      final newCraving = ref.read(quickLogProvider).lastLog;

      Navigator.pop(context); // Close the quick log sheet

      // Show toolkit option dialog
      final useToolkit = await showDialog<bool>(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: const Text('Craving Logged'),
              content: const Text(
                'Would you like to use the Craving Toolkit to help manage this craving?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Maybe Later'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true); // First, close the dialog.
                    Navigator.push(      // Then, navigate to the toolkit screen.
                      context,
                      MaterialPageRoute(
                        builder: (context) => CravingToolkitScreen(
                          cravingId: newCraving?.id,
                        ),
                      ),
                    );
                  },
                  child: const Text('Open Toolkit'),
                ),
              ],
            ),
      );


      if (useToolkit == true && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const CravingToolkitScreen(
                  cravingId: null, // We can link this to the craving entry if needed
                ),
          ),
        );
      }
    }
  }

  Color _getIntensityColor(CravingIntensity intensity) {
    switch (intensity) {
      case CravingIntensity.mild:
        return Colors.green;
      case CravingIntensity.moderate:
        return Colors.orange;
      case CravingIntensity.strong:
        return Colors.deepOrange;
      case CravingIntensity.veryStrong:
        return Colors.red;
    }
  }

  Future<GoalType> _getUserGoalType() async {
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return GoalType.both;

    final profileRepo = ref.read(profileRepositoryProvider);
    final profile = await profileRepo.getProfile(userId);

    return profile?.goalType ?? GoalType.both;
  }
}
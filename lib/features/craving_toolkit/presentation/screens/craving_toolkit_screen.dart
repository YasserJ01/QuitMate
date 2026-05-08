import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/toolkit_models.dart';
import '../providers/toolkit_provider.dart';
import 'breathing_exercise_screen.dart';
import 'cbt_technique_screen.dart';
import 'grounding_exercise_screen.dart';
import 'distraction_chooser_screen.dart';
import 'toolkit_history_screen.dart';

class CravingToolkitScreen extends ConsumerWidget {
  final int? cravingId;

  const CravingToolkitScreen({
    super.key,
    this.cravingId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(toolkitStatisticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Craving Toolkit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'View History',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToolkitHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          _buildHeader(context),
          const SizedBox(height: 24),

          // Emergency tip
          _buildEmergencyTip(context),
          const SizedBox(height: 24),

          // Main categories
          Text(
            'Choose a Technique',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          _buildCategoryCard(
            context,
            title: 'Breathing Exercises',
            subtitle: '30-120 seconds • Calm your nervous system',
            icon: Icons.air,
            emoji: '🫁',
            color: AppTheme.primaryColor,
            onTap: () => _showBreathingOptions(context),
          ),
          const SizedBox(height: 12),

          _buildCategoryCard(
            context,
            title: 'CBT Techniques',
            subtitle: '2-5 minutes • Challenge your thoughts',
            icon: Icons.psychology,
            emoji: '🧠',
            color: AppTheme.successColor,
            onTap: () => _showCbtOptions(context),
          ),
          const SizedBox(height: 12),

          _buildCategoryCard(
            context,
            title: 'Grounding Exercises',
            subtitle: '1-3 minutes • Stay present',
            icon: Icons.self_improvement,
            emoji: '👁️',
            color: AppTheme.warningColor,
            onTap: () => _showGroundingOptions(context),
          ),
          const SizedBox(height: 12),

          _buildCategoryCard(
            context,
            title: 'Distraction Activities',
            subtitle: '3-10 minutes • Redirect your focus',
            icon: Icons.games,
            emoji: '🎮',
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DistractionChooserScreen(
                    cravingId: cravingId,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Statistics
          statsAsync.when(
            data: (stats) => _buildStatistics(context, stats),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You\'ve Got This!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cravings pass. Let\'s work through this together.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyTip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.warningColor.withValues(alpha:0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb, color: AppTheme.warningColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Tip',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Most cravings peak and pass within 3-5 minutes. You can ride this wave!',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required String emoji,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withValues(alpha:0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatistics(BuildContext context, ToolkitStatistics stats) {
    final totalSessions = stats.totalBreathingSessions +
        stats.totalCbtSessions +
        stats.totalGroundingSessions +
        stats.totalDistractionSessions;

    if (totalSessions == 0) {
      return const SizedBox();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Sessions',
                    value: '$totalSessions',
                    icon: Icons.check_circle,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    label: 'Most Effective',
                    value: stats.mostEffectiveTechnique,
                    icon: Icons.star,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, {
        required String label,
        required String value,
        required IconData icon,
      }) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showBreathingOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBreathingOptionsSheet(context),
    );
  }

  Widget _buildBreathingOptionsSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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

          Text(
            'Choose Breathing Pattern',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          ...BreathingPattern.values
              .where((pattern) => pattern != BreathingPattern.custom)
              .map((pattern) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha:0.1),
                  child: Text(pattern.emoji, style: const TextStyle(fontSize: 20)),
                ),
                title: Text(pattern.displayName),
                subtitle: Text(pattern.description),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreathingExerciseScreen(
                        pattern: pattern,
                        cravingId: cravingId,
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showCbtOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildCbtOptionsSheet(context),
    );
  }

  Widget _buildCbtOptionsSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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

          Text(
            'Choose CBT Technique',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          ...CbtTechnique.values.map((technique) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.successColor.withValues(alpha:0.1),
                  child: Text(technique.emoji, style: const TextStyle(fontSize: 20)),
                ),
                title: Text(technique.displayName),
                subtitle: Text(
                  '${technique.description}\n~${technique.estimatedMinutes} min',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CbtTechniqueScreen(
                        technique: technique,
                        cravingId: cravingId,
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showGroundingOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildGroundingOptionsSheet(context),
    );
  }

  Widget _buildGroundingOptionsSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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

          Text(
            'Choose Grounding Exercise',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          ...GroundingExercise.values.map((exercise) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.warningColor.withValues(alpha:0.1),
                  child: Text(exercise.emoji, style: const TextStyle(fontSize: 20)),
                ),
                title: Text(exercise.displayName),
                subtitle: Text(
                  '${exercise.description}\n~${exercise.estimatedMinutes} min',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroundingExerciseScreen(
                        exercise: exercise,
                        cravingId: cravingId,
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

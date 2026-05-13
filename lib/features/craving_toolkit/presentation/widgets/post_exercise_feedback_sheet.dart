import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Bottom sheet shown after every exercise completion (or early exit).
///
/// Asks "Did this help?" with three rating options.
class PostExerciseFeedbackSheet extends StatelessWidget {
  final String exerciseName;
  final bool wasCompleted;
  final ValueChanged<int> onRatingSelected;

  const PostExerciseFeedbackSheet({
    super.key,
    required this.exerciseName,
    required this.wasCompleted,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            wasCompleted ? 'Did this help?' : 'How was that?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Your feedback helps personalize your toolkit.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          _FeedbackOption(
            emoji: '😊',
            label: 'Yes, it helped',
            color: AppTheme.successColor,
            onTap: () {
              onRatingSelected(0); // helped
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          _FeedbackOption(
            emoji: '🤷',
            label: 'Somewhat',
            color: AppTheme.warningColor,
            onTap: () {
              onRatingSelected(1); // somewhat
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          _FeedbackOption(
            emoji: '😕',
            label: 'Not really',
            color: AppTheme.errorColor,
            onTap: () {
              onRatingSelected(2); // notReally
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedbackOption extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _FeedbackOption({
    required this.emoji,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color.withValues(alpha: 0.3)),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
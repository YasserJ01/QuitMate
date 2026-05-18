import 'package:flutter/material.dart';

class RecoveryStatsCard extends StatelessWidget {
  final int recoveryCount;
  final String? topTrigger; // most common trigger during lapses
  final int? longestPostRecoveryStreak;

  const RecoveryStatsCard({
    super.key,
    required this.recoveryCount,
    this.topTrigger,
    this.longestPostRecoveryStreak,
  });

  @override
  Widget build(BuildContext context) {
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
                const Icon(Icons.heart_broken, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                Text('Recovery Journey',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'You have recovered $recoveryCount ${recoveryCount == 1 ? 'time' : 'times'}.',
              style: theme.textTheme.bodyMedium,
            ),
            if (topTrigger != null) ...[
              const SizedBox(height: 8),
              Text('Most common trigger: $topTrigger',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey.shade600)),
            ],
            if (longestPostRecoveryStreak != null &&
                longestPostRecoveryStreak! > 0) ...[
              const SizedBox(height: 4),
              Text(
                'Longest streak after a recovery: $longestPostRecoveryStreak days',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
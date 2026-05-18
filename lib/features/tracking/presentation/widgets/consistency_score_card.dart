import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ConsistencyScoreCard extends StatelessWidget {
  final int checkinDays;
  final int totalDays;

  const ConsistencyScoreCard({
    super.key,
    required this.checkinDays,
    required this.totalDays,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final score = totalDays > 0
        ? (checkinDays / totalDays).clamp(0.0, 1.0)
        : 0.0;
    final percent = (score * 100).toInt();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$percent%',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consistency',
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    'You checked in on $checkinDays of $totalDays days',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
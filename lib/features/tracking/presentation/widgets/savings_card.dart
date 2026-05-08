import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/statistics.dart';

class SavingsCard extends StatelessWidget {
  final Statistics statistics;
  final bool hasData; // gates on completeness.hasMoneySavingsData

  const SavingsCard({
    super.key,
    required this.statistics,
    this.hasData = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasData) return const SizedBox.shrink();

    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.successColor,
              AppTheme.successColor.withGreen(200),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
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
                    Icons.savings,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Money Saved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '\$${statistics.moneySaved.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Out of \$${statistics.potentialMoneySaved.toStringAsFixed(2)} potential',
              style: TextStyle(
                color: Colors.white.withValues(alpha:0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha:0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _getSavingsMessage(statistics.moneySaved),
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSavingsMessage(double amount) {
    if (amount < 10) {
      return 'Keep going! Every dollar counts.';
    } else if (amount < 50) {
      return 'That\'s a nice dinner saved!';
    } else if (amount < 100) {
      return 'You could buy some great books or games!';
    } else if (amount < 500) {
      return 'That\'s a weekend trip saved!';
    } else if (amount < 1000) {
      return 'You could buy a nice gadget!';
    } else {
      return 'That\'s serious money! Time for something special?';
    }
  }
}

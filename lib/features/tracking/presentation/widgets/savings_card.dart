import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';
import '../../data/models/statistics.dart';
import 'dashboard_card.dart';
import 'animated_decimal_counter.dart';

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

    final progress = statistics.potentialMoneySaved > 0
        ? (statistics.moneySaved / statistics.potentialMoneySaved).clamp(0.0, 1.0)
        : 0.0;

    return Semantics(
      label: 'Money saved: \$${statistics.moneySaved.toStringAsFixed(2)}',
      child: DashboardCard(
        gradient: DashboardTheme.successGradient(context),
        accent: DashboardTheme.success(context),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.savings, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Money Saved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AnimatedDecimalCounter(
              target: statistics.moneySaved,
              formatter: (v) => '\$${v.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1,
                height: 1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'of \$${statistics.potentialMoneySaved.toStringAsFixed(2)} potential',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (statistics.potentialMoneySaved > 0) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.white.withValues(alpha: 0.25),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _getSavingsMessage(statistics.moneySaved),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
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

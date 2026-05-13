import 'package:flutter/material.dart';

/// Recovery statistics card for the Progress tab.
///
/// Displays total recoveries, most common trigger, and recovery rate.
class RecoveryStatsCard extends StatelessWidget {
  final int recoveryCount;
  final int totalLapses;
  final List<String> commonTriggers;

  const RecoveryStatsCard({
    super.key,
    required this.recoveryCount,
    required this.totalLapses,
    required this.commonTriggers,
  });

  double get _recoveryRate =>
      totalLapses > 0 ? recoveryCount / totalLapses : 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('🛡️', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Text('Recovery Journey',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            _StatRow(
                label: 'Total recoveries', value: '$recoveryCount'),
            const SizedBox(height: 8),
            _StatRow(
                label: 'Recovery rate',
                value: '${(_recoveryRate * 100).round()}%'),
            if (commonTriggers.isNotEmpty) ...[
              const SizedBox(height: 8),
              _StatRow(
                label: 'Most common trigger',
                value: commonTriggers.first,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
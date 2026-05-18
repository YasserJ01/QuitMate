import 'package:flutter/material.dart';

/// Distress trend sparkline chart for reduction mode.
/// Requires ≥3 data points to render; shows empty state otherwise.
class DistressTrendChart extends StatelessWidget {
  final List<double> distressRatings; // 1–10, one per day (last 7 days)

  const DistressTrendChart({
    super.key,
    required this.distressRatings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (distressRatings.length < 3) {
      return _buildEmptyState(context, theme);
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Distress Trend',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Last ${distressRatings.length} days',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: CustomPaint(
                size: const Size(double.infinity, 100),
                painter: _DistressSparklinePainter(
                  ratings: distressRatings,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: _directionLabel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.trending_down, color: Colors.grey, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Log your daily check-in to see your distress trend over time.',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _directionLabel() {
    if (distressRatings.length < 2) return const SizedBox.shrink();

    final trend = _computeTrend();

    IconData icon;
    Color color;
    String label;

    if (trend > 0.1) {
      icon = Icons.trending_up;
      color = Colors.red.shade400;
      label = 'Distress is trending up';
    } else if (trend < -0.1) {
      icon = Icons.trending_down;
      color = Colors.green.shade400;
      label = 'Distress is trending down';
    } else {
      icon = Icons.trending_flat;
      color = Colors.grey;
      label = 'Distress is stable';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }

  /// Returns positive if distress is increasing, negative if decreasing.
  double _computeTrend() {
    if (distressRatings.length < 2) return 0;
    final firstHalf = distressRatings.take(distressRatings.length ~/ 2);
    final secondHalf = distressRatings.skip(distressRatings.length ~/ 2);
    final firstAvg =
        firstHalf.reduce((a, b) => a + b) / firstHalf.length;
    final secondAvg =
        secondHalf.reduce((a, b) => a + b) / secondHalf.length;
    return secondAvg - firstAvg;
  }
}

// ─── Sparkline painter ─────────────────────────────────────────────────────

class _DistressSparklinePainter extends CustomPainter {
  final List<double> ratings;
  final Color color;

  _DistressSparklinePainter({required this.ratings, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (ratings.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color.withValues(alpha: 0.3), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final fillPath = Path();
    final stepX = size.width / (ratings.length - 1);

    for (int i = 0; i < ratings.length; i++) {
      final x = i * stepX;
      final y = size.height - ((ratings[i] - 1) / 9 * size.height * 0.8);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath.lineTo((ratings.length - 1) * stepX, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DistressSparklinePainter oldDelegate) =>
      oldDelegate.ratings != ratings;
}
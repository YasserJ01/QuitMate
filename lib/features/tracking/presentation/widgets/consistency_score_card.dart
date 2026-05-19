import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

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
    final score = totalDays > 0
        ? (checkinDays / totalDays).clamp(0.0, 1.0)
        : 0.0;
    final percent = (score * 100).toInt();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color accentColor;
    final String message;
    if (percent >= 80) {
      accentColor = const Color(0xFF2E7D32);
      message = 'Outstanding consistency!';
    } else if (percent >= 50) {
      accentColor = const Color(0xFFF59E0B);
      message = 'Good progress, keep it up!';
    } else if (percent >= 25) {
      accentColor = const Color(0xFF6C63FF);
      message = 'You\'re getting started!';
    } else {
      accentColor = DashboardTheme.textSecondary(context);
      message = 'Start checking in daily';
    }

    return Semantics(
      label: 'Consistency: $checkinDays of $totalDays days, $percent percent',
      child: Container(
        decoration: BoxDecoration(
          color: DashboardTheme.surface(context),
          borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
          border: Border.all(
            color: DashboardTheme.cardBorder(context),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: isDark ? 0.1 : 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor,
                      accentColor.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$percent%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: -0.5,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consistency',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: DashboardTheme.textPrimary(context),
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: score,
                        minHeight: 6,
                        backgroundColor: accentColor.withValues(alpha: 0.12),
                        valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$checkinDays of $totalDays days',
                      style: TextStyle(
                        fontSize: 11,
                        color: DashboardTheme.textSecondary(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

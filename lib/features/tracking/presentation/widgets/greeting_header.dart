import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

/// A personalized greeting shown at the top of the dashboard.
///
/// Adapts the salutation to the time of day and addresses the user by their
/// nickname when one is set. Gives the screen a warm, human entry point
/// before the stats begin.
class GreetingHeader extends StatelessWidget {
  final String? nickname;

  const GreetingHeader({super.key, this.nickname});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final String salutation;
    final IconData icon;
    if (hour < 12) {
      salutation = 'Good morning';
      icon = Icons.wb_twilight;
    } else if (hour < 17) {
      salutation = 'Good afternoon';
      icon = Icons.wb_sunny_outlined;
    } else {
      salutation = 'Good evening';
      icon = Icons.nightlight_round;
    }

    final name = (nickname != null && nickname!.trim().isNotEmpty)
        ? nickname!.trim()
        : null;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 16, color: DashboardTheme.textSecondary(context)),
                  const SizedBox(width: 6),
                  Text(
                    salutation,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: DashboardTheme.textSecondary(context),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                name != null ? '$name 👋' : 'Welcome back 👋',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: DashboardTheme.textPrimary(context),
                      letterSpacing: -0.5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

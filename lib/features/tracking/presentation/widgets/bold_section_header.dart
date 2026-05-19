import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

class BoldSectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  const BoldSectionHeader({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: DashboardTheme.primary(context), size: 22),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: DashboardTheme.textPrimary(context),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 3,
          width: 40,
          decoration: BoxDecoration(
            gradient: DashboardTheme.heroGradient(context),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

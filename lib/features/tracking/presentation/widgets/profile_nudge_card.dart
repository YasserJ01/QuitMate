import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

/// A contextual nudge card shown when profile fields are missing.
/// Encourages users to complete optional fields by showing the feature
/// they unlock.
class ProfileNudgeCard extends StatelessWidget {
  final String message;
  final VoidCallback? onTap;

  const ProfileNudgeCard({
    super.key,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = DashboardTheme.primary(context);
    final radius = BorderRadius.circular(DashboardTheme.cardRadius);

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.06),
            borderRadius: radius,
            border: Border.all(color: primary.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.add_circle_outline, color: primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Complete your profile',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: primary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13,
                        color: DashboardTheme.textSecondary(context),
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Icon(Icons.chevron_right, color: primary),
            ],
          ),
        ),
      ),
    );
  }
}

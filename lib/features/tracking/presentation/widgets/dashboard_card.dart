import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

/// A unified surface for dashboard cards.
///
/// Standardizes the card look across the dashboard: themed surface color,
/// 24px radius, hairline border, soft shadow, and consistent padding. All
/// cards should be built on this rather than the legacy [Card] widget so the
/// dashboard reads as one cohesive design language in both light and dark
/// themes.
class DashboardCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  /// Optional accent used for the shadow tint. Defaults to a neutral shadow.
  final Color? accent;

  /// When provided, paints a gradient instead of the flat surface color.
  /// Used for "hero" stat cards (savings, time reclaimed).
  final Gradient? gradient;

  /// Hides the border. Useful for gradient cards where a border looks noisy.
  final bool showBorder;

  const DashboardCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.accent,
    this.gradient,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = BorderRadius.circular(DashboardTheme.cardRadius);
    final shadowColor = (accent ?? Colors.black)
        .withValues(alpha: isDark ? 0.18 : (accent != null ? 0.12 : 0.05));

    final content = Container(
      width: double.infinity,
      padding: padding ?? DashboardTheme.cardPadding,
      decoration: BoxDecoration(
        color: gradient == null ? DashboardTheme.surface(context) : null,
        gradient: gradient,
        borderRadius: radius,
        border: (showBorder && gradient == null)
            ? Border.all(color: DashboardTheme.cardBorder(context), width: 1)
            : null,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: gradient != null ? 20 : 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: content,
      ),
    );
  }
}

/// A small icon-in-rounded-tile header used at the top of most cards.
class DashboardCardHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color accent;
  final Widget? trailing;

  const DashboardCardHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.accent,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: accent, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: DashboardTheme.textPrimary(context),
                      letterSpacing: -0.3,
                    ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 12,
                    color: DashboardTheme.textSecondary(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

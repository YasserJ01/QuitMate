import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Shared wrapper widget for dashboard sections.
/// Provides consistent spacing, section headers, and optional empty-state messaging.
class DashboardSection extends StatelessWidget {
  final String title;
  final String? semanticsLabel;
  final List<Widget> children;
  final Widget? emptyState;
  final bool showHeader;

  const DashboardSection({
    super.key,
    required this.title,
    this.semanticsLabel,
    required this.children,
    this.emptyState,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final hasContent = children.isNotEmpty;

    return Semantics(
      label: semanticsLabel ?? '$title section',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            _SectionHeader(title: title),
            const SizedBox(height: 8),
          ],
          if (hasContent) ...children,
          if (!hasContent && emptyState != null) ...[
            _EmptyState(child: emptyState!),
          ],
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTheme.textPrimary,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final Widget child;
  const _EmptyState({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: child),
      ),
    );
  }
}

/// Standardized spacing between cards within a section.
class SectionSpacing extends StatelessWidget {
  const SectionSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}

/// 2x2 grid item for stat cards with consistent styling.
class StatGridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? semanticsLabel;

  const StatGridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel ?? '$label: $value',
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 2x2 grid container for stat items.
class StatGrid extends StatelessWidget {
  final List<Widget> children;
  const StatGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: children,
    );
  }
}

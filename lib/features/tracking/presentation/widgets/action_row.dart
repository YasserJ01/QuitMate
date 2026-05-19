import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

class ActionRow extends StatelessWidget {
  final List<DashboardAction> actions;
  const ActionRow({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: actions.map((action) {
        return Padding(
          padding: EdgeInsets.only(bottom: action == actions.last ? 0 : 10),
          child: _ActionTile(action: action),
        );
      }).toList(),
    );
  }
}

class _ActionTile extends StatefulWidget {
  final DashboardAction action;
  const _ActionTile({required this.action});

  @override
  State<_ActionTile> createState() => _ActionTileState();
}

class _ActionTileState extends State<_ActionTile> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.action.semanticsLabel ?? widget.action.label,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _scale = 0.97),
        onTapUp: (_) {
          setState(() => _scale = 1.0);
          widget.action.onPressed();
        },
        onTapCancel: () => setState(() => _scale = 1.0),
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              gradient: widget.action.gradient ?? DashboardTheme.heroGradient(context),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: (widget.action.gradientColor ?? DashboardTheme.primary(context))
                      .withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(widget.action.icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.action.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          letterSpacing: -0.3,
                        ),
                      ),
                      if (widget.action.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          widget.action.subtitle!,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardAction {
  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onPressed;
  final LinearGradient? gradient;
  final Color? gradientColor;
  final String? semanticsLabel;

  const DashboardAction({
    required this.icon,
    required this.label,
    this.subtitle,
    required this.onPressed,
    this.gradient,
    this.gradientColor,
    this.semanticsLabel,
  });
}

import 'package:flutter/material.dart';
import '../../../../core/theme/dashboard_theme.dart';

class ToolkitStrategy {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  const ToolkitStrategy({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

const toolkitStrategies = [
  ToolkitStrategy(
    id: 'breathing',
    name: 'Breathing Exercise',
    icon: Icons.air,
    color: Color(0xFF6C63FF),
  ),
  ToolkitStrategy(
    id: 'urge_surfing',
    name: 'Urge Surfing',
    icon: Icons.waves,
    color: Color(0xFF2196F3),
  ),
  ToolkitStrategy(
    id: 'distraction',
    name: 'Distraction',
    icon: Icons.gamepad,
    color: Color(0xFFFF9800),
  ),
  ToolkitStrategy(
    id: 'reframing',
    name: 'Cognitive Reframing',
    icon: Icons.lightbulb,
    color: Color(0xFF4CAF50),
  ),
  ToolkitStrategy(
    id: 'grounding',
    name: 'Grounding Exercise',
    icon: Icons.pin_drop,
    color: Color(0xFF9C27B0),
  ),
  ToolkitStrategy(
    id: 'journaling',
    name: 'Journaling',
    icon: Icons.edit_note,
    color: Color(0xFF795548),
  ),
];

class ToolkitStrategyChooser extends StatelessWidget {
  final Function(ToolkitStrategy) onSelected;
  const ToolkitStrategyChooser({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Which technique helped?',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: DashboardTheme.textPrimary(context),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: toolkitStrategies.map((strategy) {
              return _StrategyChip(
                strategy: strategy,
                onTap: () => onSelected(strategy),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _StrategyChip extends StatelessWidget {
  final ToolkitStrategy strategy;
  final VoidCallback onTap;
  const _StrategyChip({required this.strategy, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: strategy.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: strategy.color.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(strategy.icon, size: 18, color: strategy.color),
              const SizedBox(width: 8),
              Text(
                strategy.name,
                style: TextStyle(
                  color: strategy.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

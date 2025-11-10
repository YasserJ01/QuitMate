import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../domain/entities/goal_type.dart';

class GoalCard extends StatelessWidget {
  final GoalType goalType;
  final bool isSelected;
  final VoidCallback onTap;

  const GoalCard({
    Key? key,
    required this.goalType,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  String _getDescription() {
    switch (goalType) {
      case GoalType.quitSmoking:
        return 'Break free from nicotine addiction and improve your health';
      case GoalType.reduceMasturbation:
        return 'Build healthier habits and improve self-control';
      case GoalType.both:
        return 'Take on both challenges for complete transformation';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Emoji Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryColor.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    goalType.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goalType.displayName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : AppTheme.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getDescription(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              // Check Icon
              if (isSelected)
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/relapse_models.dart';

class PanicStepCard extends StatelessWidget {
  final PanicStep step;
  final int stepNumber;
  final VoidCallback onActionTap;

  const PanicStepCard({
    super.key,
    required this.step,
    required this.stepNumber,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: _getStepColor().withValues(alpha:0.3),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onActionTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step number and icon
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getStepColor(),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$stepNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    step.icon,
                    style: const TextStyle(fontSize: 40),
                  ),
                  const Spacer(),
                  Icon(
                    _getActionIcon(),
                    color: _getStepColor(),
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                step.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                step.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // Action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onActionTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getStepColor(),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_getActionIcon()),
                      const SizedBox(width: 8),
                      Text(
                        _getActionText(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStepColor() {
    switch (stepNumber) {
      case 1:
        return AppTheme.primaryColor;
      case 2:
        return AppTheme.successColor;
      case 3:
        return AppTheme.warningColor;
      default:
        return AppTheme.primaryColor;
    }
  }

  IconData _getActionIcon() {
    switch (step.actionType) {
      case PanicActionType.breathing:
        return Icons.air;
      case PanicActionType.contact:
        return Icons.phone;
      case PanicActionType.grounding:
        return Icons.self_improvement;
      case PanicActionType.custom:
        return Icons.play_arrow;
      case PanicActionType.cbt: //TODO
        return Icons.biotech;
    }
  }

  String _getActionText() {
    switch (step.actionType) {
      case PanicActionType.breathing:
        return 'Start Breathing';
      case PanicActionType.contact:
        return 'Call Contact';
      case PanicActionType.grounding:
        return 'Start Exercise';
      case PanicActionType.custom:
        return 'Start';
      case PanicActionType.cbt:
        return 'Start CBT techniques';
    }
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CbtEffectivenessDialog extends StatefulWidget {
  const CbtEffectivenessDialog({super.key});

  @override
  State<CbtEffectivenessDialog> createState() => _CbtEffectivenessDialogState();
}

class _CbtEffectivenessDialogState extends State<CbtEffectivenessDialog> {
  bool _wasHelpful = true;
  int _rating = 3;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How helpful was this technique?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Helpful toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text('Not Helpful'),
                selected: !_wasHelpful,
                onSelected: (selected) {
                  setState(() {
                    _wasHelpful = !selected;
                  });
                },
                selectedColor: AppTheme.errorColor.withValues(alpha:0.2),
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: const Text('Helpful'),
                selected: _wasHelpful,
                onSelected: (selected) {
                  setState(() {
                    _wasHelpful = selected;
                  });
                },
                selectedColor: AppTheme.successColor.withValues(alpha:0.2),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Rating
          const Text(
            'Rate the effectiveness:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final rating = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rating = rating;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    rating <= _rating ? Icons.star : Icons.star_border,
                    size: 36,
                    color: rating <= _rating
                        ? Colors.amber
                        : Colors.grey.shade400,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),

          Text(
            _getRatingLabel(_rating),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _getRatingColor(_rating),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Skip'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, {
            'wasHelpful': _wasHelpful,
            'rating': _rating,
          }),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  String _getRatingLabel(int rating) {
    switch (rating) {
      case 1:
        return 'Not Effective';
      case 2:
        return 'Slightly Effective';
      case 3:
        return 'Moderately Effective';
      case 4:
        return 'Very Effective';
      case 5:
        return 'Extremely Effective';
      default:
        return '';
    }
  }

  Color _getRatingColor(int rating) {
    if (rating <= 2) return AppTheme.errorColor;
    if (rating == 3) return AppTheme.warningColor;
    return AppTheme.successColor;
  }
}
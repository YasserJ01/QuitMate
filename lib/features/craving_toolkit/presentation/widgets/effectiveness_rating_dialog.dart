import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class EffectivenessRatingDialog extends StatefulWidget {
  const EffectivenessRatingDialog({super.key});

  @override
  State<EffectivenessRatingDialog> createState() =>
      _EffectivenessRatingDialogState();
}

class _EffectivenessRatingDialogState extends State<EffectivenessRatingDialog> {
  int _selectedRating = 3;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How helpful was this?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Your feedback helps us understand what works best for you.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),

          // Rating stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final rating = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = rating;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    rating <= _selectedRating ? Icons.star : Icons.star_border,
                    size: 40,
                    color: rating <= _selectedRating
                        ? Colors.amber
                        : Colors.grey.shade400,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),

          // Rating label
          Text(
            _getRatingLabel(_selectedRating),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _getRatingColor(_selectedRating),
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
          onPressed: () => Navigator.pop(context, _selectedRating),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  String _getRatingLabel(int rating) {
    switch (rating) {
      case 1:
        return 'Not Helpful';
      case 2:
        return 'Slightly Helpful';
      case 3:
        return 'Moderately Helpful';
      case 4:
        return 'Very Helpful';
      case 5:
        return 'Extremely Helpful';
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
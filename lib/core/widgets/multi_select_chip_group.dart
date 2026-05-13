import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Reusable multi-select chip group for trigger selection.
///
/// Used in [LapseRecoveryScreen] Step 1 and can be reused elsewhere.
class MultiSelectChipGroup extends StatelessWidget {
  final List<String> options;
  final List<String> selected;
  final ValueChanged<String> onToggle;

  const MultiSelectChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selected.contains(option);
        return FilterChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onToggle(option),
          selectedColor: AppTheme.primaryColor.withValues(alpha: 0.15),
          checkmarkColor: AppTheme.primaryColor,
        );
      }).toList(),
    );
  }
}
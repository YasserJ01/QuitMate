import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import 'quick_log_sheet.dart';

class QuickLogButton extends ConsumerWidget {
  const QuickLogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
        _showQuickLogSheet(context, ref);
      },
      icon: const Icon(Icons.add),
      label: const Text('Quick Log'),
      backgroundColor: AppTheme.primaryColor,
    );
  }

  void _showQuickLogSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const QuickLogSheet(),
    );
  }
}
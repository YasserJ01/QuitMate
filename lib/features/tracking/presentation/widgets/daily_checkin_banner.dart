import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/checkin_provider.dart';
import 'daily_checkin_sheet.dart';

/// Banner shown at the top of the dashboard when no check-in has been
/// completed today. Dismissible — stores dismissal in-memory only.
class DailyCheckinBanner extends ConsumerWidget {
  const DailyCheckinBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasCheckedIn = ref.watch(hasCheckedInTodayProvider);
    final dismissed = ref.watch(dismissedCheckinTodayProvider);

    // Don't show if already checked in or dismissed today
    if (dismissed) return const SizedBox.shrink();

    return hasCheckedIn.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (checkedIn) {
        if (checkedIn) return const SizedBox.shrink();

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const Text('📋', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'How are you doing today?',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: () => _showCheckinSheet(context, ref),
                  child: const Text('Check in'),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => ref
                      .read(dismissedCheckinTodayProvider.notifier)
                      .state = true,
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Dismiss',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCheckinSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const DailyCheckinSheet(),
    );
  }
}
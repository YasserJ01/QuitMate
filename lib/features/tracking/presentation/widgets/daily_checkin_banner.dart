import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/dashboard_theme.dart';
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

        final primary = DashboardTheme.primary(context);
        final radius = BorderRadius.circular(DashboardTheme.cardRadius);

        return Material(
          color: Colors.transparent,
          borderRadius: radius,
          child: InkWell(
            onTap: () => _showCheckinSheet(context, ref),
            borderRadius: radius,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primary.withValues(alpha: 0.14),
                    primary.withValues(alpha: 0.06),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: radius,
                border: Border.all(color: primary.withValues(alpha: 0.25)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('📋', style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How are you doing today?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: DashboardTheme.textPrimary(context),
                          ),
                        ),
                        Text(
                          'Tap to check in',
                          style: TextStyle(
                            fontSize: 12,
                            color: DashboardTheme.textSecondary(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showCheckinSheet(context, ref),
                    style: TextButton.styleFrom(
                      foregroundColor: primary,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: const Text(
                      'Check in',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close,
                        size: 18, color: DashboardTheme.textSecondary(context)),
                    onPressed: () => ref
                        .read(dismissedCheckinTodayProvider.notifier)
                        .state = true,
                    visualDensity: VisualDensity.compact,
                    tooltip: 'Dismiss',
                  ),
                ],
              ),
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

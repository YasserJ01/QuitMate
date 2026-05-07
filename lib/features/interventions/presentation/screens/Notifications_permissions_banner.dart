import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/notification_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

/// A dismissible banner shown at the top of the dashboard when the user has
/// not yet granted notification permissions.
///
/// Usage — drop inside any screen's ListView/Column above other content:
/// ```dart
/// const NotificationPermissionBanner(),
/// ```
class NotificationPermissionBanner extends ConsumerStatefulWidget {
  const NotificationPermissionBanner({super.key});

  @override
  ConsumerState<NotificationPermissionBanner> createState() =>
      _NotificationPermissionBannerState();
}

class _NotificationPermissionBannerState
    extends ConsumerState<NotificationPermissionBanner> {
  /// Whether the user has explicitly dismissed this banner in the current session.
  bool _dismissed = false;

  /// Permission state — null means we haven't checked yet.
  bool? _hasPermission;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    // Wait until the manager is ready before querying permission state.
    final manager =
    await ref.read(notificationManagerProvider.future);
    final granted = await manager.hasPermissions();
    if (mounted) setState(() => _hasPermission = granted);
  }

  Future<void> _requestPermission() async {
    final manager =
    await ref.read(notificationManagerProvider.future);
    final granted = await manager.requestPermissions();

    if (!mounted) return;

    if (granted) {
      setState(() => _hasPermission = true);
      // Bootstrap schedule for the newly-permitted user
      final userId =
      await ref.read(currentUserIdProvider.future);
      if (userId != null) await manager.scheduleAll(userId);
    } else {
      // Dismiss — user explicitly denied; don't keep pestering.
      setState(() => _dismissed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hide when: already dismissed, permission already granted, or still loading.
    if (_dismissed || _hasPermission == true || _hasPermission == null) {
      return const SizedBox.shrink();
    }

    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Material(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.notifications_outlined,
                  color: scheme.onSecondaryContainer),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enable reminders',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: scheme.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Get encouragement and craving tips even when the app is closed.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSecondaryContainer
                            .withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Enable button
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: scheme.onSecondaryContainer,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                onPressed: _requestPermission,
                child: const Text('Enable'),
              ),
              // Dismiss
              IconButton(
                icon: Icon(Icons.close,
                    size: 18, color: scheme.onSecondaryContainer),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => setState(() => _dismissed = true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
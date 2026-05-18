import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/services/database/isar_service.dart';
import '../../../interventions/presentation/providers/notification_provider.dart';
import '../../../onboarding/presentation/screens/welcome_screen.dart';

class ResetProfileScreen extends ConsumerStatefulWidget {
  const ResetProfileScreen({super.key});

  @override
  ConsumerState<ResetProfileScreen> createState() =>
      _ResetProfileScreenState();
}

class _ResetProfileScreenState extends ConsumerState<ResetProfileScreen> {
  bool _isResetting = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Reset Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Resetting your profile will erase all your data and '
                'return you to the goal selection screen. You can choose '
                'a different goal or start fresh with the same goal.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.orange, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'This action cannot be undone.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.orange.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed:
                  _isResetting ? null : _confirmReset,
              icon: const Icon(Icons.restart_alt, color: Colors.orange),
              label: const Text('Reset Profile',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange,
                side: const BorderSide(color: Colors.orange),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmReset() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset Profile?'),
        content: const Text(
          'This will permanently delete all your data and '
          'return you to goal selection. You will need to set up '
          'your profile again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.orange),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isResetting = true);
    try {
      // 1. Clear all Isar collections
      final isar = await IsarService.instance;
      await isar.writeTxn(() async {
        await isar.clear();
      });

      // 2. Delete all flutter_secure_storage keys
      await const FlutterSecureStorage().deleteAll();

      // 3. Cancel all pending notifications
      final managerAsync = ref.read(notificationManagerProvider);
      final manager = managerAsync.valueOrNull;
      if (manager != null) {
        await manager.cancelAll();
      }

      if (mounted) {
        // Navigate to WelcomeScreen, removing all previous routes
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint('Reset error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reset failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isResetting = false);
    }
  }
}
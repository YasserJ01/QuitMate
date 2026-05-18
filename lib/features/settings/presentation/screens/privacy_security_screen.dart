import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import '../providers/settings_provider.dart';
import '../../services/privacy_lock_service.dart';

class PrivacySecurityScreen extends ConsumerStatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  ConsumerState<PrivacySecurityScreen> createState() =>
      _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState
    extends ConsumerState<PrivacySecurityScreen> {
  bool _biometricAvailable = false;
  List<BiometricType> _biometrics = [];
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    final service = ref.read(privacyLockServiceProvider);
    final available = await service.isBiometricAvailable();
    final types = available
        ? (await service.getAvailableBiometrics()).cast<BiometricType>()
        : <BiometricType>[];
    if (mounted) {
      setState(() {
        _biometricAvailable = available;
        _biometrics = types;
        _isChecking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Privacy & Security')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.lock_outline),
              title: const Text('Privacy Lock'),
              subtitle: const Text(
                'Require biometric or PIN to open the app',
              ),
              value: settings.privacyLockEnabled,
              onChanged: _isChecking
                  ? null
                  : (enabled) => _toggleLock(enabled),
            ),
          ),
          const SizedBox(height: 8),

          // Biometric info
          if (!_isChecking && !_biometricAvailable)
            Card(
              color: Colors.orange.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'PIN lock will be used — biometric authentication '
                        'is not available on this device.',
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (_biometrics.isNotEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(_biometrics.contains(BiometricType.face)
                        ? Icons.face
                        : Icons.fingerprint,
                        color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      _biometrics.contains(BiometricType.face)
                          ? 'Face recognition available'
                          : 'Fingerprint available',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _toggleLock(bool enabled) async {
    if (enabled) {
      // Test authentication before enabling — avoid locking user out
      final service = ref.read(privacyLockServiceProvider);
      final authenticated = await service.authenticate(
        reason: 'Confirm identity to enable Privacy Lock',
      );
      if (authenticated && mounted) {
        ref.read(settingsProvider.notifier).setPrivacyLock(true);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Authentication failed. Privacy lock not enabled.')),
        );
      }
    } else {
      ref.read(settingsProvider.notifier).setPrivacyLock(false);
    }
  }
}
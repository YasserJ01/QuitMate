import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../../services/privacy_lock_service.dart';
import '../../../relapse_prevention/presentation/screens/help_safety_screen.dart';

/// Full-screen lock that appears when app returns from background
/// and Privacy Lock is enabled. Wraps the entire app content.
class LockScreen extends ConsumerStatefulWidget {
  final Widget child;

  const LockScreen({super.key, required this.child});

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen>
    with WidgetsBindingObserver {
  bool _isLocked = false;
  Timer? _authTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _authTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _lockIfEnabled();
    }
    if (state == AppLifecycleState.resumed && _isLocked) {
      _attemptAuthentication();
    }
  }

  void _lockIfEnabled() {
    final settings = ref.read(settingsProvider);
    if (settings.privacyLockEnabled && mounted) {
      setState(() => _isLocked = true);
    }
  }

  Future<void> _attemptAuthentication() async {
    final service = ref.read(privacyLockServiceProvider);
    final authenticated =
        await service.authenticate(reason: 'Unlock QuitMate');
    if (authenticated && mounted) {
      setState(() => _isLocked = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocked) return widget.child;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🔒', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 24),
              const Text('QuitMate is locked',
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text(
                'Your privacy is protected.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _attemptAuthentication,
                icon: const Icon(Icons.fingerprint),
                label: const Text('Unlock'),
              ),
              const SizedBox(height: 16),
              // Help bypass — always accessible (SRS §15)
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HelpSafetyScreen()),
                ),
                child: const Text('Get Help (no unlock needed)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
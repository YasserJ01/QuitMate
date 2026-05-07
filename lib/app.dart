import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/services/storage/secure_storage_service.dart';
import 'features/interventions/presentation/providers/notification_provider.dart';
import 'features/interventions/services/push_notification_service.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'features/tracking/presentation/screens/dashboard_screen.dart';
import 'features/craving_toolkit/presentation/screens/craving_toolkit_screen.dart';

class QuitMateApp extends ConsumerStatefulWidget {
  const QuitMateApp({super.key});

  @override
  ConsumerState<QuitMateApp> createState() => _QuitMateAppState();
}

class _QuitMateAppState extends ConsumerState<QuitMateApp> {
  final _secureStorage = SecureStorageService();
  bool _isLoading = true;
  bool _hasCompletedOnboarding = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // 1. Check onboarding status first — fast secure-storage read
    final hasCompleted = await _secureStorage.hasCompletedOnboarding();

    if (mounted) {
      setState(() {
        _hasCompletedOnboarding = hasCompleted;
        _isLoading = false;
      });
    }

    // 2. If onboarded, warm up the NotificationManager and schedule
    //    notifications for the next 7 days (idempotent — safe to call
    //    every cold start).
    if (hasCompleted) {
      await _initNotifications();
    }
  }

  Future<void> _initNotifications() async {
    try {
      final manager = await ref.read(notificationManagerProvider.future);

      // Request permission on first run; subsequent calls are no-ops.
      final granted = await manager.requestPermissions();
      if (!granted) return;

      final userId = await _secureStorage.getUserId();
      if (userId == null) return;

      // Schedule 7-day rolling window (replaces stale schedule from prior launch)
      await manager.scheduleAll(userId);

      // Preventive notifications based on historical craving patterns
      await manager.schedulePreventive(userId);

      // Wire notification-tap events to in-app navigation
      _listenToNotificationTaps(manager);
    } catch (e) {
      // Non-fatal — the app works without notifications
      debugPrint('Notification bootstrap error: $e');
    }
  }

  void _listenToNotificationTaps(dynamic manager) {
    // Also handle taps on notifications that arrived while the app was closed.
    PushNotificationService().onNotificationTap.listen((tap) {
      _handleNotificationTap(tap.payload);
    });
  }

  /// Routes to the correct screen based on the notification payload.
  ///
  /// Payload format:  "type=craving_support&action=open_toolkit"
  void _handleNotificationTap(String? payload) {
    if (payload == null || !mounted) return;

    final params = Uri.splitQueryString(payload);
    final action = params['action'];
    final type = params['type'];

    final context = _navigatorKey.currentContext;
    if (context == null) return;

    if (action == 'open_toolkit' ||
        type == 'craving_support' ||
        type == 'preventive') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const CravingToolkitScreen()),
      );
    }
    // Additional routes can be added here as the app grows.
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuitMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: _navigatorKey,
      home: _isLoading
          ? const _SplashScreen()
          : _hasCompletedOnboarding
          ? const DashboardScreen()
          : const WelcomeScreen(),
    );
  }
}

// ─── Splash screen ────────────────────────────────────────────────────────────

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 80, color: Colors.white.withOpacity(0.9)),
              const SizedBox(height: 24),
              const Text(
                'QuitMate',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
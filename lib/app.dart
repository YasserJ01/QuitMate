import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'features/tracking/presentation/screens/dashboard_screen.dart';
import 'core/services/storage/secure_storage_service.dart';

class QuitMateApp extends ConsumerStatefulWidget {
  const QuitMateApp({Key? key}) : super(key: key);

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
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final hasCompleted = await _secureStorage.hasCompletedOnboarding();
    setState(() {
      _hasCompletedOnboarding = hasCompleted;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuitMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: _isLoading
          ? const SplashScreen()
          : _hasCompletedOnboarding
          ? const DashboardScreen()
          : const WelcomeScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 80,
                color: Colors.white.withOpacity(0.9),
              ),
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
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
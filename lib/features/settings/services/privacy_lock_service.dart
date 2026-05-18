import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class PrivacyLockService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final isAvailable = await _auth.isDeviceSupported();
      return canCheck && isAvailable;
    } catch (_) {
      return false;
    }
  }

  /// Returns the list of available biometric types.
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (_) {
      return [];
    }
  }

  /// Returns true if the device has at least a PIN/pattern set.
  Future<bool> isDeviceSecured() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  /// Authenticate with biometric or PIN.
  /// [reason] is shown in the system dialog.
  Future<bool> authenticate({required String reason}) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: false, // allow PIN fallback
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint('Auth error: $e');
      return false;
    }
  }
}

final privacyLockServiceProvider = Provider<PrivacyLockService>((ref) {
  return PrivacyLockService();
});
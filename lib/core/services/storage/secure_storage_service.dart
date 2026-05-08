import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  // Keys
  static const _hasCompletedOnboardingKey = 'has_completed_onboarding';
  static const _userIdKey = 'user_id';
  static const _modeLockedKey = 'mode_locked';

  Future<bool> hasCompletedOnboarding() async {
    final value = await _storage.read(key: _hasCompletedOnboardingKey);
    return value == 'true';
  }

  Future<void> setOnboardingCompleted(bool completed) async {
    await _storage.write(
      key: _hasCompletedOnboardingKey,
      value: completed.toString(),
    );
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  Future<void> setUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // ── Mode lock (BR-02) ──────────────────────────────────────────────────

  Future<bool> isModeLocked() async {
    final value = await _storage.read(key: _modeLockedKey);
    return value == 'true';
  }

  Future<void> lockMode() async {
    await _storage.write(key: _modeLockedKey, value: 'true');
  }

  Future<void> unlockMode() async {
    await _storage.delete(key: _modeLockedKey);
  }

  // ── Clear all ──────────────────────────────────────────────────────────

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

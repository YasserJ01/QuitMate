import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  // Keys
  static const _hasCompletedOnboardingKey = 'has_completed_onboarding';
  static const _userIdKey = 'user_id';

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

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
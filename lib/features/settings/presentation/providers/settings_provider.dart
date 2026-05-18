import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// App-wide settings persisted to secure storage.
class AppSettingsState {
  final ThemeMode themeMode;
  final String languageCode;
  final bool privacyLockEnabled;

  const AppSettingsState({
    this.themeMode = ThemeMode.system,
    this.languageCode = 'en',
    this.privacyLockEnabled = false,
  });

  AppSettingsState copyWith({
    ThemeMode? themeMode,
    String? languageCode,
    bool? privacyLockEnabled,
  }) {
    return AppSettingsState(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      privacyLockEnabled: privacyLockEnabled ?? this.privacyLockEnabled,
    );
  }
}

class SettingsNotifier extends Notifier<AppSettingsState> {
  static const _storage = FlutterSecureStorage();
  static const _themeKey = 'settings_theme_mode';
  static const _langKey = 'settings_language';
  static const _lockKey = 'settings_privacy_lock';

  @override
  AppSettingsState build() {
    // Load synchronously — default to system/english/off
    _loadAsync();
    return const AppSettingsState();
  }

  Future<void> _loadAsync() async {
    final themeStr = await _storage.read(key: _themeKey) ?? 'system';
    final lang = await _storage.read(key: _langKey) ?? 'en';
    final lockStr = await _storage.read(key: _lockKey) ?? 'false';

    final themeMode = switch (themeStr) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };

    state = AppSettingsState(
      themeMode: themeMode,
      languageCode: lang,
      privacyLockEnabled: lockStr == 'true',
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _storage.write(key: _themeKey, value: mode.name);
  }

  Future<void> setLanguage(String code) async {
    state = state.copyWith(languageCode: code);
    await _storage.write(key: _langKey, value: code);
  }

  Future<void> setPrivacyLock(bool enabled) async {
    state = state.copyWith(privacyLockEnabled: enabled);
    await _storage.write(key: _lockKey, value: enabled.toString());
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, AppSettingsState>(SettingsNotifier.new);

/// Global theme provider read by MaterialApp
final appThemeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(settingsProvider).themeMode;
});
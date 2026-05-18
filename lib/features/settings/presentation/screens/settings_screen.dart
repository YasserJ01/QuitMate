import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../interventions/presentation/screens/notifications_settings_screen.dart';
import '../../../onboarding/presentation/screens/edit_profile_screen.dart';
import '../../../relapse_prevention/presentation/screens/help_safety_screen.dart';
import '../providers/settings_provider.dart';
import '../widgets/theme_settings_sheet.dart';
import 'privacy_security_screen.dart';
import 'about_screen.dart';
import 'language_settings_screen.dart';
import 'export_data_screen.dart';
import 'delete_data_screen.dart';
import 'reset_profile_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // ── PROFILE ──────────────────────────────────────────────────
          _SectionHeader(title: 'PROFILE'),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen())),
          ),

          const Divider(),

          // ── PREFERENCES ──────────────────────────────────────────────
          _SectionHeader(title: 'PREFERENCES'),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const NotificationSettingsScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            subtitle: Text(_themeLabel(settings.themeMode)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThemeSheet(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: Text(settings.languageCode == 'en' ? 'English' : 'Nederlands'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LanguageSettingsScreen())),
          ),

          const Divider(),

          // ── PRIVACY & SECURITY ───────────────────────────────────────
          _SectionHeader(title: 'PRIVACY & SECURITY'),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy Lock'),
            subtitle: Text(
                settings.privacyLockEnabled ? 'Enabled' : 'Disabled'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const PrivacySecurityScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Safety'),
            subtitle: const Text('Always accessible, even when locked'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const HelpSafetyScreen())),
          ),

          const Divider(),

          // ── DATA ─────────────────────────────────────────────────────
          _SectionHeader(title: 'DATA'),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Export My Data'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ExportDataScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Delete All Data',
                style: TextStyle(color: Colors.red)),
            trailing: const Icon(Icons.chevron_right, color: Colors.red),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DeleteAllDataScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.restart_alt, color: Colors.orange),
            title: const Text('Reset Profile',
                style: TextStyle(color: Colors.orange)),
            trailing: const Icon(Icons.chevron_right, color: Colors.orange),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ResetProfileScreen())),
          ),

          const Divider(),

          // ── ABOUT ────────────────────────────────────────────────────
          _SectionHeader(title: 'ABOUT'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About QuitMate'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AboutScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Open-Source Licences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LicensePage())),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showThemeSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const ThemeSettingsSheet(),
    );
  }

  String _themeLabel(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => 'System default',
      ThemeMode.light => 'Light',
      ThemeMode.dark => 'Dark',
    };
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';

class ThemeSettingsSheet extends ConsumerWidget {
  const ThemeSettingsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.brightness_auto),
            title: const Text('System default'),
            trailing: settings.themeMode == ThemeMode.system
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              notifier.setTheme(ThemeMode.system);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: const Text('Light'),
            trailing: settings.themeMode == ThemeMode.light
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              notifier.setTheme(ThemeMode.light);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark'),
            trailing: settings.themeMode == ThemeMode.dark
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              notifier.setTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
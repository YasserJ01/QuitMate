import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';

class LanguageSettingsScreen extends ConsumerWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: ListView(
        children: [
          ListTile(
            leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
            title: const Text('English'),
            trailing: settings.languageCode == 'en'
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () => notifier.setLanguage('en'),
          ),
          ListTile(
            leading: const Text('🇳🇱', style: TextStyle(fontSize: 24)),
            title: const Text('Nederlands'),
            trailing: settings.languageCode == 'nl'
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () => notifier.setLanguage('nl'),
          ),
        ],
      ),
    );
  }
}
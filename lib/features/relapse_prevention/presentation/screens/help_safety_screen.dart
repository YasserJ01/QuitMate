import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/static/crisis_helplines.dart';
import '../providers/relapse_provider.dart';

/// Help & Safety screen — accessible without authentication per SRS §15.
///
/// Contains user-configured emergency contacts, static international crisis
/// helplines, and an app disclaimer. Zero network requests.
class HelpSafetyScreen extends ConsumerWidget {
  const HelpSafetyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(relapseContactsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Help & Safety')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Section 1: Emergency Contacts ───────────────────────────────
          Semantics(header: true, child: _SectionHeader(title: 'Your Emergency Contacts')),
          const SizedBox(height: 8),
          contactsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Text('Could not load contacts.'),
            data: (contacts) {
              if (contacts.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Add emergency contacts in your Relapse Plan.',
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                );
              }
              return Column(
                children: contacts
                    .where((c) => c.hasPhone)
                    .map((c) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  AppTheme.primaryColor.withValues(alpha: 0.1),
                              child: Text(c.name[0].toUpperCase(),
                                  style: const TextStyle(
                                      color: AppTheme.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            title: Text(c.name),
                            subtitle: Text(c.formattedPhone),
                            trailing: Semantics(
                              label: 'Call ${c.name} at ${c.phoneNumber}',
                              button: true,
                              child: IconButton(
                                icon: const Icon(Icons.phone,
                                    color: AppTheme.successColor),
                                onPressed: () async {
                                  final uri =
                                      Uri.parse('tel:${c.phoneNumber}');
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  }
                                },
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 24),

          // ── Section 2: Crisis Helplines ─────────────────────────────────
          Semantics(header: true, child: _SectionHeader(title: 'Crisis Helplines')),
          const SizedBox(height: 8),
          ...kCrisisHelplines.map((h) => _HelplineCard(helpline: h)),
          const SizedBox(height: 24),

          // ── Section 3: Disclaimer ───────────────────────────────────────
          Semantics(header: true, child: _SectionHeader(title: 'Disclaimer')),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'QuitMate is not a substitute for professional medical or '
              'psychiatric support. If you are in crisis, please contact '
              'emergency services or a crisis helpline.\n\n'
              'In an emergency, call your local emergency number '
              '(112 / 911 / 999 — varies by region).',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class _HelplineCard extends StatelessWidget {
  final CrisisHelpline helpline;
  const _HelplineCard({required this.helpline});

  @override
  Widget build(BuildContext context) {
    final hasPhone =
        helpline.phoneNumber.isNotEmpty && !helpline.isSmsLine;
    final isSms = helpline.isSmsLine;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Text(helpline.countryFlag, style: const TextStyle(fontSize: 24)),
        title: Text(helpline.organizationName,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(helpline.phoneNumber),
        trailing: hasPhone
            ? Semantics(
                label:
                    'Call ${helpline.organizationName} at ${helpline.phoneNumber}',
                button: true,
                child: IconButton(
                  icon: const Icon(Icons.phone, color: AppTheme.successColor),
                  onPressed: () async {
                    final cleaned =
                        helpline.phoneNumber.replaceAll(RegExp(r'[\s\-]'), '');
                    final uri = Uri.parse('tel:$cleaned');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
              )
            : isSms
                ? const Icon(Icons.sms, color: AppTheme.textSecondary)
                : null,
      ),
    );
  }
}
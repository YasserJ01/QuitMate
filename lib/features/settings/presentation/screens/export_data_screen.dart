import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';
import '../../../craving_toolkit/presentation/providers/toolkit_provider.dart';

class ExportDataScreen extends ConsumerStatefulWidget {
  const ExportDataScreen({super.key});

  @override
  ConsumerState<ExportDataScreen> createState() => _ExportDataScreenState();
}

class _ExportDataScreenState extends ConsumerState<ExportDataScreen> {
  bool _includeProfile = false;
  bool _isExporting = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Export My Data')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Your data is exported as a file you can save or share. '
                'It includes log events and toolkit usage history. '
                'No data is sent to any server.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── JSON Export ──────────────────────────────────────────────
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.code, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('JSON Export',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Full data — events, toolkit history, journal entries',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Include profile'),
                    subtitle: const Text(
                        'Profile data is anonymized — no names included'),
                    value: _includeProfile,
                    onChanged: (v) =>
                        setState(() => _includeProfile = v),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed:
                          _isExporting ? null : () => _exportJson(),
                      icon: const Icon(Icons.download),
                      label: const Text('Export JSON'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ── CSV Export ───────────────────────────────────────────────
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.table_chart, color: Colors.green),
                      const SizedBox(width: 8),
                      Text('CSV Export',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Log events only — for spreadsheet analysis',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed:
                          _isExporting ? null : () => _exportCsv(),
                      icon: const Icon(Icons.download),
                      label: const Text('Export CSV'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_isExporting) ...[
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  Future<void> _exportJson() async {
    setState(() => _isExporting = true);
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final data = <String, dynamic>{
        'exportVersion': '1.0',
        'exportedAt': DateTime.now().toUtc().toIso8601String(),
        'appVersion': '1.0.0',
      };

      // Log events
      final logs = await ref
          .read(trackingRepositoryProvider)
          .getLogEntries(userId);
      data['logEvents'] =
          logs.map((l) => _logToMap(l)).toList();

      // Toolkit sessions
      final toolkitRepo = ref.read(toolkitExerciseRepoProvider);
      final sessions =
          await toolkitRepo.getRecentSessions(userId: userId, days: 99999);
      data['toolkitSessions'] = sessions.map((s) => {
        'exerciseName': s.exerciseName,
        'startedAt': s.startedAt.toIso8601String(),
        'completedAt': s.completedAt?.toIso8601String(),
        'feedbackRating': s.feedbackRating,
      }).toList();

      // Profile (optional)
      if (_includeProfile) {
        final profile =
            await ref.read(profileRepositoryProvider).getProfile(userId);
        if (profile != null) {
          data['profile'] = {
            'mode': profile.goalType.name,
            'quitDate': profile.quitDate?.toIso8601String(),
            'cigarettesPerDay': profile.cigarettesPerDay,
            'costPerPack': profile.costPerPack,
            'values': profile.values,
          };
        }
      }

      final jsonString =
          const JsonEncoder.withIndent('  ').convert(data);
      final dir = await getApplicationDocumentsDirectory();
      final file = File(
          '${dir.path}/quitmate_export_${DateTime.now().millisecondsSinceEpoch}.json');
      await file.writeAsString(jsonString);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Data Export',
        text: 'My QuitMate data export',
      );
    } catch (e) {
      debugPrint('JSON export error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  Future<void> _exportCsv() async {
    setState(() => _isExporting = true);
    try {
      final userId = await ref.read(currentUserIdProvider.future);
      if (userId == null) return;

      final logs = await ref
          .read(trackingRepositoryProvider)
          .getLogEntries(userId);

      final buffer = StringBuffer();
      buffer.writeln('timestamp,eventType,trigger,mood,note,quantity,intensity');

      for (final log in logs) {
        final triggers = log.triggers.join('; ');
        final note = (log.notes ?? '').replaceAll(',', ';');
        buffer.writeln([
          log.timestamp.toIso8601String(),
          log.type.name,
          triggers,
          log.mood?.name ?? '',
          note,
          log.quantity ?? '',
          log.intensity ?? '',
        ].join(','));
      }

      final dir = await getApplicationDocumentsDirectory();
      final file = File(
          '${dir.path}/quitmate_logs_${DateTime.now().millisecondsSinceEpoch}.csv');
      await file.writeAsString(buffer.toString());

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'QuitMate Log Data',
        text: 'My QuitMate log export',
      );
    } catch (e) {
      debugPrint('CSV export error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  Map<String, dynamic> _logToMap(dynamic log) {
    return {
      'timestamp': log.timestamp.toIso8601String(),
      'eventType': log.type.name,
      'trigger': log.triggers,
      'mood': log.mood?.name,
      'note': log.notes,
      'quantity': log.quantity,
      'intensity': log.intensity,
    };
  }
}
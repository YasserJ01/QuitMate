import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../data/models/statistics.dart';
import '../data/repositories/tracking_repository.dart';

class ExportService {
  final TrackingRepository _repository;

  ExportService(this._repository);

  /// Export data to JSON
  Future<File> exportToJson(String userId) async {
    final data = await _repository.exportData(userId);
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);

    return _saveToFile(jsonString, 'quitmate_export_${DateTime.now().millisecondsSinceEpoch}.json');
  }

  /// Export data to CSV
  Future<File> exportToCsv(String userId, Statistics stats) async {
    final logs = await _repository.getLogEntries(userId);

    // Create CSV header
    final csvLines = <String>[
      'Date,Time,Type,Quantity,Mood,Triggers,Notes,Intensity,Location'
    ];

    // Add data rows
    for (final log in logs) {
      final triggers = log.triggers.join(';');
      csvLines.add(
          '${log.formattedDate},${log.formattedTime},${log.type.displayName},'
              '${log.quantity ?? ''},${log.mood?.displayName ?? ''},"$triggers",'
              '"${log.notes ?? ''}",${log.intensity ?? ''},${log.location ?? ''}'
      );
    }

    final csvString = csvLines.join('\n');
    return _saveToFile(csvString, 'quitmate_logs_${DateTime.now().millisecondsSinceEpoch}.csv');
  }

  /// Export summary report
  Future<File> exportSummaryReport(
      String userId,
      Statistics stats,
      String userName,
      ) async {
    final report = StringBuffer();

    report.writeln('=' * 50);
    report.writeln('QUITMATE PROGRESS REPORT');
    report.writeln('=' * 50);
    report.writeln('');
    report.writeln('User: $userName');
    report.writeln('Report Generated: ${DateTime.now()}');
    report.writeln('');

    report.writeln('STREAK INFORMATION');
    report.writeln('-' * 50);
    report.writeln('Current Streak: ${stats.currentStreak} days');
    report.writeln('Longest Streak: ${stats.longestStreak} days');
    report.writeln('');

    report.writeln('ACTIVITY SUMMARY');
    report.writeln('-' * 50);
    report.writeln('Total Cigarettes: ${stats.totalCigarettes}');
    report.writeln('Total Episodes: ${stats.totalEpisodes}');
    report.writeln('Total Cravings: ${stats.totalCravings}');
    report.writeln('Cravings Resisted: ${stats.cravingsResisted}');
    report.writeln('Resistance Rate: ${stats.cravingResistanceRate.toStringAsFixed(1)}%');
    report.writeln('');

    report.writeln('SAVINGS');
    report.writeln('-' * 50);
    report.writeln('Money Saved: \$${stats.moneySaved.toStringAsFixed(2)}');
    report.writeln('Potential Savings: \$${stats.potentialMoneySaved.toStringAsFixed(2)}');
    report.writeln('');

    report.writeln('HEALTH METRICS');
    report.writeln('-' * 50);
    report.writeln('Cigarettes Avoided: ${stats.cigarettesAvoided}');
    report.writeln('Life Minutes Gained: ${stats.lifeMinutesGained.toStringAsFixed(0)}');
    report.writeln('Days Clean: ${stats.daysClean}');
    report.writeln('');

    report.writeln('TOP TRIGGERS');
    report.writeln('-' * 50);
    final sortedTriggers = stats.triggerFrequency.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    for (var i = 0; i < sortedTriggers.length && i < 5; i++) {
      final trigger = sortedTriggers[i];
      report.writeln('${i + 1}. ${trigger.key}: ${trigger.value} times');
    }
    report.writeln('');

    report.writeln('=' * 50);
    report.writeln('Keep up the great work!');
    report.writeln('=' * 50);

    return _saveToFile(
      report.toString(),
      'quitmate_report_${DateTime.now().millisecondsSinceEpoch}.txt',
    );
  }

  Future<File> _saveToFile(String content, String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    return await file.writeAsString(content);
  }

  /// Get shareable file path
  Future<String> getExportPath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$filename';
  }
}
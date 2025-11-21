import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/log_entry.dart';
import '../../data/models/statistics.dart';
import '../providers/tracking_provider.dart';
import '../providers/statistics_provider.dart';

class LogHistoryScreen extends ConsumerStatefulWidget {
  const LogHistoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LogHistoryScreen> createState() => _LogHistoryScreenState();
}

class _LogHistoryScreenState extends ConsumerState<LogHistoryScreen> {
  TimeRange _selectedRange = TimeRange.week;

  @override
  Widget build(BuildContext context) {
    final logsAsync = ref.watch(logsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log History'),
        actions: [
          PopupMenuButton<TimeRange>(
            icon: const Icon(Icons.filter_list),
            onSelected: (range) {
              setState(() {
                _selectedRange = range;
              });
            },
            itemBuilder: (context) => [
              TimeRange.today,
              TimeRange.week,
              TimeRange.month,
              TimeRange.all,
            ].map((range) {
              return PopupMenuItem(
                value: range,
                child: Row(
                  children: [
                    if (_selectedRange == range)
                      const Icon(Icons.check, size: 20)
                    else
                      const SizedBox(width: 20),
                    const SizedBox(width: 8),
                    Text(range.displayName),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: logsAsync.when(
        data: (allLogs) {
          // Filter by selected range
          final startDate = _selectedRange.getStartDate();
          final logs = allLogs.where((log) {
            return log.timestamp.isAfter(startDate);
          }).toList();

          if (logs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No logs yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start tracking to see your history',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          // Group logs by date
          final groupedLogs = <DateTime, List<LogEntry>>{};
          for (final log in logs) {
            final date = DateTime(
              log.timestamp.year,
              log.timestamp.month,
              log.timestamp.day,
            );
            groupedLogs.putIfAbsent(date, () => []).add(log);
          }

          final sortedDates = groupedLogs.keys.toList()
            ..sort((a, b) => b.compareTo(a));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedDates.length,
            itemBuilder: (context, index) {
              final date = sortedDates[index];
              final dateLogs = groupedLogs[date]!;

              return _buildDateSection(context, date, dateLogs);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading logs: $error'),
        ),
      ),
    );
  }

  Widget _buildDateSection(
      BuildContext context,
      DateTime date,
      List<LogEntry> logs,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            _formatDate(date),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: logs.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final log = logs[index];
              return _buildLogTile(context, log);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLogTile(BuildContext context, LogEntry log) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getLogTypeColor(log.type).withOpacity(0.1),
        child: Text(
          log.type.emoji,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      title: Row(
        children: [
          Text(log.type.displayName),
          if (log.quantity != null && log.quantity! > 1) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'x${log.quantity}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(log.formattedTime),
          if (log.triggers.isNotEmpty) ...[
            const SizedBox(height: 4),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: log.triggers.map((trigger) {
                return Chip(
                  label: Text(trigger),
                  labelStyle: const TextStyle(fontSize: 10),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                );
              }).toList(),
            ),
          ],
          if (log.notes != null && log.notes!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              log.notes!,
              style: const TextStyle(fontStyle: FontStyle.italic),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
      trailing: log.mood != null
          ? Text(
        log.mood!.emoji,
        style: const TextStyle(fontSize: 24),
      )
          : null,
      onTap: () => _showLogDetails(context, log),
    );
  }

  void _showLogDetails(BuildContext context, LogEntry log) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildLogDetailsSheet(context, log),
    );
  }

  Widget _buildLogDetailsSheet(BuildContext context, LogEntry log) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Row(
            children: [
              Text(
                log.type.emoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      log.type.displayName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '${log.formattedDate} at ${log.formattedTime}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Details
          if (log.quantity != null)
            _buildDetailRow('Quantity', '${log.quantity}'),

          if (log.mood != null)
            _buildDetailRow('Mood', '${log.mood!.emoji} ${log.mood!.displayName}'),

          if (log.triggers.isNotEmpty)
            _buildDetailRow('Triggers', log.triggers.join(', ')),

          if (log.intensity != null)
            _buildDetailRow('Intensity', '${log.intensity}/10'),

          if (log.location != null)
            _buildDetailRow('Location', log.location!),

          if (log.notes != null && log.notes!.isNotEmpty)
            _buildDetailRow('Notes', log.notes!),

          const SizedBox(height: 24),

          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _deleteLog(log);
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.errorColor,
                    side: const BorderSide(color: AppTheme.errorColor),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteLog(LogEntry log) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Log?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final repository = ref.read(trackingRepositoryProvider);
      await repository.deleteLogEntry(log.id);

      // Refresh data
      ref.read(statisticsProvider.notifier).refresh();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Log deleted'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.isAtSameMomentAs(today)) {
      return 'Today';
    } else if (date.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    }
  }

  Color _getLogTypeColor(LogType type) {
    switch (type) {
      case LogType.cigarette:
        return AppTheme.errorColor;
      case LogType.episode:
        return AppTheme.warningColor;
      case LogType.craving:
        return AppTheme.primaryColor;
      case LogType.relapse:
        return AppTheme.errorColor;
    }
  }
}
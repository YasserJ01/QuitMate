import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/models/notification_models.dart';
import '../providers/notification_provider.dart';

/// Shows the user a scrollable log of past notifications with basic stats.
class NotificationHistoryScreen extends ConsumerWidget {
  const NotificationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(notificationHistoryProvider);
    final stats = ref.watch(notificationStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message history'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Stats banner
          stats.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (s) => _StatsBanner(stats: s),
          ),
          // History list
          Expanded(
            child: history.when(
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (items) => items.isEmpty
                  ? const _EmptyState()
                  : _HistoryList(items: items),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stats banner ─────────────────────────────────────────────────────────────

class _StatsBanner extends StatelessWidget {
  final NotificationStats stats;
  const _StatsBanner({required this.stats});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      color: scheme.primaryContainer.withValues(alpha:0.4),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Stat(label: 'Total sent', value: '${stats.totalSent}'),
          _Stat(
            label: 'Open rate',
            value: '${stats.openRatePercent.toStringAsFixed(0)}%',
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label,
            style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

// ─── History list ─────────────────────────────────────────────────────────────

class _HistoryList extends StatelessWidget {
  final List<NotificationHistory> items;
  const _HistoryList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
      itemBuilder: (ctx, i) => _HistoryTile(item: items[i]),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final NotificationHistory item;
  const _HistoryTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final timeLabel = DateFormat('MMM d · h:mm a').format(item.sentAt);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
        _typeColor(item.type, scheme).withValues(alpha:0.15),
        child: Icon(_typeIcon(item.type),
            size: 20, color: _typeColor(item.type, scheme)),
      ),
      title: Text(item.title,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.body, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 2),
          Text(timeLabel,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: scheme.onSurfaceVariant)),
        ],
      ),
      trailing: item.wasOpened
          ? Icon(Icons.check_circle_outline,
          size: 16, color: scheme.primary)
          : null,
      isThreeLine: true,
    );
  }

  IconData _typeIcon(NotificationType type) => switch (type) {
    NotificationType.dailyCheckIn => Icons.wb_sunny_outlined,
    NotificationType.encouragement => Icons.favorite_outline,
    NotificationType.milestone => Icons.emoji_events_outlined,
    NotificationType.cravingTip => Icons.lightbulb_outline,
    NotificationType.microChallenge => Icons.bolt_outlined,
    NotificationType.progressUpdate => Icons.bar_chart_outlined,
    NotificationType.streakReminder =>
    Icons.local_fire_department_outlined,
    NotificationType.healthFact =>
    Icons.health_and_safety_outlined,
    NotificationType.motivationalQuote =>
    Icons.format_quote_outlined,
  };

  Color _typeColor(NotificationType type, ColorScheme scheme) =>
      switch (type) {
        NotificationType.milestone => Colors.amber,
        NotificationType.cravingTip => Colors.orange,
        NotificationType.healthFact => Colors.green,
        NotificationType.streakReminder => Colors.deepOrange,
        _ => scheme.primary,
      };
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.notifications_none,
              size: 64,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha:0.3)),
          const SizedBox(height: 16),
          Text('No messages yet',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('Your notification history will appear here.',
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/notification_models.dart';
import '../providers/notification_provider.dart';

/// Full settings screen so users can control:
///  • Master on/off switch
///  • Message frequency (low / medium / high)
///  • Quiet hours start & end
///  • Per-type toggles
///  • Preferred notification hours
class NotificationSettingsScreen extends ConsumerWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationPreferencesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification settings'),
        centerTitle: true,
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorBody(message: e.toString()),
        data: (prefs) => _Body(prefs: prefs),
      ),
    );
  }
}

// ─── Body ────────────────────────────────────────────────────────────────────

class _Body extends ConsumerWidget {
  final NotificationPreferences prefs;
  const _Body({required this.prefs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier =
    ref.read(notificationPreferencesNotifierProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        // ── Master switch ──────────────────────────────────────────────────
        _SectionHeader(label: 'Notifications'),
        _SwitchTile(
          icon: Icons.notifications_outlined,
          title: 'Enable notifications',
          subtitle: 'Receive encouragement and reminders',
          value: prefs.notificationsEnabled,
          onChanged: notifier.setEnabled,
        ),

        if (prefs.notificationsEnabled) ...[
          const Divider(height: 1),

          // ── Frequency ───────────────────────────────────────────────────
          _SectionHeader(label: 'Frequency'),
          _FrequencySelector(
            current: prefs.frequency,
            onChanged: notifier.setFrequency,
          ),

          const Divider(height: 1),

          // ── Quiet hours ─────────────────────────────────────────────────
          _SectionHeader(label: 'Quiet hours'),
          _SwitchTile(
            icon: Icons.bedtime_outlined,
            title: 'Quiet hours',
            subtitle: 'No notifications during these hours',
            value: prefs.quietHoursEnabled,
            onChanged: notifier.setQuietHoursEnabled,
          ),
          if (prefs.quietHoursEnabled) ...[
            _HourPickerTile(
              icon: Icons.nights_stay_outlined,
              title: 'Start',
              hour: prefs.quietHoursStart,
              onChanged: notifier.setQuietHoursStart,
            ),
            _HourPickerTile(
              icon: Icons.wb_sunny_outlined,
              title: 'End',
              hour: prefs.quietHoursEnd,
              onChanged: notifier.setQuietHoursEnd,
            ),
          ],

          const Divider(height: 1),

          // ── Message types ───────────────────────────────────────────────
          _SectionHeader(label: 'Message types'),
          ..._typeRows(prefs, notifier),

          const Divider(height: 1),

          // ── Preferred hours ─────────────────────────────────────────────
          _SectionHeader(label: 'Preferred times'),
          _PreferredHoursPicker(
            selected: prefs.preferredHours,
            onChanged: notifier.setPreferredHours,
          ),

          const SizedBox(height: 24),
        ],
      ],
    );
  }

  List<Widget> _typeRows(
      NotificationPreferences prefs,
      NotificationPreferencesNotifier notifier,
      ) {
    const types = [
      (NotificationType.dailyCheckIn, Icons.wb_sunny_outlined, 'Daily check-in'),
      (NotificationType.encouragement, Icons.favorite_outline, 'Encouragement'),
      (NotificationType.milestone, Icons.emoji_events_outlined, 'Milestones'),
      (NotificationType.cravingTip, Icons.lightbulb_outline, 'Craving tips'),
      (NotificationType.microChallenge, Icons.bolt_outlined, 'Micro challenges'),
      (NotificationType.healthFact, Icons.health_and_safety_outlined, 'Health facts'),
      (NotificationType.motivationalQuote, Icons.format_quote_outlined, 'Motivational quotes'),
      (NotificationType.streakReminder, Icons.local_fire_department_outlined, 'Streak reminders'),
      (NotificationType.progressUpdate, Icons.bar_chart_outlined, 'Progress updates'),
    ];

    return types
        .map((t) => _SwitchTile(
      icon: t.$2,
      title: t.$3,
      value: prefs.isTypeEnabled(t.$1),
      onChanged: (v) => notifier.setTypeEnabled(t.$1, v),
    ))
        .toList();
  }
}

// ─── Frequency selector ───────────────────────────────────────────────────────

class _FrequencySelector extends StatelessWidget {
  final NotificationFrequency current;
  final ValueChanged<NotificationFrequency> onChanged;

  const _FrequencySelector({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SegmentedButton<NotificationFrequency>(
        segments: NotificationFrequency.values
            .map((f) => ButtonSegment(
          value: f,
          label: Text(f.displayName.split(' ').first), // "Low" etc.
        ))
            .toList(),
        selected: {current},
        onSelectionChanged: (s) => onChanged(s.first),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return scheme.primaryContainer;
            }
            return null;
          }),
        ),
      ),
    );
  }
}

// ─── Preferred hours picker ───────────────────────────────────────────────────

class _PreferredHoursPicker extends StatelessWidget {
  final List<int> selected;
  final ValueChanged<List<int>> onChanged;

  const _PreferredHoursPicker(
      {required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tap hours to toggle when you want messages',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: scheme.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(24, (h) {
              final active = selected.contains(h);
              return FilterChip(
                label: Text(_formatHour(h)),
                selected: active,
                onSelected: (_) {
                  final list = List<int>.from(selected);
                  active ? list.remove(h) : list.add(h);
                  list.sort();
                  onChanged(list);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  String _formatHour(int h) {
    final period = h < 12 ? 'am' : 'pm';
    final display = h == 0
        ? '12'
        : h <= 12
        ? '$h'
        : '${h - 12}';
    return '$display$period';
  }
}

// ─── Shared tile widgets ──────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}

class _HourPickerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int hour;
  final ValueChanged<int> onChanged;

  const _HourPickerTile({
    required this.icon,
    required this.title,
    required this.hour,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(
        _label(hour),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: hour, minute: 0),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
            ),
            child: child!,
          ),
        );
        if (picked != null) {
          onChanged(picked.hour);
        }
      },
    );
  }

  String _label(int h) {
    final period = h < 12 ? 'AM' : 'PM';
    final display = h == 0
        ? '12'
        : h <= 12
            ? '$h'
            : '${h - 12}';
    return '$display:00 $period';
  }
}

// ─── Error body ───────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  final String message;
  const _ErrorBody({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: 48, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 12),
            Text('Could not load settings',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
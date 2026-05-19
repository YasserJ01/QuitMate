import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/core/services/database/app_database.dart' as drift_db;
import '../../../../core/theme/dashboard_theme.dart';
import '../../../onboarding/data/models/user_profile.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import 'package:quitmate/core/services/database/database_provider.dart';
import '../../../tracking/presentation/providers/tracking_provider.dart';

class ReasonsWallCard extends ConsumerWidget {
  const ReasonsWallCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsync = ref.watch(currentUserIdProvider);

    return userIdAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (userId) {
        if (userId == null) return const SizedBox.shrink();
        return _buildWithProfile(context, ref, userId);
      },
    );
  }

  Future<UserProfile?> _loadProfile(WidgetRef ref, String userId) async {
    final repo = ref.read(profileRepositoryProvider);
    return repo.getProfile(userId);
  }

  Widget _buildWithProfile(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) {
    final profileFuture = _loadProfile(ref, userId);

    return FutureBuilder<UserProfile?>(
      future: profileFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }
        return _buildContent(context, ref, userId, snapshot.data!);
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    String userId,
    UserProfile profile,
  ) {
    final reasons = profile.reasons;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DashboardTheme.surface(context),
        borderRadius: BorderRadius.circular(DashboardTheme.cardRadius),
        border: Border.all(color: DashboardTheme.cardBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DashboardTheme.danger(context).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.favorite, color: Color(0xFFEF4444), size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'My Reasons',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: DashboardTheme.textPrimary(context),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => _openEditSheet(context, ref, userId, profile),
                icon: Icon(
                  reasons.isEmpty ? Icons.add : Icons.edit,
                  size: 18,
                ),
                label: Text(reasons.isEmpty ? 'Add' : 'Edit'),
              ),
            ],
          ),
          if (reasons.isEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Add the reasons why you want to quit or reduce.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: DashboardTheme.textSecondary(context),
              ),
            ),
          ] else ...[
            const SizedBox(height: 16),
            ...reasons.map(
              (reason) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                        color: DashboardTheme.primary(context),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        reason,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: DashboardTheme.textPrimary(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _openEditSheet(
    BuildContext context,
    WidgetRef ref,
    String userId,
    UserProfile profile,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _ReasonsWallEditSheet(
        initialReasons: List<String>.from(profile.reasons),
        onSave: (reasons) => _saveReasons(ref, userId, profile, reasons),
      ),
    );
  }

  Future<void> _saveReasons(
    WidgetRef ref,
    String userId,
    UserProfile profile,
    List<String> reasons,
  ) async {
    final db = ref.read(databaseProvider);
    profile.reasons = reasons;
    profile.updatedAt = DateTime.now();

    final existingRow = await (db.select(db.userProfiles)
        ..where((t) => t.userId.equals(userId))).getSingleOrNull();

    if (existingRow != null) {
      profile.id = existingRow.id;
      profile.createdAt = existingRow.createdAt;
      await (db.update(db.userProfiles)
          ..where((t) => t.id.equals(existingRow.id))).write(_profileToCompanion(profile));
    }
  }

  drift_db.UserProfilesCompanion _profileToCompanion(UserProfile p) {
    return drift_db.UserProfilesCompanion(
      id: drift.Value(p.id),
      userId: drift.Value(p.userId),
      nickname: drift.Value(p.nickname),
      goalType: drift.Value(p.goalType.name),
      modeLocked: drift.Value(p.modeLocked),
      longestStreakDays: drift.Value(p.longestStreakDays),
      recoveryCount: drift.Value(p.recoveryCount),
      lastLapseAt: drift.Value(p.lastLapseAt),
      cigarettesPerDay: drift.Value(p.cigarettesPerDay),
      cigarettesPerPack: drift.Value(p.cigarettesPerPack),
      costPerPack: drift.Value(p.costPerPack),
      ttfcMinutesIndex: drift.Value(p.ttfcMinutesIndex),
      yearsSmoking: drift.Value(p.yearsSmoking),
      reductionPlanJson: drift.Value(p.reductionPlanJson),
      previousQuitAttempts: drift.Value(p.previousQuitAttempts),
      previousAids: drift.Value(p.previousAids),
      confidenceToQuit: drift.Value(p.confidenceToQuit),
      smokingWindows: drift.Value(p.smokingWindows),
      episodesPerWeek: drift.Value(p.episodesPerWeek),
      episodeDurationMinutes: drift.Value(p.episodeDurationMinutes),
      pornInvolvementFlag: drift.Value(p.pornInvolvementFlag),
      distressLevel: drift.Value(p.distressLevel),
      sleepEffectIndex: drift.Value(p.sleepEffectIndex),
      focusEffectIndex: drift.Value(p.focusEffectIndex),
      relationshipEffectIndex: drift.Value(p.relationshipEffectIndex),
      previousReductionAttempts: drift.Value(p.previousReductionAttempts),
      confidenceToReduce: drift.Value(p.confidenceToReduce),
      frequencyTarget: drift.Value(p.frequencyTarget),
      timeOfDayPatterns: drift.Value(p.timeOfDayPatterns),
      values: drift.Value(p.values),
      triggers: drift.Value(p.triggers.map((e) => e.name).toList()),
      reasons: drift.Value(p.reasons),
      quitDate: drift.Value(p.quitDate),
      createdAt: drift.Value(p.createdAt),
      updatedAt: drift.Value(p.updatedAt),
    );
  }
}

class _ReasonsWallEditSheet extends StatefulWidget {
  final List<String> initialReasons;
  final void Function(List<String> reasons) onSave;

  const _ReasonsWallEditSheet({
    required this.initialReasons,
    required this.onSave,
  });

  @override
  State<_ReasonsWallEditSheet> createState() => _ReasonsWallEditSheetState();
}

class _ReasonsWallEditSheetState extends State<_ReasonsWallEditSheet> {
  late final List<TextEditingController> _controllers;
  late final List<String> _reasons;

  @override
  void initState() {
    super.initState();
    _reasons = List.from(widget.initialReasons);
    _controllers = _reasons.map((r) => TextEditingController(text: r)).toList();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Reasons',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 4),
          Text(
            'What motivates you to stay on track?',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _controllers.length + 1,
              itemBuilder: (context, index) {
                if (index == _controllers.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: OutlinedButton.icon(
                      onPressed: _addReason,
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add reason'),
                    ),
                  );
                }
                return _ReasonRow(
                  controller: _controllers[index],
                  onRemove: () => _removeReason(index),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  void _addReason() {
    setState(() {
      _reasons.add('');
      _controllers.add(TextEditingController());
    });
  }

  void _removeReason(int index) {
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
      _reasons.removeAt(index);
    });
  }

  void _save() {
    final cleaned = _controllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();
    widget.onSave(cleaned);
    Navigator.pop(context);
  }
}

class _ReasonRow extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onRemove;

  const _ReasonRow({
    required this.controller,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'I want to quit because...',
                isDense: true,
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.remove_circle_outline,
                color: Colors.red, size: 20),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

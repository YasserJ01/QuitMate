import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/craving_entry.dart';
import '../../data/models/log_entry.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../onboarding/domain/entities/goal_type.dart';
import '../../../onboarding/presentation/providers/onboarding_provider.dart';
import '../providers/tracking_provider.dart';
import '../screens/lapse_recovery_screen.dart';

/// Floating action button that expands into quick-log options.
/// Mode-aware: shows different actions based on goalType.
class QuickLogButton extends ConsumerStatefulWidget {
  final VoidCallback? onCravingLogged;
  final VoidCallback? onCravingResisted;
  final VoidCallback? onLogSuccess;

  const QuickLogButton({
    super.key,
    this.onCravingLogged,
    this.onCravingResisted,
    this.onLogSuccess,
  });

  @override
  ConsumerState<QuickLogButton> createState() => _QuickLogButtonState();
}

class _QuickLogButtonState extends ConsumerState<QuickLogButton>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnim;
  late final Animation<double> _rotateAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _rotateAnim = Tween<double>(begin: 0, end: 0.625).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _controller.forward() : _controller.reverse();
  }

  void _close() {
    if (_isOpen) _toggle();
  }

  Future<void> _logCigarette() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logCigarette();
    if (ok && context.mounted) {
      widget.onLogSuccess?.call();
      // Navigate to lapse recovery screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              LapseRecoveryScreen(lapseType: LogType.cigaretteSmoked),
        ),
      );
    }
  }

  Future<void> _logCraving() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logCraving(
          intensity: CravingIntensity.moderate,
        );
    if (ok && context.mounted) {
      _showSnack('Craving logged', Icons.flash_on);
      widget.onCravingLogged?.call();
      widget.onLogSuccess?.call();
    }
  }

  Future<void> _logResisted() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logCraving(
          intensity: CravingIntensity.mild,
        );
    if (ok && context.mounted) {
      _showSnack('Craving resisted! 💪', Icons.check_circle_outline,
          color: AppTheme.successColor);
      widget.onCravingResisted?.call();
      widget.onLogSuccess?.call();
    }
  }

  Future<void> _logEpisode() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logEpisode();
    if (ok && context.mounted) {
      widget.onLogSuccess?.call();
      // Navigate to lapse recovery screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              LapseRecoveryScreen(lapseType: LogType.urgeEpisode),
        ),
      );
    }
  }

  Future<void> _logDelayed() async {
    _close();
    final userId = await ref.read(currentUserIdProvider.future);
    if (userId == null) return;

    final entry = LogEntry(
      userId: userId,
      type: LogType.cravingDelayed,
    );

    final repo = ref.read(trackingRepositoryProvider);
    await repo.addLogEntry(entry);

    if (mounted) {
      _showSnack('Craving delayed! ⏰', Icons.access_time,
          color: AppTheme.successColor);
      widget.onLogSuccess?.call();
    }
  }

  void _showSnack(String message, IconData icon, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: color ?? AppTheme.primaryColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Expanded options — mode-aware
        ScaleTransition(
          scale: _expandAnim,
          child: _ModeAwareFabs(
            onCigarette: _logCigarette,
            onEpisode: _logEpisode,
            onCraving: _logCraving,
            onResisted: _logResisted,
            onDelayed: _logDelayed,
          ),
        ),

        // Main FAB
        RotationTransition(
          turns: _rotateAnim,
          child: FloatingActionButton(
            heroTag: 'quickLogFab',
            onPressed: _toggle,
            backgroundColor: AppTheme.primaryColor,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

/// Mode-aware mini FABs — shows different actions per goal type.
class _ModeAwareFabs extends ConsumerWidget {
  final VoidCallback onCigarette;
  final VoidCallback onEpisode;
  final VoidCallback onCraving;
  final VoidCallback onResisted;
  final VoidCallback onDelayed;

  const _ModeAwareFabs({
    required this.onCigarette,
    required this.onEpisode,
    required this.onCraving,
    required this.onResisted,
    required this.onDelayed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsync = ref.watch(currentUserIdProvider);

    return userIdAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => _buildSmokingActions(), // default
      data: (userId) {
        if (userId == null) return _buildSmokingActions();
        // Read profile synchronously isn't possible; use a future builder
        return FutureBuilder<GoalType>(
          future: _getGoalType(ref, userId),
          builder: (context, snapshot) {
            final goalType = snapshot.data ?? GoalType.quitSmoking;
            return switch (goalType) {
              GoalType.quitSmoking => _buildSmokingActions(),
              GoalType.reduceMasturbation => _buildReductionActions(),
            };
          },
        );
      },
    );
  }

  Future<GoalType> _getGoalType(WidgetRef ref, String userId) async {
    final repo = ref.read(profileRepositoryProvider);
    final profile = await repo.getProfile(userId);
    return profile?.goalType ?? GoalType.quitSmoking;
  }

  Widget _buildSmokingActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _MiniFab(
            label: 'Log cigarette',
            icon: Icons.smoking_rooms,
            color: AppTheme.errorColor,
            onTap: onCigarette),
        const SizedBox(height: 8),
        _MiniFab(
            label: 'Craving',
            icon: Icons.flash_on,
            color: AppTheme.warningColor,
            onTap: onCraving),
        const SizedBox(height: 8),
        _MiniFab(
            label: 'Delayed!',
            icon: Icons.access_time,
            color: AppTheme.successColor,
            onTap: onDelayed),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildReductionActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _MiniFab(
            label: 'Log episode',
            icon: Icons.warning_amber_rounded,
            color: AppTheme.warningColor,
            onTap: onEpisode),
        const SizedBox(height: 8),
        _MiniFab(
            label: 'Craving',
            icon: Icons.flash_on,
            color: AppTheme.warningColor,
            onTap: onCraving),
        const SizedBox(height: 8),
        _MiniFab(
            label: 'Urge resisted!',
            icon: Icons.check_circle_outline,
            color: AppTheme.successColor,
            onTap: onResisted),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _MiniFab extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MiniFab({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.12),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(label, style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(width: 8),
        FloatingActionButton.small(
          heroTag: label,
          onPressed: onTap,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}

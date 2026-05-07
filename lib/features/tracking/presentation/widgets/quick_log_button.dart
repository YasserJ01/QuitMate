import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/craving_entry.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/tracking_provider.dart';

/// Floating action button that expands into quick-log options.
///
/// [onCravingLogged] and [onCravingResisted] are optional callbacks so the
/// parent (dashboard) can fire the notification event hooks without this
/// widget needing to know about the notification system directly.
///
/// [onLogSuccess] is called after any successful log action so the parent
/// can refresh its data providers.
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

  // ── Log actions ──────────────────────────────────────────────────────────

  Future<void> _logCigarette() async {
    _close();
    final ok =
    await ref.read(quickLogProvider.notifier).logCigarette();
    if (ok && mounted) {
      _showSnack('Cigarette logged', Icons.smoking_rooms);
      widget.onLogSuccess?.call();
    }
  }

  Future<void> _logCraving() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logCraving(
      intensity: CravingIntensity.moderate,
    );
    if (ok && mounted) {
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
    if (ok && mounted) {
      _showSnack('Craving resisted! 💪', Icons.check_circle_outline,
          color: AppTheme.successColor);
      widget.onCravingResisted?.call();
      widget.onLogSuccess?.call();
    }
  }

  Future<void> _logEpisode() async {
    _close();
    final ok = await ref.read(quickLogProvider.notifier).logEpisode();
    if (ok && mounted) {
      _showSnack('Episode logged', Icons.calendar_today);
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
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ── Expanded options ─────────────────────────────────────────────
        ScaleTransition(
          scale: _expandAnim,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _MiniFab(
                label: 'Log cigarette',
                icon: Icons.smoking_rooms,
                color: AppTheme.errorColor,
                onTap: _logCigarette,
              ),
              const SizedBox(height: 8),
              _MiniFab(
                label: 'Log craving',
                icon: Icons.flash_on,
                color: AppTheme.warningColor,
                onTap: _logCraving,
              ),
              const SizedBox(height: 8),
              _MiniFab(
                label: 'Resisted!',
                icon: Icons.check_circle_outline,
                color: AppTheme.successColor,
                onTap: _logResisted,
              ),
              const SizedBox(height: 8),
              _MiniFab(
                label: 'Log episode',
                icon: Icons.calendar_today,
                color: AppTheme.primaryColor,
                onTap: _logEpisode,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),

        // ── Main FAB ────────────────────────────────────────────────────
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

// ── Mini FAB row ─────────────────────────────────────────────────────────────

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
        // Label chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(label,
              style: Theme.of(context).textTheme.labelMedium),
        ),
        const SizedBox(width: 8),
        // Icon button
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
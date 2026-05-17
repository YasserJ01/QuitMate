import 'package:flutter/material.dart';
import '../../domain/entities/achievement.dart';

/// A non-blocking overlay that shows when an achievement is unlocked.
///
/// Uses [OverlayEntry] above the current route — not a dialog.
/// Auto-dismisses after 2.5 seconds. Tappable to dismiss early.
/// Queues multiple unlocks with 500ms delay between them.
class AchievementUnlockOverlay {
  AchievementUnlockOverlay._();

  static final _queue = <Achievement>[];
  static bool _isShowing = false;

  /// Reset should be called when the app is brought back to foreground
  /// or when the root navigator context changes.
  static void reset() {
    _queue.clear();
    _isShowing = false;
  }

  static void enqueue(BuildContext context, Achievement achievement) {
    _queue.add(achievement);
    if (!_isShowing) _showNext(context);
  }

  static void _showNext(BuildContext context) {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    // Guard: context must still be valid
    if (!context.mounted) {
      _queue.clear();
      _isShowing = false;
      return;
    }

    _isShowing = true;
    final achievement = _queue.removeAt(0);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _AchievementOverlayWidget(
        achievement: achievement,
        onDismiss: () {
          entry.remove();
          Future.delayed(
            const Duration(milliseconds: 500),
            () => _showNext(context),
          );
        },
      ),
    );

    // Additional guard before inserting — use maybeOf to avoid crash
    final overlayState = Overlay.maybeOf(context);
    if (overlayState == null) {
      _isShowing = false;
      return;
    }
    overlayState.insert(entry);
  }
}

class _AchievementOverlayWidget extends StatefulWidget {
  final Achievement achievement;
  final VoidCallback onDismiss;

  const _AchievementOverlayWidget({
    required this.achievement,
    required this.onDismiss,
  });

  @override
  State<_AchievementOverlayWidget> createState() =>
      _AchievementOverlayWidgetState();
}

class _AchievementOverlayWidgetState extends State<_AchievementOverlayWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 20),
    ]).animate(_controller);

    _fadeAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 65),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 20),
    ]).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onDismiss,
      child: Material(
        color: Colors.black54,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnim.value,
                child: Transform.scale(
                  scale: _scaleAnim.value,
                  child: _buildCard(context),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD700).withValues(alpha: 0.4),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
        border: Border.all(
          color: const Color(0xFFFFD700),
          width: 3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '🏆',
            style: TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 12),
          Text(
            'Achievement Unlocked!',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFFFFD700),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.achievement.iconEmoji,
            style: const TextStyle(fontSize: 56),
          ),
          const SizedBox(height: 12),
          Text(
            widget.achievement.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            widget.achievement.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Tap to dismiss',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade400,
                ),
          ),
        ],
      ),
    );
  }
}
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../data/models/toolkit_models.dart';

class BreathingAnimation extends StatefulWidget {
  final String phase;
  final int secondsRemaining;
  final BreathingPattern pattern;

  const BreathingAnimation({
    super.key,
    required this.phase,
    required this.secondsRemaining,
    required this.pattern,
  });

  @override
  State<BreathingAnimation> createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _setupAnimation();
  }

  @override
  void didUpdateWidget(BreathingAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phase != widget.phase) {
      _setupAnimation();
    }
  }

  void _setupAnimation() {
    final duration = _getPhaseDuration();

    // Stop any in-progress animation before resetting
    _controller.stop();

    // Reset the controller with new duration
    _controller.duration = Duration(seconds: duration);

    if (widget.phase == 'inhale') {
      _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
      _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
    } else if (widget.phase == 'exhale') {
      _scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
      _opacityAnimation = Tween<double>(begin: 1.0, end: 0.3).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
    } else {
      // Hold or pause
      _scaleAnimation = Tween<double>(begin: 0.8, end: 0.8).animate(_controller);
      _opacityAnimation = Tween<double>(begin: 0.8, end: 0.8).animate(_controller);
    }

    // Reset and restart the animation
    _controller.reset();
    _controller.forward();
  }


  int _getPhaseDuration() {
    switch (widget.phase) {
      case 'inhale':
        return widget.pattern.inhaleSeconds;
      case 'hold':
        return widget.pattern.holdSeconds;
      case 'exhale':
        return widget.pattern.exhaleSeconds;
      case 'pause':
        return widget.pattern.pauseSeconds;
      default:
        return 4;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow ring
            Container(
              width: 300 * _scaleAnimation.value,
              height: 300 * _scaleAnimation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withValues(alpha:0.0),
                    Colors.white.withValues(alpha:0.1 * _opacityAnimation.value),
                  ],
                ),
              ),
            ),

            // Middle ring
            Container(
              width: 250 * _scaleAnimation.value,
              height: 250 * _scaleAnimation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withValues(alpha:0.1 * _opacityAnimation.value),
                    Colors.white.withValues(alpha:0.2 * _opacityAnimation.value),
                  ],
                ),
              ),
            ),

            // Inner circle with animated particles
            CustomPaint(
              size: Size(200 * _scaleAnimation.value, 200 * _scaleAnimation.value),
              painter: BreathingCirclePainter(
                progress: _controller.value,
                phase: widget.phase,
                opacity: _opacityAnimation.value,
              ),
            ),

            // Center circle
            Container(
              width: 180 * _scaleAnimation.value,
              height: 180 * _scaleAnimation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha:0.9 * _opacityAnimation.value),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha:0.5 * _opacityAnimation.value),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  _getPhaseIcon(),
                  size: 60,
                  color: Colors.blue.withValues(alpha:0.8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getPhaseIcon() {
    switch (widget.phase) {
      case 'inhale':
        return Icons.arrow_downward;
      case 'exhale':
        return Icons.arrow_upward;
      case 'hold':
      case 'pause':
        return Icons.pause;
      default:
        return Icons.air;
    }
  }
}

class BreathingCirclePainter extends CustomPainter {
  final double progress;
  final String phase;
  final double opacity;

  BreathingCirclePainter({
    required this.progress,
    required this.phase,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw particles around circle
    const particleCount = 12;
    final paint = Paint()
      ..color = Colors.white.withValues(alpha:0.6 * opacity)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < particleCount; i++) {
      final angle = (2 * math.pi * i / particleCount) + (progress * 2 * math.pi);
      final particleRadius = radius * 1.1;
      final x = center.dx + particleRadius * math.cos(angle);
      final y = center.dy + particleRadius * math.sin(angle);

      final particleSize = 4.0 + (2.0 * math.sin(progress * math.pi));
      canvas.drawCircle(
        Offset(x, y),
        particleSize,
        paint,
      );
    }

    // Draw animated arcs
    final arcPaint = Paint()
      ..color = Colors.white.withValues(alpha:0.3 * opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < 3; i++) {
      final arcRadius = radius * (0.9 - i * 0.1);
      final startAngle = -math.pi / 2 + (progress * 2 * math.pi) + (i * math.pi / 6);
      const sweepAngle = math.pi / 3;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: arcRadius),
        startAngle,
        sweepAngle,
        false,
        arcPaint,
      );
    }
  }

  @override
  bool shouldRepaint(BreathingCirclePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.phase != phase ||
        oldDelegate.opacity != opacity;
  }
}
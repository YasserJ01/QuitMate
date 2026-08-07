import 'package:flutter/material.dart';

/// Counts up to a decimal [target], formatting via [formatter].
///
/// Mirrors [AnimatedCounter] but for `double` values like money saved, where
/// the displayed string needs custom formatting (currency, units, etc).
class AnimatedDecimalCounter extends StatefulWidget {
  final double target;
  final String Function(double value) formatter;
  final TextStyle? style;
  final Duration duration;

  const AnimatedDecimalCounter({
    super.key,
    required this.target,
    required this.formatter,
    this.style,
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  State<AnimatedDecimalCounter> createState() => _AnimatedDecimalCounterState();
}

class _AnimatedDecimalCounterState extends State<AnimatedDecimalCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: widget.target).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedDecimalCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.target != widget.target) {
      _animation = Tween<double>(begin: _animation.value, end: widget.target)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
      _controller.forward(from: 0);
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
      animation: _animation,
      builder: (context, _) => Text(
        widget.formatter(_animation.value),
        style: widget.style,
      ),
    );
  }
}

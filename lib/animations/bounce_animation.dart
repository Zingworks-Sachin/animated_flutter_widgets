import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final Duration duration;

  const BounceAnimation({super.key,
    required this.child,
    this.beginScale = 0.5,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}
class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: widget.beginScale,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
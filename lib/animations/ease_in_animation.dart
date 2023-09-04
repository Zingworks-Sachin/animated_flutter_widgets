import 'package:flutter/material.dart';

class EaseInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const EaseInAnimation({super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<EaseInAnimation> createState() => _EaseInAnimationState();
}

class _EaseInAnimationState extends State<EaseInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
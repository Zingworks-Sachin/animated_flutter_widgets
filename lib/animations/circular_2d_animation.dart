import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A StatefulWidget that applies a circular 2D animation to its child widget.
class Circular2DAnimation extends StatefulWidget {
  final Widget child;
  final double radius;
  final double initialAngle;
  final Duration duration;
  final bool isContinuous;

  /// Constructor for the Circular2DAnimation widget.
  const Circular2DAnimation({
    super.key,
    required this.child,
    this.radius = 150,
    this.initialAngle = 0,
    this.duration = const Duration(seconds: 4),
    this.isContinuous = true,
  });

  @override
  State<Circular2DAnimation> createState() => _Circular2DAnimationState();
}

class _Circular2DAnimationState extends State<Circular2DAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Create a rotation animation
    _animation = Tween<double>(
      begin: widget.initialAngle,
      end: widget.initialAngle + 2 * math.pi,
    ).animate(_controller);

    if (widget.isContinuous) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Apply the rotation transformation to the child widget
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.child,
              // ... (position other items around the child)
            ],
          ),
        );
      },
    );
  }
}
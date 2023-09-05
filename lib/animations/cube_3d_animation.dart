import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A StatefulWidget that applies a 3D cube animation to its child widget.
class Cube3DAnimation extends StatefulWidget {
  final Widget child;
  final double sideLength;
  final Duration duration;
  final bool isContinuous;

  /// Constructor for the Cube3DAnimation widget.
  const Cube3DAnimation({
    super.key,
    required this.child,
    this.sideLength = 100,
    this.duration = const Duration(seconds: 4),
    this.isContinuous = true,
  });

  @override
  State<Cube3DAnimation> createState() => _Cube3DAnimationState();
}

class _Cube3DAnimationState extends State<Cube3DAnimation>
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
      begin: 0,
      end: 2 * math.pi,
    ).animate(_controller);

    if (widget.isContinuous) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    /// Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_controller.isAnimating) {
          _controller.reset();
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateX(_animation.value)
              ..rotateY(_animation.value),
            alignment: Alignment.center,
            child: widget.child,
          );
        },
      ),
    );
  }
}

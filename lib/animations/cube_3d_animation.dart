import 'package:flutter/material.dart';
import 'dart:math' as math;

class Cube3DAnimation extends StatefulWidget {
  final Widget child;
  final double sideLength;
  final Duration duration;
  final bool isContinuous;

  const Cube3DAnimation({
    required this.child,
    this.sideLength = 100,
    this.duration = const Duration(seconds: 4),
    this.isContinuous = true,
  });

  @override
  _Cube3DAnimationState createState() => _Cube3DAnimationState();
}

class _Cube3DAnimationState extends State<Cube3DAnimation>
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
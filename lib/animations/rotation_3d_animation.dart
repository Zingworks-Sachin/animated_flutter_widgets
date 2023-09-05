import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A widget that applies a 3D rotation animation to its child.
class Rotation3DAnimation extends StatefulWidget {
  final Widget child;           /// The widget to be animated.
  final double angle;           /// The rotation angle in radians.
  final Duration duration;      /// The duration of the rotation animation.
  final Direction direction;    /// The direction of rotation.
  final bool isContinuous;     /// Whether the animation should be continuous.
  final bool isHalfRotation;   /// Whether to perform a half rotation.

  /// Constructor for the Rotation3DAnimation widget.
  const Rotation3DAnimation({
    Key? key,
    required this.child,
    this.angle = math.pi,
    this.duration = const Duration(milliseconds: 500),
    this.direction = Direction.left,
    this.isContinuous = false,
    this.isHalfRotation = false,
  })  : assert(!(isContinuous && isHalfRotation),
  "isContinuous and isHalfRotation cannot be both true"),
        super(key: key);

  @override
  State<Rotation3DAnimation> createState() =>
      _Rotation3DAnimationState();
}
class _Rotation3DAnimationState extends State<Rotation3DAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;  /// Controller for managing the animation.
  late Animation<double> _animation;     /// Animation object for tracking animation progress.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    double startAngle;
    double endAngle;

    if (widget.isHalfRotation) {
      startAngle = widget.angle / 2;
      endAngle = 0.0;
    } else {
      startAngle = widget.angle;
      endAngle = 0.0;
    }

    _animation = Tween<double>(
      begin: startAngle,
      end: endAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Apply the specified 3D rotation transformation based on the direction.
        if (widget.direction == Direction.up) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateX(_animation.value),
            child: child,
          );
        } else if (widget.direction == Direction.down) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateX(-_animation.value),
            child: child,
          );
        } else if (widget.direction == Direction.left) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateY(_animation.value),
            child: child,
          );
        } else if (widget.direction == Direction.right) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateY(-_animation.value),
            child: child,
          );
        } else {
          return child!;
        }
      },
      child: widget.child,
    );
  }
}

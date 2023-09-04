import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Rotation3DAnimation extends StatefulWidget {
  final Widget child;
  final double angle;
  final Duration duration;
  final Direction direction;
  final bool isContinuous;
  final bool isHalfRotation;

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
  late AnimationController _controller;
  late Animation<double> _animation;

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


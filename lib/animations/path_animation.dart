import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:flutter/material.dart';

class PathAnimation extends StatefulWidget {
  final Widget child;
  final Path path;
  final Duration duration;
  final bool reversePath;
  final PathDirection direction;

  const PathAnimation({super.key,
    required this.child,
    required this.path,
    this.duration = const Duration(seconds: 3),
    this.reversePath = false,
    this.direction = PathDirection.forward,
  });

  @override
  _PathAnimationState createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
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

    final pathMetric = widget.path.computeMetrics().single;
    final pathLength = pathMetric.length;

    double startValue;
    double endValue;

    if (widget.direction == PathDirection.forward) {
      startValue = 0.0;
      endValue = pathLength;
    } else {
      startValue = pathLength;
      endValue = 0.0;
    }

    if (widget.reversePath) {
      _animation = Tween<double>(
        begin: startValue,
        end: endValue,
      ).animate(_controller);
    } else {
      _animation = Tween<double>(
        begin: endValue,
        end: startValue,
      ).animate(_controller);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.reversePath) {
          _controller.reverse();
        } else {
          _controller.reset();
          _controller.forward();
        }
      } else if (status == AnimationStatus.dismissed && widget.reversePath) {
        _controller.forward();
      }
    });

    _controller.forward();
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
        final pathMetric = widget.path.computeMetrics().single;
        final currentPosition = pathMetric.getTangentForOffset(_animation.value)!.position;
        return Transform.translate(
          offset: Offset(currentPosition.dx, currentPosition.dy),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
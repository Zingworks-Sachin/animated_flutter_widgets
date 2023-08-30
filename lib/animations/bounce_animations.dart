import 'package:flutter/material.dart';

class DropAndBounceAnimation extends StatefulWidget {
  final Widget child;
  final double distance;
  final int duration;

  const DropAndBounceAnimation({super.key,
    required this.child,
    this.distance = 100.0,
    this.duration = 1000,
  });

  @override
  State<DropAndBounceAnimation> createState() => _DropAndBounceAnimationState();
}

class _DropAndBounceAnimationState extends State<DropAndBounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.distance,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
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
        return Transform.translate(
          offset: Offset(0.0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

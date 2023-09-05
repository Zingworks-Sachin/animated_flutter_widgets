import 'package:flutter/material.dart';

/// A StatefulWidget that applies a drop and bounce animation to its child widget.
class DropAndBounceAnimation extends StatefulWidget {
  final Widget child;
  final double distance;
  final int duration;

  /// Constructor for the DropAndBounceAnimation widget.
  const DropAndBounceAnimation({
    super.key,
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

    /// Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    /// Create a drop animation
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.distance,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    /// Add a listener to reverse the animation when it's completed
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    /// Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Apply the translation transformation to the child widget
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

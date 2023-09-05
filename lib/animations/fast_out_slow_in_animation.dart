import 'package:flutter/material.dart';

/// A StatefulWidget that applies a fast out slow in animation to its child widget.
class FastOutSlowInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double? scale;

  /// Constructor for the FastOutSlowInAnimation widget.
  const FastOutSlowInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.scale,
  });

  @override
  State<FastOutSlowInAnimation> createState() => _FastOutSlowInAnimationState();
}

class _FastOutSlowInAnimationState extends State<FastOutSlowInAnimation>
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
      value: 0.0,
    );

    // Create a fast out slow in animation
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    // Add a status listener to reverse the animation when it's completed
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 +
                _animation.value *
                    (widget.scale ?? 0.9), // Adjust the scale factor
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A StatefulWidget that applies an ease-in animation to its child widget.
class EaseInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  /// Constructor for the EaseInAnimation widget.
  const EaseInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<EaseInAnimation> createState() => _EaseInAnimationState();
}

class _EaseInAnimationState extends State<EaseInAnimation>
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

    // Create an ease-in animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

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
    // Apply the fade transition to the child widget
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

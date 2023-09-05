import 'package:flutter/material.dart';

/// A StatefulWidget that applies a bounce animation to its child widget.
class BounceAnimation extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final Duration duration;

  /// Constructor for the BounceAnimation widget.
  const BounceAnimation({
    super.key,
    required this.child,
    this.beginScale = 0.5,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
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

    // Create a scale animation
    _animation = Tween<double>(
      begin: widget.beginScale,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

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
    // Apply the scale transition to the child widget
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

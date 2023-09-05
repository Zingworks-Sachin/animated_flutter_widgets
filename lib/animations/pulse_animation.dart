import 'package:flutter/material.dart';

/// A widget that applies a pulsating scale animation to its child.
class PulseAnimation extends StatefulWidget {
  final Widget child;           /// The widget to be animated.
  final double beginScale;      /// The initial scale of the child.
  final Duration duration;      /// The duration of the pulsating animation.

  /// Constructor for the PulseAnimation widget.
  const PulseAnimation({
    Key? key,
    required this.child,
    this.beginScale = 1.0,
    this.duration = const Duration(milliseconds: 1000),  /// Default animation duration.
  }) : super(key: key);

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;  /// Controller for managing the animation.
  late Animation<double> _animation;     /// Animation object for tracking animation progress.

  @override
  void initState() {
    super.initState();
    /// Initialize the animation controller.
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    /// Define the scale animation from the initial scale to 20% larger.
    _animation = Tween<double>(
      begin: widget.beginScale,
      end: widget.beginScale * 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    /// Dispose of the animation controller when the widget is removed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Apply the scale animation to the child using ScaleTransition.
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
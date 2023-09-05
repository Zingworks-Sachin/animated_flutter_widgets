import 'package:flutter/material.dart';

/// A widget that applies a rotation animation to its child.
class RotationAnimation extends StatefulWidget {
  final Widget child;           /// The widget to be animated.
  final double beginRotation;   /// The initial rotation angle in degrees.
  final Duration duration;      /// The duration of the rotation animation.

  /// Constructor for the RotationAnimation widget.
  const RotationAnimation({super.key,
    required this.child,
    this.beginRotation = 0.0,   /// The initial rotation angle (default is 0 degrees).
    this.duration = const Duration(milliseconds: 500),  /// Default animation duration.
  });

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
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

    _animation = Tween<double>(
      begin: widget.beginRotation,  /// Start from the initial rotation angle.
      end: 360.0,                   /// Rotate to 360 degrees (one full rotation).
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();  /// Start the rotation animation.
  }

  @override
  void dispose() {
    _controller.dispose();  /// Dispose of the animation controller when the widget is removed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,    /// Apply the rotation animation to the child using RotationTransition.
      child: widget.child,
    );
  }
}
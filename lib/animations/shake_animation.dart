import 'package:flutter/material.dart';

/// A widget that applies a shake animation to its child.
class ShakeAnimation extends StatefulWidget {
  final Widget child;

  /// The widget to be animated.
  final Duration duration;

  /// The duration of the shake animation.

  /// Constructor for the ShakeAnimation widget.
  const ShakeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),

    /// Default animation duration.
  });

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Controller for managing the animation.
  late Animation<Offset> _animation;

  /// Animation object for tracking animation progress.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),

      /// Start from the original position.
      end: const Offset(0.1, 0),

      /// Apply a small horizontal offset for the shake effect.
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.repeat(reverse: true);

    /// Repeat the shake animation in reverse.
  }

  @override
  void dispose() {
    _controller.dispose();

    /// Dispose of the animation controller when the widget is removed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,

      /// Apply the slide (shake) animation to the child using SlideTransition.
      child: widget.child,
    );
  }
}

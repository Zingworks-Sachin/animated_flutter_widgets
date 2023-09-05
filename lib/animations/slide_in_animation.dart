import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:flutter/material.dart';

/// A widget that applies a slide-in animation to its child from a specified direction.
class SlideInAnimation extends StatefulWidget {
  final Widget child;

  /// The widget to be animated.
  final Direction direction;

  /// The direction from which the child should slide in.
  final Duration duration;

  /// The duration of the slide-in animation.
  final Offset? offset;

  /// Custom offset for the slide animation (optional).

  /// Constructor for the SlideInAnimation widget.
  const SlideInAnimation({
    Key? key,
    required this.child,
    this.direction = Direction.left,

    /// Default direction is from the left.
    this.offset,
    this.duration = const Duration(milliseconds: 500),

    /// Default animation duration.
  }) : super(key: key);

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
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

    Offset beginOffset = Offset.zero;
    Offset endOffset;

    // Determine the end offset based on the specified direction or custom offset.
    switch (widget.direction) {
      case Direction.left:
        endOffset = widget.offset ?? const Offset(-1.12, 0.0);
        break;
      case Direction.right:
        endOffset = widget.offset ?? const Offset(1.12, 0.016);
        break;
      case Direction.up:
        endOffset = widget.offset ?? const Offset(0.0, -1.12);
        break;
      case Direction.down:
        endOffset = widget.offset ?? const Offset(0.016, 1.12);
        break;
    }

    _animation = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    /// Start the slide-in animation.
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

      /// Apply the slide-in animation to the child using SlideTransition.
      child: widget.child,
    );
  }
}

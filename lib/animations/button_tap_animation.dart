import 'package:flutter/material.dart';

/// A [StatefulWidget] that applies a tap animation to its child widget.
class ButtonTapAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleValue;

  /// Callback function triggered on tap up event.
  final VoidCallback onTapUp;

  /// Callback function triggered on tap down event.
  final VoidCallback? onTapDown;

  /// Constructor for the [ButtonTapAnimation] widget.
  ///
  /// [child] is the widget to which the tap animation is applied.
  ///
  /// [duration] is the duration of the animation.
  ///
  /// [scaleValue] is the scale value applied during the animation.
  ///
  /// [onTapUp] is a callback function to be executed when a tap-up event is detected.
  ///
  /// [onTapDown] is an optional callback function to be executed when a tap-down event is detected.
  const ButtonTapAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.scaleValue = 0.5,
    required this.onTapUp,
    this.onTapDown,
  });

  @override
  State<ButtonTapAnimation> createState() => _ButtonTapAnimationState();
}

class _ButtonTapAnimationState extends State<ButtonTapAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    /// Initialize the animation_controller
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: widget.scaleValue,
      duration: widget.duration,
    );

    /// Create a scale animation
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    /// Dispose of the animation_controller
    _controller.dispose();
    super.dispose();
  }

  /// Function to trigger the animation on button tap down event.
  _onTapDown() {
    _controller.forward().whenComplete(() => widget.onTapDown?.call());
  }

  /// Function to trigger the animation on button long press event.
  _onLongPress() {
    _controller.forward();
  }

  /// Function to trigger the animation on button tap up event.
  _onTapUp() {
    if (_controller.isCompleted) {
      _controller.reverse();
      widget.onTapUp.call();
    } else {
      _controller.forward().whenComplete(() {
        _controller.reverse();
        widget.onTapUp.call();
      });
    }
  }

  /// Function to cancel the animation on button tap cancel event.
  _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Apply the scale transformation to the child widget when tapped
    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: () => _onTapCancel(),
      onLongPress: () => _onLongPress(),
      onLongPressEnd: (_) => _onTapUp(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

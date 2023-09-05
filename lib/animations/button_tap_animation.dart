import 'package:flutter/material.dart';

/// A StatefulWidget that applies a tap animation to its child widget.
class ButtonTapAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleValue;

  /// Constructor for the ButtonTapAnimation widget.
  const ButtonTapAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.scaleValue = 0.95,
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

    /// Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    /// Create a scale animation
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    /// Add a status listener to reverse the animation when it's completed
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    /// Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  /// Function to trigger the animation on button tap
  void _animateButton() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    // Apply the scale transformation to the child widget when tapped
    return GestureDetector(
      onTapDown: (_) => _animateButton(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
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








import 'package:flutter/material.dart';

/// A StatefulWidget that applies a double-tap animation to its child widget.
class DoubleTapAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleValue;

  /// Constructor for the DoubleTapAnimation widget.
  const DoubleTapAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.scaleValue = 0.95,
  });

  @override
  State<DoubleTapAnimation> createState() => _DoubleTapAnimationState();
}

class _DoubleTapAnimationState extends State<DoubleTapAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final double _originalScale = 1.0;
  bool _isDoubleTapped = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Create a scale animation
    _scaleAnimation = Tween<double>(
      begin: _originalScale,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Add a status listener to reverse the animation when it's completed
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        if (_isDoubleTapped) {
          _isDoubleTapped = false;
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  // Function to trigger the animation on double-tap
  void _animateButton() {
    _controller.forward(from: 0.0);
  }

  // Function to handle double-tap events
  void _handleDoubleTap() {
    if (_isDoubleTapped) {
      _isDoubleTapped = false;
      _controller.stop();
      _controller.value = _originalScale;
    } else {
      _isDoubleTapped = true;
      _animateButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Apply the scale transformation to the child widget on double-tap
    return GestureDetector(
      onDoubleTap: _handleDoubleTap,
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
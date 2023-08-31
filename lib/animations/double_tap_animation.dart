import 'package:flutter/material.dart';

class DoubleTapAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleValue;

  const DoubleTapAnimation({super.key,
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
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(
      begin: _originalScale,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

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
    _controller.dispose();
    super.dispose();
  }

  void _animateButton() {
    _controller.forward(from: 0.0);
  }

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
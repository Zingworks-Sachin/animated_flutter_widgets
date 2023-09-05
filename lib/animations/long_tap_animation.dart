import 'package:flutter/material.dart';

class LongTapAnimation extends StatefulWidget {
  final Widget child;
  final double pressedScale;

  const LongTapAnimation({super.key,
    required this.child,
    this.pressedScale = 0.9,
  });

  @override
  State<LongTapAnimation> createState() => _LongTapAnimationState();
}
class _LongTapAnimationState extends State<LongTapAnimation> {
  bool _isPressed = false;

  void _onPressed() {
    setState(() {
      _isPressed = true;
    });
  }

  void _onReleased() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onPressed(),
      onTapUp: (_) => _onReleased(),
      onTapCancel: () => _onReleased(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_isPressed ? widget.pressedScale : 1.0),
        child: widget.child,
      ),
    );
  }
}


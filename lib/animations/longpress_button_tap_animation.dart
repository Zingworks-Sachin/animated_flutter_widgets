import 'package:flutter/material.dart';

class LongPressTapAnimation extends StatefulWidget {
  final Widget child;
  final double pressedScale;

  const LongPressTapAnimation({super.key,
    required this.child,
    this.pressedScale = 0.9,
  });

  @override
  State<LongPressTapAnimation> createState() => _LongPressTapAnimationState();
}
class _LongPressTapAnimationState extends State<LongPressTapAnimation> {
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


class ColorChangingButton extends StatefulWidget {
  @override
  _ColorChangingButtonState createState() => _ColorChangingButtonState();
}

class _ColorChangingButtonState extends State<ColorChangingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleButtonClick() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleButtonClick,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
            width: 150,
            height: 50,
            color: _colorAnimation.value,
            child: Center(
              child: Text(
                'Click Me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}


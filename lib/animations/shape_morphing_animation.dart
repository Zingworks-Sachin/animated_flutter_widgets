import 'package:flutter/material.dart';

class ShapeMorphingAnimation extends StatefulWidget {
  final List<Shape> shapes;
  final Duration duration;

  const ShapeMorphingAnimation({super.key,
    required this.shapes,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<ShapeMorphingAnimation> createState() => _ShapeMorphingAnimationState();
}

class _ShapeMorphingAnimationState extends State<ShapeMorphingAnimation> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() {
    Future.delayed(widget.duration, () {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.shapes.length;
        _animate();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      child: widget.shapes[_currentIndex],
    );
  }
}

class Shape extends StatelessWidget {
  final Color color;

  const Shape({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

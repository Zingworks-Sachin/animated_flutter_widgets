import 'package:flutter/material.dart';

class ColorChangeAnimation extends StatefulWidget {
  final Widget child;
  final Color beginColor;
  final Duration duration;
  final ValueChanged<Color>? currentAnimationColor;


  const ColorChangeAnimation({super.key,
    required this.child,
    this.beginColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 500), this.currentAnimationColor,
  });

  @override
  State<ColorChangeAnimation> createState() => _ColorChangeAnimationState();
}
class _ColorChangeAnimationState extends State<ColorChangeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late Color currentColor;
  ValueChanged<Color>? currentAnimationColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.beginColor;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = ColorTween(
      begin: widget.beginColor,
      end: Colors.blue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
          currentColor = _animation.value!;
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
          currentColor = _animation.value!;
        }
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 150,
          height: 150,
          // color: currentColor,
          child: widget.child,
        );
      },
    );
  }
}
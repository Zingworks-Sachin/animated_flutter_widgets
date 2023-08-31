import 'package:animated_widgets/enums/enums.dart';
import 'package:flutter/material.dart';

class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final Direction direction;
  final Duration duration;
  final Offset? offset;

  const SlideInAnimation({
    Key? key,
    required this.child,
    this.direction = Direction.left,
    this.offset,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    Offset beginOffset = Offset.zero;
    Offset endOffset;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

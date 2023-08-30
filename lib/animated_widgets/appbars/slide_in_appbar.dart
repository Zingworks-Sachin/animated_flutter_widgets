import 'dart:ui';

import 'package:flutter/material.dart';

class SlideInAnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double? minHeight;
  final double? maxHeight;
  final Widget? title;
  final Color? backgroundColor;
  final double animationDuration;

  const SlideInAnimatedAppBar({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.title,
    this.backgroundColor,
    this.animationDuration = 300,
  }) : super(key: key);

  @override
  State<SlideInAnimatedAppBar> createState() => _SlideInAnimatedAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(maxHeight ?? kToolbarHeight);
  }
}

class _SlideInAnimatedAppBarState extends State<SlideInAnimatedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration.toInt()),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SlideTransition(
        position: _slideAnimation,
        child: widget.title ?? const Text('Default Title'),
      ),
      elevation: 0.0,
      backgroundColor: widget.backgroundColor ?? Colors.blue,
    );
  }
}

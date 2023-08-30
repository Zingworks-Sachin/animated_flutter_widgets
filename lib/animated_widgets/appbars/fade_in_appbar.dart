import 'dart:ui';
import 'package:flutter/material.dart';

class FadeInAnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double? minHeight;
  final double? maxHeight;
  final Widget? title;
  final Color? backgroundColor;
  final double animationDuration;

  const FadeInAnimatedAppBar({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.title,
    this.backgroundColor,
    this.animationDuration = 300,
  }) : super(key: key);

  @override
  State<FadeInAnimatedAppBar> createState() => _FadeInAnimatedAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(maxHeight ?? kToolbarHeight);
  }
}

class _FadeInAnimatedAppBarState extends State<FadeInAnimatedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration.toInt()),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addListener(() {
      setState(() {});
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
    return Container(
      color: widget.backgroundColor ?? Colors.blue,
      height: lerpDouble(widget.minHeight ?? kToolbarHeight,
          widget.maxHeight ?? kToolbarHeight * 2, _controller.value),
      child: AppBar(
        title: Opacity(
          opacity: _fadeAnimation.value,
          child: widget.title ?? Text('Default Title'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';

/// A custom animated app bar that fades in when it appears.
class FadeInAnimatedAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final double? minHeight;

  /// The minimum height of the app bar.
  final double? maxHeight;

  /// The maximum height of the app bar.
  final Widget? title;

  /// The title widget of the app bar.
  final Color? backgroundColor;

  /// The background color of the app bar.
  final double animationDuration;

  /// The duration of the fade-in animation.

  /// Constructor for the FadeInAnimatedAppBar widget.
  const FadeInAnimatedAppBar({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.title,
    this.backgroundColor,
    this.animationDuration = 300,

    /// Default animation duration is 300 milliseconds.
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

    /// Start the fade-in animation.
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

      /// Set the background color or use default blue.
      height: lerpDouble(widget.minHeight ?? kToolbarHeight,
          widget.maxHeight ?? kToolbarHeight * 2, _controller.value),

      /// Interpolate height based on animation value.
      child: AppBar(
        title: Opacity(
          opacity: _fadeAnimation.value,

          /// Apply opacity animation to the title.
          child: widget.title ?? const Text('Default Title'),

          /// Display the provided title or a default one.
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A custom animated app bar that slides in from the left when it appears.
class SlideInAnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double? minHeight;          /// The minimum height of the app bar.
  final double? maxHeight;          /// The maximum height of the app bar.
  final Widget? title;              /// The title widget of the app bar.
  final Color? backgroundColor;     /// The background color of the app bar.
  final double animationDuration;    /// The duration of the slide-in animation.

  /// Constructor for the SlideInAnimatedAppBar widget.
  const SlideInAnimatedAppBar({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.title,
    this.backgroundColor,
    this.animationDuration = 300,    /// Default animation duration is 300 milliseconds.
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
      begin: const Offset(-1.0, 0.0),   /// Start from the left side (off-screen).
      end: const Offset(0.0, 0.0),     /// Slide to the center of the screen.
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();  /// Start the slide-in animation.
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
        position: _slideAnimation,  /// Apply the slide-in animation to the title.
        child: widget.title ?? const Text('Default Title'),  /// Display the provided title or a default one.
      ),
      elevation: 0.0,
      backgroundColor: widget.backgroundColor ?? Colors.blue,  /// Set the background color or use default blue.
    );
  }
}
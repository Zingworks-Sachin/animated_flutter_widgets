import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppBarAnimation extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final Widget child;

  AppBarAnimation({required this.appBar, required this.child});

  @override
  _AppBarAnimationState createState() => _AppBarAnimationState();
}

class _AppBarAnimationState extends State<AppBarAnimation> {
  ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarVisible = _scrollController.position.userScrollDirection == ScrollDirection.reverse;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: widget.appBar.preferredSize.height,
                child: widget.appBar,
              ),
              widget.child,
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _isAppBarVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: widget.appBar,
        ),
      ],
    );
  }
}


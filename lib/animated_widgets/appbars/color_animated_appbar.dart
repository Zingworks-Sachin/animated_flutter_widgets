import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollFadeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double maxHeight;
  final Widget? title;

  ScrollFadeAppBar({
    Key? key,
    this.maxHeight = kToolbarHeight,
    this.title,
  }) : super(key: key);

  @override
  _ScrollFadeAppBarState createState() => _ScrollFadeAppBarState();

  @override
  Size get preferredSize {
    return Size.fromHeight(maxHeight);
  }
}

class _ScrollFadeAppBarState extends State<ScrollFadeAppBar> {
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
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: widget.maxHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: widget.title ?? Text('Default Title'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        AnimatedOpacity(
          opacity: _isAppBarVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: AppBar(
            title: widget.title ?? Text('Default Title'),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

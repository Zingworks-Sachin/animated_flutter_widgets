import 'package:animated_flutter_widgets/animated_widgets/appbars/fade_in_appbar.dart';
import 'package:animated_flutter_widgets/animated_widgets/scroll_widget/animated_gridview_builder.dart';
import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class AnimatedGridView extends StatelessWidget {
  ///Type of animation for the grid view
  final ScrollWidgetAnimationType scrollWidgetAnimationType;

  ///Constructor
  const AnimatedGridView({
    super.key,
    required this.scrollWidgetAnimationType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FadeInAnimatedAppBar(
        backgroundColor: ColorUtility.magenta,
        title: const Text('Animated GridView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedGridViewBuilder(
          itemCount: 25,
          colorChangeHighlightColor: ColorUtility.magenta,
          animationType: scrollWidgetAnimationType,

          ///animationDuration: Duration(seconds: 1),
          itemBuilder: (context, index) {
            return Card(
              color: (scrollWidgetAnimationType ==
                      ScrollWidgetAnimationType.listColored)
                  ? ColorUtility.white
                  : ColorUtility.magenta,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Item $index',
                    style: TextStyle(
                      color: (scrollWidgetAnimationType ==
                              ScrollWidgetAnimationType.listColored)
                          ? ColorUtility.magenta
                          : ColorUtility.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },

          ///Use the custom animation
        ),
      ),
    );
  }
}

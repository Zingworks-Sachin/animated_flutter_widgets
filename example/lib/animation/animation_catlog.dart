import 'package:animated_flutter_widgets/animated_widgets/appbars/fade_in_appbar.dart';
import 'package:animated_flutter_widgets/page_transitions/page_transition_animation.dart';
import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:example/animation/animations_example.dart';
import 'package:example/page_transition/second_page.dart';
import 'package:example/utility/color.dart';
import 'package:example/utility/enums.dart';
import 'package:example/utility/widgets/animated_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationCatlog extends StatefulWidget {
  const AnimationCatlog({Key? key}) : super(key: key);

  @override
  State<AnimationCatlog> createState() => _AnimationCatlogState();
}

class _AnimationCatlogState extends State<AnimationCatlog>
    with TickerProviderStateMixin {
  List<Widget> widgetList = [];
  late AnimationController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        widgetList = [
          /// Steady Animation Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(
                    page: const AnimationExampleWidget(
                        showContineousAnimations: false,
                        animationType: AnimationType.steady)),
              );
            },
            child: const Text(
              'Steady Animation',
              textAlign: TextAlign.center,
            ),
          ),

          /// Continuous Animation Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(
                    page: const AnimationExampleWidget(
                  showContineousAnimations: true,
                  animationType: AnimationType.contineous,
                )),
              );
            },
            child: const Text(
              'Continuous Animation',
              textAlign: TextAlign.center,
            ),
          ),

          /// Button Tap Animation Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(
                    page: const AnimationExampleWidget(
                        showContineousAnimations: false,
                        animationType: AnimationType.buttonTap)),
              );
            },
            child: const Text(
              'Button Tap Animation',
              textAlign: TextAlign.center,
            ),
          ),

          /// Animated ListView Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AnimatedDialogBox(
                    title: "Select ListView Animation",
                    listType: ListType.listView),
              );
            },
            child: const Text(
              'Animated ListView',
              textAlign: TextAlign.center,
            ),
          ),

          /// Animated GridView Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AnimatedDialogBox(
                  title: "Select GridView Animation",
                  listType: ListType.gridView,
                ),
              );
            },
            child: const Text(
              'Animated GridView',
              textAlign: TextAlign.center,
            ),
          ),

          /// Animated AppBar Button
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AnimatedDialogBox(
                  title: "Select AppBar Animation",
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorUtility.magenta),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PopAndScaleTransition(
                                  page: const SecondPage(
                                      appBarAnimationType:
                                          AppBarAnimationType.slideIn)));
                        },
                        child: const Text(
                          'Slide In Animated AppBar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorUtility.magenta),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PopAndScaleTransition(
                                  page: const SecondPage(
                                      appBarAnimationType:
                                          AppBarAnimationType.fadeIn)));
                        },
                        child: const Text(
                          'Fade In Animated AppBar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'Animated AppBar',
              textAlign: TextAlign.center,
            ),
          ),
        ];
      });
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FadeInAnimatedAppBar(
        title: const Text('Animation Catlog'),
        animationDuration: 1000,
        backgroundColor: ColorUtility.magenta,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimationLimiter(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widgetList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.76,
              crossAxisSpacing: 18,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 600),
              columnCount: 2,
              child: ScaleAnimation(
                  child: FadeInAnimation(child: widgetList[index])),
            ),
          ),
        ),
      ),
    );
  }
}

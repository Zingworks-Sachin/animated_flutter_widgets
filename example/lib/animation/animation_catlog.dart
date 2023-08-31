import 'package:animated_widgets/animated_widgets/appbars/fade_in_appbar.dart';
import 'package:animated_widgets/animations/page_transition_animation.dart';
import 'package:example/animation/animations_example.dart';
import 'package:example/utility/color.dart';
import 'package:example/utility/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationCatlog extends StatefulWidget {
  const AnimationCatlog({Key? key}) : super(key: key);

  @override
  State<AnimationCatlog> createState() => _AnimationCatlogState();
}

class _AnimationCatlogState extends State<AnimationCatlog> {
  List<Widget> widgetList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted){
      setState(() {
        widgetList = [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(page:  const AnimationExampleWidget(showContineousAnimations: true, animationType: AnimationType.contineous,)),
              );
            },
            child: const Text('Continuous Animation'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(page: const AnimationExampleWidget(showContineousAnimations: false,animationType: AnimationType.steady)),
              );
            },
            child: const Text('Steady Animation'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {
              Navigator.push(
                context,
                PopAndScaleTransition(page: const AnimationExampleWidget(showContineousAnimations: false,animationType: AnimationType.buttonTap)),
              );
            },
            child: const Text('Button Tap Animation'),
          ),
        ];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Page Transition Example'),backgroundColor: ColorUtility.magenta,),
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
            itemCount:  widgetList.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.76,
              crossAxisSpacing: 18,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, index) =>
                AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                        child: widgetList[index]
                        )
                    ),
                  ),
                ),
          ),
      ),
      );
  }
}

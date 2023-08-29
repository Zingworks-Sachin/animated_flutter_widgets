import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/animations_example.dart';
import 'package:example/page_transition_animations.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class Animations extends StatelessWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorUtility.magenta,title: const Text("Animation Widget Example",)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SlideInAnimationWidget(
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PopAndScaleTransition(page: const AnimationExampleWidget()),
                  );
                },
                child: const Text('Animations',style: TextStyle(color: Colors.white),),
              ),),
          ),
          Center(
            child: SlideInAnimationWidget(
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtility.magenta
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    ScaleSlideTransition(page: const PageTransitionAnimationWidget(), isLeftScaled: false),
                  );
                },
                child: const Text('Page Transition Animations',style: TextStyle(color: Colors.white),),
              ),),
          ),
        ],
      ),
    );
    return Column(
      children: [
        ShimmerAnimation(baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Fade In Animation'),
          ),)
      ],
    );
  }
}

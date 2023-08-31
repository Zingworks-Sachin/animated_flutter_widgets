import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/animation/animation_catlog.dart';
import 'package:example/animation/animations_example.dart';
import 'package:example/page_transition/page_transition_animations.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class Animations extends StatelessWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorUtility.magenta,title: const Text("Animation Widget Example",)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideInAnimation(
              direction: Direction.down,
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
              ),
            ),
            SlideInAnimation(
              direction: Direction.up,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtility.magenta
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PopAndScaleTransition(page: const AnimationCatlog()),
                  );
                },
                child: const Text('Animations',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

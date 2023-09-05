import 'package:animated_flutter_widgets/animated_widgets/appbars/slide_in_appbar.dart';
import 'package:animated_flutter_widgets/page_transitions/page_transition_animation.dart';
import 'package:example/page_transition/second_page.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PageTransitionAnimationWidget extends StatefulWidget {
  const PageTransitionAnimationWidget({super.key});

  @override
  State<PageTransitionAnimationWidget> createState() =>
      _PageTransitionAnimationWidgetState();
}

class _PageTransitionAnimationWidgetState
    extends State<PageTransitionAnimationWidget> {
  Color currentColor = Colors.transparent;

  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    widgetList = [
      /// Pop And Scale Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            PopAndScaleTransition(page: const SecondPage()),
          );
        },
        child:
            const Text('Pop And Scale Transition', textAlign: TextAlign.center),
      ),

      /// Flipping Rotation Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            FlippingRotationTransition(
                page: const SecondPage(), isReversed: false),
          );
        },
        child: const Text('Flipping Rotation Transition',
            textAlign: TextAlign.center),
      ),

      /// Rotation Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            RotationPageTransition(page: const SecondPage()),
          );
        },
        child:
            const Text('Rotation Page Transition', textAlign: TextAlign.center),
      ),

      /// Pendulum Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            PendulumPageTransition(page: const SecondPage()),
          );
        },
        child:
            const Text('Pendulum Page Transition', textAlign: TextAlign.center),
      ),

      /// Slide Left Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            SlideLeftPageAnimation(page: const SecondPage()),
          );
        },
        child: const Text('Slide Left Page Transition',
            textAlign: TextAlign.center),
      ),

      /// Fade Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            FadePageAnimation(page: const SecondPage()),
          );
        },
        child: const Text('Fade Page Transition', textAlign: TextAlign.center),
      ),

      /// Opacity Scale Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            OpacityScalePageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Opacity Scale Page Transition',
            textAlign: TextAlign.center),
      ),

      /// Zoom Out Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            ZoomOutPageTransition(page: const SecondPage()),
          );
        },
        child:
            const Text('Zoom Out Page Transition', textAlign: TextAlign.center),
      ),

      /// Blink Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            BlinkPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Blink Page Transition', textAlign: TextAlign.center),
      ),

      /// Zoom Rotate Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            ZoomRotatePageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Zoom Rotate Page Transition',
            textAlign: TextAlign.center),
      ),

      /// Ripple Page Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            RipplePageTransition(page: const SecondPage()),
          );
        },
        child:
            const Text('Ripple Page Transition', textAlign: TextAlign.center),
      ),

      /// Shrink And Fade Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            ShrinkAndFadeTransition(page: const SecondPage()),
          );
        },
        child: const Text('Shrink And Fade Transition',
            textAlign: TextAlign.center),
      ),

      /// Elastic Rotation Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            ElasticRotationTransition(page: const SecondPage()),
          );
        },
        child: const Text('Elastic Rotation Transition',
            textAlign: TextAlign.center),
      ),

      /// Scale Slide Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            ScaleSlideTransition(page: const SecondPage(), isLeftScaled: true),
          );
        },
        child:
            const Text('Scale Slide Transition', textAlign: TextAlign.center),
      ),

      /// Rotation Transition
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: ColorUtility.magenta),
        onPressed: () {
          Navigator.push(
            context,
            RotateAnimation(page: const SecondPage(), isClockwise: true),
          );
        },
        child: const Text(
          'Rotation Transition',
          textAlign: TextAlign.center,
        ),
      ),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SlideInAnimatedAppBar(
        title: const Text('Page Transition Catlog'),
        animationDuration: 1000,
        backgroundColor: ColorUtility.magenta,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimationLimiter(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: widgetList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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

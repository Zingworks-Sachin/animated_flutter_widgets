import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/second_page.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class PageTransitionAnimationWidget extends StatefulWidget {

  const PageTransitionAnimationWidget({super.key});

  @override
  State<PageTransitionAnimationWidget> createState() => _PageTransitionAnimationWidgetState();
}

class _PageTransitionAnimationWidgetState extends State<PageTransitionAnimationWidget> {
  Color currentColor = Colors.transparent;

  List<Widget> widgetList = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgetList = [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            RotationAnimation(page: const SecondPage(), isClockwise: true),
          );
        },
        child: const Text('Rotation Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            SlideLeftPageAnimation(page: const SecondPage()),
          );
        },
        child: const Text('Slide Left Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            FadePageAnimation(page: const SecondPage()),
          );
        },
        child: const Text('Fade Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            RotationPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Rotation Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            OpacityScalePageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Opacity Scale Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            ZoomOutPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Zoom Out Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            PendulumPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Pendulum Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            BlinkPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Blink Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            ZoomRotatePageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Zoom Rotate Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            RipplePageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Ripple Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            SwingPageTransition(page: const SecondPage()),
          );
        },
        child: const Text('Swing Page Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            PopAndScaleTransition(page: const SecondPage()),
          );
        },
        child: const Text('Pop And Scale Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            ShrinkAndFadeTransition(page: const SecondPage()),
          );
        },
        child: const Text('Shrink And Fade Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            ElasticRotationTransition(page: const SecondPage()),
          );
        },
        child: const Text('Elastic Rotation Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            FlippingRotationTransition(page: const SecondPage(),isReversed: false),
          );
        },
        child: const Text('Flipping Rotation Transition'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtility.magenta
        ),
        onPressed: () {
          Navigator.push(
            context,
            ScaleSlideTransition(page: const SecondPage(),isLeftScaled: true),
          );
        },
        child: const Text('Scale Slide Transition'),
      ),
    ];
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Transition Example'),backgroundColor: ColorUtility.magenta,),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShakeAnimationWidget(child: widgetList[index]),
            ),
          );
        },
      ),
    );
  }
}

import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/animations/bounce_animations.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class AnimationExampleWidget extends StatefulWidget {
  final bool showContineousAnimations;
  const AnimationExampleWidget({super.key, required this.showContineousAnimations});

  @override
  State<AnimationExampleWidget> createState() => _AnimationExampleWidgetState();
}

class _AnimationExampleWidgetState extends State<AnimationExampleWidget> {
  Color currentColor = Colors.transparent;

  List<Widget> widgetList = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.showContineousAnimations){
      widgetList = [
        PathAnimation(
          reversePath: true,
          path: Path()
            ..moveTo(0, 0)
            ..lineTo(200, 0)
            ..lineTo(200, 200)
            ..lineTo(0, 200)
            ..close(),
          duration: const Duration(seconds: 4),
          child:  CircleAvatar(
            radius: 20,
            backgroundColor: ColorUtility.magenta,
          ),
        ),
        PulseAnimation(
          child: HeartShape(
            width: 100,
            height: 100,
            color: ColorUtility.magenta,
          ),
        ),
        Container(
          child: ImageColorChangeAnimationUtility.animatedColorImage(
            imagePath: 'assets/images/walkfor1min.png',
            initialColor: Colors.blue,
            colorArray: [
              Colors.green,
              Colors.blue,
              Colors.red,
              Colors.purple,
              // Add more colors as needed
            ],
            duration: Duration(seconds: 1),
          ),
        ),
        ShakeAnimationWidget(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Shake Animation'),
          ),
        ),
        FlipAnimation(
          isFlipped: false,
          frontChild: CircleAvatar(
            radius: 40,
            backgroundColor: ColorUtility.blueGrey,
            child: const Icon(Icons.arrow_forward, color: Colors.white,),
          ),
          backChild:  CircleAvatar(
            radius: 40,
            backgroundColor: ColorUtility.magenta,
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          duration: const Duration(seconds: 1),
        ),
        DropletWrapper(
          width: 5,
          height: 5,
          verticalDistance: 64,
          child:CustomPaint(
            size: const Size(100, 100 * 1.5),
            painter: DropletPainter(dropColor: ColorUtility.magenta),
          ),
        ),
      ];
    }else {
      widgetList = [
        DropAndBounceAnimation(
          distance: 100.0,
          duration: 1000,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Drop and Bounce'),
          ),
        ),
        FastOutSlowInAnimation(
          duration: const Duration(seconds: 2),
          scale: 0.75,
          child: Container(
            width: 110,
            height: 110,
            color: ColorUtility.magenta,
            child: Center(child: Text("Fast Out Slow In",style: TextStyle(fontSize: 8.0,color: ColorUtility.white),)),
          ),
        ),
        RotationAnimationWidget(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Rotation Animation'),
          ),
        ),
        EaseInAnimationWidget(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Fade In Animation'),
          ),
        ),
        SlideInAnimationWidget(
          duration: const Duration(seconds: 1),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Slide In Animation'),
          ),
        ),
        BounceAnimationWidget(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta
            ),
            onPressed: () {},
            child: const Text('Bounce Animation'),
          ),
        ),
      ];
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Example'),backgroundColor: ColorUtility.magenta,),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: widgetList[index],
          );
        },
      ),
    );
  }
}
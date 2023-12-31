import 'package:animated_flutter_widgets/animated_widgets.dart';
import 'package:animated_flutter_widgets/animations/bounce_animations.dart';
import 'package:example/utility/color.dart';
import 'package:example/utility/enums.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationExampleWidget extends StatefulWidget {
  final bool showContineousAnimations;
  final AnimationType? animationType;
  const AnimationExampleWidget(
      {super.key,
      required this.showContineousAnimations,
      required this.animationType});

  @override
  State<AnimationExampleWidget> createState() => _AnimationExampleWidgetState();
}

class _AnimationExampleWidgetState extends State<AnimationExampleWidget> {
  Color currentColor = Colors.transparent;
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    getAnimationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
        backgroundColor: ColorUtility.magenta,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          /// Number of columns
          crossAxisSpacing: 10.0,

          /// Spacing between columns
          mainAxisSpacing: 10.0,

          /// Spacing between rows
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

  void getAnimationData() {
    switch (widget.animationType) {
      case AnimationType.contineous:
        widgetList = [
          /// Path Animation
          PathAnimation(
            reversePath: true,
            path: Path()
              ..moveTo(0, 0)
              ..lineTo(200, 0)
              ..lineTo(200, 200)
              ..lineTo(0, 200)
              ..close(),
            duration: const Duration(seconds: 4),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: ColorUtility.magenta,
            ),
          ),

          /// Pulse Animation
          PulseAnimation(
            child: HeartShape(
              width: 100,
              height: 100,
              color: ColorUtility.magenta,
            ),
          ),

          /// Rotation 3D Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.right,
            isContinuous: true,
            isHalfRotation: false,
            child: Container(
              child: ImageColorChangeAnimationUtility.animatedColorImage(
                imagePath: 'assets/images/walkfor1min.png',
                initialColor: Colors.blue,
                colorArray: [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                  Colors.purple,

                  /// Add more colors as needed
                ],
                duration: const Duration(seconds: 1),
              ),
            ),
          ),

          /// Shake Animation
          ShakeAnimation(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Shake Animation'),
            ),
          ),

          /// Rotation 3D Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.down,
            isContinuous: true,
            isHalfRotation: false,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                '3D Rotation Down Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Droplet Animation
          DropletAnimation(
            width: 5,
            height: 5,
            verticalDistance: 64,
            child: CustomPaint(
              size: const Size(100, 100 * 1.5),
              painter: WaterDropletPainter(dropColor: ColorUtility.magenta),
            ),
          ),

          /// Cube 3D Animation
          Cube3DAnimation(
            sideLength: 100,
            duration: const Duration(seconds: 4),
            isContinuous: true,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Cube 3D Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Circular 2D Animation
          Circular2DAnimation(
            radius: 150,
            initialAngle: 0,
            duration: const Duration(seconds: 4),
            isContinuous: true,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Circular 2D Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ];
        break;
      case AnimationType.steady:
        widgetList = [
          /// Slide In Right Animation
          SlideInAnimation(
            direction: Direction.right,
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Slide In Right Animation',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Slide In Down Animation
          SlideInAnimation(
            direction: Direction.down,
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Slide In Down Animation',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Slide In Up Animation
          SlideInAnimation(
            direction: Direction.up,
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Slide In Up Animation',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Slide In Left Animation
          SlideInAnimation(
            direction: Direction.left,
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                'Slide In Left Animation',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// 3D Rotation Left Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.left,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                '3D Rotation Left Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// 3D Rotation Right Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.right,
            isContinuous: false,
            isHalfRotation: false,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                '3D Rotation Right Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// 3D Rotation Up Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.up,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                '3D Rotation Up Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// 3D Rotation Down Animation
          Rotation3DAnimation(
            angle: math.pi,

            /// 180 degrees in radians
            duration: const Duration(milliseconds: 1000),
            direction: Direction.down,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text(
                '3D Rotation Down Animation',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          /// Bounce Animation
          BounceAnimation(
            beginScale: 0.2,
            duration: const Duration(seconds: 2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Bounce Animation'),
            ),
          ),

          /// Drop and Bounce Animation
          DropAndBounceAnimation(
            distance: 100.0,
            duration: 1000,
            child: SizedBox(
              width: 110,
              height: 110,
              child: CircleAvatar(
                  backgroundColor: ColorUtility.magenta,
                  child: Center(
                      child: Text(
                    "Drop and Bounce Animation",
                    style: TextStyle(color: ColorUtility.white),
                    textAlign: TextAlign.center,
                  ))),
            ),
          ),

          /// Fast Out Slow In Animation
          FastOutSlowInAnimation(
            duration: const Duration(seconds: 1),
            scale: 1,
            child: SizedBox(
              width: 110,
              height: 110,
              child: CustomPaint(
                painter: StarPainter(
                  starColor: ColorUtility.magenta,
                  centerText: 'Fast Out Slow Animation',
                  centerTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 6,

                    /// Replace with your desired font size
                  ),
                ),
              ),
            ),
          ),

          /// Rotation Animation
          RotationAnimation(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Rotation Animation'),
            ),
          ),

          /// Ease In Animation
          EaseInAnimation(
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Fade In Animation'),
            ),
          ),
        ];
        break;
      case AnimationType.buttonTap:
        widgetList = [
          /// Long Tap Animation
          LongTapAnimation(
            /// pressDuration: Duration(seconds: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Long Press Me'),
            ),
          ),

          /// Button Tap Animation
          ButtonTapAnimation(
            duration: const Duration(milliseconds: 300),
            scaleValue: 0.5,
            onTapUp: () {},
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.magenta,
                disabledBackgroundColor: ColorUtility.magenta,
              ),
              onPressed: null,
              child: Text(
                'Tap Me',
                style: TextStyle(color: ColorUtility.white),
              ),
            ),
          ),

          /// Double Tap Animation
          DoubleTapAnimation(
            duration: const Duration(milliseconds: 200),
            scaleValue: 0.95,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {},
              child: const Text('Double Tap Me'),
            ),
          )
        ];
        break;
      default:
        break;
    }
    setState(() {});
  }
}

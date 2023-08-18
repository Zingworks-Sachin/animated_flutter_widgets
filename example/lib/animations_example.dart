import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/second_page.dart';
import 'package:flutter/material.dart';

class AnimationExampleWidget extends StatefulWidget {

  const AnimationExampleWidget({super.key});

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
    widgetList = [
      // ParallaxAnimation(
      //   xOffset: 50,
      //   yOffset: -50,
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     color: Colors.cyan,
      //   ),
      // ),
      FastOutSlowInAnimation(
        duration: const Duration(seconds: 2),
        scale: 1.0,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.redAccent,
          child: const Center(child: Text("Fast Out Slow In",style: TextStyle(fontSize: 8.0),)),
        ),
      ),
      RotationAnimationWidget(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Rotation Animation'),
        ),
      ),
      EaseInAnimationWidget(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Fade In Animation'),
        ),
      ),
      SlideInAnimationWidget(
        duration: const Duration(seconds: 1),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Slide In Animation'),
        ),
      ),
      // GestureAnimation(
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     color: Colors.pink,
      //     child: Text("Click Me"),
      //   ),
      //   onTap: () {
      //     print('Container Tapped');
      //   },
      // ),
      BounceAnimationWidget(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Bounce Animation'),
        ),
      ),
      const PulseAnimation(
        child: HeartShape(
          width: 100,
          height: 100,
          color: Colors.redAccent,
        ),
      ),
      // ScaleAnimation(
      //   startScale: 1.0,
      //   endScale: 1.5,
      //   duration: const Duration(seconds: 2),
      //   child: Container(
      //     width: 50,
      //     height: 50,
      //     color: Colors.yellow,
      //   ),
      // ),
      PathAnimation(
        reversePath: true,
        path: Path()
          ..moveTo(0, 0)
          ..lineTo(200, 0)
          ..lineTo(200, 200)
          ..lineTo(0, 200)
          ..close(),
        duration: const Duration(seconds: 4),
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
        ),
      ),

      ColorChangeAnimation(
        beginColor: Colors.red,
        duration: const Duration(seconds: 2),
        currentAnimationColor: (currentAnimationColor) {
          setState(() {
            currentColor = currentAnimationColor;
          });
          print("currentColor=>$currentColor");
        },
        child: ColorFiltered(
            colorFilter:
            ColorFilter.mode(currentColor.withOpacity(0.7), BlendMode.color),child: Image.asset("assets/images/walkfor1min.png",)),
      ),
      ShakeAnimationWidget(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Shake Animation'),
        ),
      ),
      const FlipAnimation(
        frontChild: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Icon(Icons.arrow_forward, color: Colors.white,),
        ),
        backChild: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.red,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        duration: Duration(seconds: 1),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            RotationAnimation(page: const SecondPage(), isClockwise: true),
          );
        },
        child: const Text('Page Transition Animation'),
      ),
      const ShapeMorphingAnimation(
        shapes: [
          Shape(color: Colors.red),
          Shape(color: Colors.green),
          Shape(color: Colors.blue),
        ],
        duration: Duration(seconds: 2),
      )
    ];
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Example')),
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       ColorChangeAnimation(
      //         beginColor: Colors.red,
      //         duration: const Duration(seconds: 2),
      //         child: Container(),
      //       ),
      //       ScaleAnimation(
      //         child: Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.yellow,
      //         ),
      //         startScale: 1.0,
      //         endScale: 1.5,
      //         duration: Duration(seconds: 2),
      //       ),
      //       SlideInAnimationWidget(
      //         duration: Duration(seconds: 1),
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Slide In Button'),
      //         ),
      //       ),
      //       // ScaleAnimationW(
      //       //   child: ElevatedButton(
      //       //     onPressed: () {},
      //       //     child: Text('Scale Button'),
      //       //   ),
      //       // ),
      //       EaseOutBounceAnimation(
      //         duration: const Duration(seconds: 1),
      //         child: Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.redAccent,
      //         ),
      //       ),
      //       RotationAnimationWidget(
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Rotate Button'),
      //         ),
      //       ),
      //       const PulseAnimation(
      //         child: HeartShape(
      //           width: 100,
      //           height: 100,
      //           color: Colors.redAccent,
      //         ),
      //       ),
      //       EaseInAnimationWidget(
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: const Text('Fade In Button'),
      //         ),
      //       ),
      //       BounceAnimationWidget(
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: const Text('Bounce Button'),
      //         ),
      //       ),
      //       ShakeAnimationWidget(
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Shake Button'),
      //         ),
      //       ),
      //       const FlipAnimation(
      //         frontChild: CircleAvatar(
      //           radius: 40,
      //           backgroundColor: Colors.blue,
      //           child: Icon(Icons.arrow_forward, color: Colors.white),
      //         ),
      //         backChild: CircleAvatar(
      //           radius: 40,
      //           backgroundColor: Colors.red,
      //           child: Icon(Icons.arrow_back, color: Colors.white),
      //         ),
      //         duration: Duration(seconds: 1),
      //       ),
      //       PathAnimation(
      //         path: Path()
      //           ..moveTo(0, 0)
      //           ..lineTo(200, 200)
      //           ..lineTo(200, 0)
      //           ..lineTo(0, 0),
      //         duration: const Duration(seconds: 3),
      //         child: const CircleAvatar(
      //           radius: 20,
      //           backgroundColor: Colors.green,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

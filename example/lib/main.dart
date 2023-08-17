import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
// import 'animated_widget_wrapper.dart'; // Your AnimatedWidgetWrapper utility
// import 'slide_in_animation.dart'; // Your SlideInAnimation utility
// import 'scale_animation.dart'; // Your ScaleAnimation utility
// import 'rotation_animation.dart'; // Your RotationAnimation utility
// import 'color_change_animation.dart'; // Your ColorChangeAnimation utility
// import 'pulse_animation.dart'; // Your PulseAnimation utility
// import 'fading_animation.dart'; // Your FadingAnimation utility
// import 'bounce_animation.dart'; // Your BounceAnimation utility
// import 'shake_animation.dart'; // Your ShakeAnimation utility
// import 'flip_animation.dart'; // Your FlipAnimation utility
// import 'path_animation.dart'; // Your PathAnimation utility

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationExampleWidget(),
    );
  }
}

class AnimationExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColorChangeAnimation(
              beginColor: Colors.red,
              duration: const Duration(seconds: 2),
              child: Container(),
            ),
            SlideInAnimationWidget(
              duration: Duration(seconds: 1),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Slide In Button'),
              ),
            ),
            // ScaleAnimationW(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('Scale Button'),
            //   ),
            // ),
            EaseOutBounceAnimation(
              duration: const Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.redAccent,
              ),
            ),
            RotationAnimationWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Rotate Button'),
              ),
            ),
            PulseAnimation(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Pulse Button'),
              ),
            ),
            EaseInAnimationWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Fade In Button'),
              ),
            ),
            BounceAnimationWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Bounce Button'),
              ),
            ),
            ShakeAnimationWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Shake Button'),
              ),
            ),
            const FlipAnimation(
              frontChild: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
              backChild: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              duration: Duration(seconds: 1),
            ),
            PathAnimation(
              path: Path()
                ..moveTo(0, 0)
                ..lineTo(200, 200)
                ..lineTo(200, 0)
                ..lineTo(0, 0),
              duration: const Duration(seconds: 3),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

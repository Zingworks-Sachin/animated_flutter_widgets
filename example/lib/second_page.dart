import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtility.magenta,
        title: const Text('Second Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: PathAnimation(
          reversePath: true,
          path: Path()
            ..moveTo(0, 0)
            ..lineTo(200, 0)
            ..lineTo(200, 200)
            ..lineTo(0, 200)
            ..close(),
          duration: const Duration(seconds: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 80,
                color: Colors.orange,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to the Second Page!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              ),
              // const SizedBox(height: 10),
              // const Text(
              //   'This is a beautifully designed second page example.',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 16, color: Colors.grey),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

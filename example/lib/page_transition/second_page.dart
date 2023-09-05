import 'package:animated_flutter_widgets/animated_widgets/appbars/fade_in_appbar.dart';
import 'package:animated_flutter_widgets/animated_widgets/appbars/slide_in_appbar.dart';
import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final AppBarAnimationType? appBarAnimationType;

  const SecondPage({super.key, this.appBarAnimationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),

      /// Determine which app bar to display
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 80,
              color: ColorUtility.magenta,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to the Second Page!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorUtility.magenta),
              onPressed: () {
                Navigator.pop(context);

                /// Navigate back to the previous page
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    switch (appBarAnimationType) {
      case AppBarAnimationType.fadeIn:

        /// Display a fade-in animated app bar
        return FadeInAnimatedAppBar(
          backgroundColor: ColorUtility.magenta,
          animationDuration: 1000,
          title: const Text('Second Page'),
        );
      case AppBarAnimationType.slideIn:

        /// Display a slide-in animated app bar
        return SlideInAnimatedAppBar(
          backgroundColor: ColorUtility.magenta,
          animationDuration: 1000,
          title: const Text('Second Page'),
        );
      default:

        /// Display a regular app bar
        return AppBar(
          backgroundColor: ColorUtility.magenta,
          title: const Text('Second Page'),
        );
    }
  }
}

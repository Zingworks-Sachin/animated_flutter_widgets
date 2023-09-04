import 'package:animated_widgets/animated_widgets.dart';
import 'package:example/utility/color.dart';
import 'package:flutter/material.dart';


class AnimatedGridView extends StatelessWidget {
  final CollectionAnimationType collectionAnimationType;
  const AnimatedGridView({super.key, required this.collectionAnimationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FadeInAnimatedAppBar(
        backgroundColor: ColorUtility.magenta,
        title: const Text('Animated GridView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedGridViewBuilder(
          itemCount: 25,
          colorChangeHighlightColor: ColorUtility.magenta,
          animationType: collectionAnimationType,
          // animationDuration: Duration(seconds: 1),
          itemBuilder: (context, index) {
            return Card(
              color: (collectionAnimationType == CollectionAnimationType.listColored)?ColorUtility.white: ColorUtility.magenta,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Item $index',style: TextStyle(color:(collectionAnimationType == CollectionAnimationType.listColored)?ColorUtility.magenta: ColorUtility.white),textAlign: TextAlign.center,),
                ),
              ),
            );
          }, // Use the custom animation
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A StatefulWidget that applies a droplet animation to its child widget.
class DropletAnimation extends StatefulWidget {
  final Widget? child;
  final double? verticalDistance;
  final Duration duration;
  final double? width;
  final double? height;

  /// Constructor for the DropletAnimation widget.
  const DropletAnimation({
    super.key,
    this.child,
    this.verticalDistance = 60,
    this.duration = const Duration(seconds: 3),
    this.width = 10,
    this.height = 10,
  });

  @override
  State<DropletAnimation> createState() => _DropletAnimationState();
}

class _DropletAnimationState extends State<DropletAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation1;
  late Animation animation2;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animations
    initializeTweenAnimation();

    // Add a listener to update the state when the animation progresses
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  initializeTweenAnimation() {
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animation1 = Tween(begin: 0.0, end: 10.0).animate(animationController);
    animation2 = Tween(begin: 10.0, end: 0.0).animate(animationController);

    // Repeat the animation indefinitely
    animationController.repeat();
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: animation1.value * widget.verticalDistance!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (animationController.isAnimating) {
                  animationController.stop();
                } else {
                  animationController.repeat();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: SizedBox(
                  width: animation2.value * widget.width!,
                  height: animation2.value * widget.height!,
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

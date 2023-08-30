import 'package:flutter/material.dart';

class DropletWrapper extends StatefulWidget {
  final Widget? child;
  final double? verticalDistance;
  final Duration duration;
  final double? width;
  final double? height;
  const DropletWrapper(
      {super.key,
        this.child,
        this.verticalDistance = 60,
        this.duration = const Duration(seconds: 3),
        this.width = 10,
        this.height = 10,});

  @override
  State<DropletWrapper> createState() => _DropletWrapperState();
}

class _DropletWrapperState extends State<DropletWrapper> with TickerProviderStateMixin {
  late int randomNumber ;
  late Animation animation1 ;
  late Animation animation2 ;
  late AnimationController animationController;
  late Animation colorAnimation1 ;
  late Animation colorAnimation2 ;

  @override
  void initState() {
    super.initState();
    initializeTweenAnimation();
    animationController.addListener(() {
      if (mounted){
        setState(() {
        });
      }
    });
  }

  initializeTweenAnimation() {
    animationController = AnimationController(vsync: this,duration: widget.duration);
    animation1 =Tween(begin: 0.0 ,end:10.0 ).animate(animationController);
    animation2 =Tween(begin: 10.0 ,end:0.0 ).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: animation1.value * widget.verticalDistance,
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
                    width: animation2.value * widget.width,
                    height: animation2.value * widget.height,
                    child: widget.child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
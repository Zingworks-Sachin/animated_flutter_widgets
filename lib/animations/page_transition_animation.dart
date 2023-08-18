import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PageTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  PageTransitionAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
class SlideLeftPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideLeftPageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut;
      var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      var fadeAnimation = animation.drive(tween);
      return FadeTransition(opacity: fadeAnimation, child: child);
    },
  );
}
class RotationPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  RotationPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      const rotateCurve = Curves.easeInOut;
      var rotateTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: rotateCurve));
      final rotateAnimation = animation.drive(rotateTween).value * 360.0;

      const scaleCurve = Curves.easeInOut;
      var scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: scaleCurve));
      final scaleAnimation = animation.drive(scaleTween);

      return Transform.scale(
        scale: scaleAnimation.value,
        child: Transform.rotate(
          angle: rotateAnimation * (math.pi / 180),
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}
// class CustomPageTransition<T> extends PageRouteBuilder<T> {
//   final Widget page;
//
//   CustomPageTransition({required this.page})
//       : super(
//     pageBuilder: (context, animation, secondaryAnimation) => page,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.easeInOut;
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       var offsetAnimation = animation.drive(tween);
//
//       const rotationMaxDegrees = 30.0; // Adjust the maximum rotation angle as desired
//       final rotationAnimation = Tween<double>(
//         begin: -rotationMaxDegrees,
//         end: 0.0,
//       ).animate(animation);
//
//       const initialScale = 0.8; // Adjust the initial scale factor as desired
//       const endScale = 1.0;
//       final scaleAnimation = Tween<double>(
//         begin: initialScale,
//         end: endScale,
//       ).animate(animation);
//
//       return Transform.scale(
//         scale: scaleAnimation.value,
//         child: Transform.rotate(
//           angle: rotationAnimation.value * (math.pi / 180),
//           alignment: Alignment.centerRight,
//           child: SlideTransition(
//             position: offsetAnimation,
//             child: child,
//           ),
//         ),
//       );
//     },
//   );
// }


class OpacityScalePageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  OpacityScalePageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      const rotationMaxDegrees = 30.0; // Adjust the maximum rotation angle as desired
      final rotationAnimation = Tween<double>(
        begin: -rotationMaxDegrees,
        end: 0.0,
      ).animate(animation);

      const initialScale = 0.8; // Adjust the initial scale factor as desired
      const endScale = 1.0;
      final scaleAnimation = Tween<double>(
        begin: initialScale,
        end: endScale,
      ).animate(animation);

      var fadeTween = Tween(begin: 0.0, end: 1.0);
      final fadeAnimation = fadeTween.animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: Transform.scale(
          scale: scaleAnimation.value,
          child: Transform.rotate(
            angle: rotationAnimation.value * (math.pi / 180),
            alignment: Alignment.centerRight,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
class ZoomOutPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  ZoomOutPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      const initialScale = 1.5; // Adjust the initial scale factor as desired
      const endScale = 1.0;
      final scaleAnimation = Tween<double>(
        begin: initialScale,
        end: endScale,
      ).animate(animation);

      final blurAmount = Tween<double>(
        begin: 0.0,
        end: 10.0,
      ).animate(animation);

      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurAmount.value, sigmaY: blurAmount.value),
            child: Container(color: Colors.transparent),
          ),
          Transform.scale(
            scale: scaleAnimation.value,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          ),
        ],
      );
    },
  );
}
class FlipDownPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  FlipDownPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      final upsideDownRotation = Tween<double>(
        begin: 0.0,
        end: math.pi,
      ).animate(animation);

      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // Perspective effect
          ..rotateX(animation.status == AnimationStatus.forward ? upsideDownRotation.value : 0),
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}
class PendulumPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  PendulumPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      const pendulumAmount = 15.0; // Adjust the pendulum amount as desired
      final pendulumAnimation = Tween<double>(
        begin: -pendulumAmount,
        end: pendulumAmount,
      ).animate(animation);

      return Transform.translate(
        offset: Offset(offsetAnimation.value.dx, offsetAnimation.value.dy + pendulumAnimation.value * math.sin(animation.value * math.pi)),
        child: child,
      );
    },
  );
}
class BlinkPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  BlinkPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      const blinkDuration = Duration(milliseconds: 200); // Adjust the blink duration as desired
      const blinkInterval = Interval(0.0, 0.2, curve: Curves.easeInOut);

      final isBlinking = animation.value >= blinkInterval.begin && animation.value <= blinkInterval.end;

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: isBlinking ? 0.0 : 1.0,
            child: Transform.translate(
              offset: offsetAnimation.value,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}
class ZoomRotatePageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  ZoomRotatePageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      final rotationAnimation = Tween<double>(
        begin: -30.0, // Adjust the rotation angle as desired
        end: 0.0,
      ).animate(animation);

      const initialScale = 1.5; // Adjust the initial scale factor as desired
      const endScale = 1.0;
      final scaleAnimation = Tween<double>(
        begin: initialScale,
        end: endScale,
      ).animate(animation);

      return Transform.scale(
        scale: scaleAnimation.value,
        child: Transform.rotate(
          angle: rotationAnimation.value * (math.pi / 180),
          alignment: Alignment.center,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}
class RipplePageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  RipplePageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      final scaleAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animation);

      final fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: Transform.scale(
          scale: scaleAnimation.value,
          alignment: Alignment.center,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}
class ElasticBouncePageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  ElasticBouncePageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.elasticInOut; // Use elastic curve for bounce effect
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      );
    },
  );
}
class SwingPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  SwingPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      const swingAmount = 15.0; // Adjust the swing amount as desired
      final swingAnimation = Tween<double>(
        begin: -swingAmount,
        end: swingAmount,
      ).animate(animation);

      return Transform.translate(
        offset: Offset(
          offsetAnimation.value.dx + swingAnimation.value * math.sin(animation.value * math.pi),
          offsetAnimation.value.dy,
        ),
        child: child,
      );
    },
  );
}
class RadialPageTransition<T> extends PageRouteBuilder<T> {
  final Widget page;

  RadialPageTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final revealFraction = animation.value; // Fraction of reveal progress

      return ClipOval(
        clipper: RadialClipper(revealFraction),
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}
class RadialClipper extends CustomClipper<Rect> {
  final double revealFraction;

  RadialClipper(this.revealFraction);

  @override
  Rect getClip(Size size) {
    final radius = revealFraction * math.sqrt(size.width * size.width + size.height * size.height);
    final rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
class PopAndScaleAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;

  PopAndScaleAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      const staggerDelay = 0.1;
      final scaleValue = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 1.0, curve: curve),
      ));

      final staggerScaleValue = Tween<double>(
        begin: 0.8,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: const Interval(staggerDelay, 1.0, curve: curve),
      ));

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleValue.value * staggerScaleValue.value,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}
class ShrinkAndFadeAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;

  ShrinkAndFadeAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final scaleValue = Tween<double>(
        begin: 1.2,
        end: 1.0,
      ).animate(animation);

      final fadeValue = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animation);

      return FadeTransition(
        opacity: fadeValue,
        child: ScaleTransition(
          scale: scaleValue,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}
class ElasticRotationAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;

  ElasticRotationAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final rotationValue = Tween<double>(
        begin: -0.2,
        end: 0.0,
      ).animate(animation);

      final stretchValue = Tween<double>(
        begin: 1.2,
        end: 1.0,
      ).animate(animation);

      return RotationTransition(
        turns: AlwaysStoppedAnimation(rotationValue.value),
        child: ScaleTransition(
          scale: stretchValue,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}
class SwingRotationAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;

  SwingRotationAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = const Offset(0.0, 1.0);
      final end = Offset.zero;
      final curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final rotationValue = Tween<double>(
        begin: -0.2,
        end: 0.2,
      ).animate(animation);

      return RotationTransition(
        turns: AlwaysStoppedAnimation(rotationValue.value),
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}
class FlippingRotationAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool isReversed;

  FlippingRotationAnimation({required this.page, required this.isReversed})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = isReversed ? Offset(0.0, -1.0) : Offset(0.0, 1.0);
      final end = Offset.zero;
      final curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final rotationValue = Tween<double>(
        begin: 0.0,
        end: isReversed ? -pi : pi,
      ).animate(animation);

      final double finalRotation = animation.status == AnimationStatus.completed ? 0.0 : rotationValue.value;

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(finalRotation),
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}
class ScaleSlideAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool isScaledIn;

  ScaleSlideAnimation({required this.page, required this.isScaledIn})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = isScaledIn ? Offset(1.0, 0.0) : Offset(-1.0, 0.0);
      final end = Offset.zero;
      final curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      final scaleValue = Tween<double>(
        begin: isScaledIn ? 0.8 : 1.2,
        end: 1.0,
      ).animate(animation);

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleValue.value,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}
class OpacityAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;
  // final bool isFadingIn;

  OpacityAnimation({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final opacityValue = Tween<double>(
        begin: 0.0,
        end:  1.0,
      ).animate(animation);

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityValue.value,
            child: child,
          );
        },
        child: child,
      );
    },
  );
}
class RotationAnimation<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool isClockwise;

  RotationAnimation({required this.page, required this.isClockwise})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final rotationValue = Tween<double>(
        begin: 0.0,
        end: isClockwise ? 2 * pi : -2 * pi,
      ).animate(animation);

      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotationValue.value,
            child: child,
          );
        },
        child: child,
      );
    },
  );
}




















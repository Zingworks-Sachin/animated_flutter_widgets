// hero_utility.dart
import 'package:flutter/material.dart';
// import 'screen_a.dart';
// import 'screen_b.dart';

class HeroUtility {
  static MaterialPageRoute routeToScreenA(Widget A) {
    return MaterialPageRoute(builder: (_) => A);
  }

  static MaterialPageRoute routeToScreenB(Widget B) {
    return MaterialPageRoute(builder: (_) => B);
  }

  static Widget buildHeroTaggedWidget({
    required String tag,
    required Widget child,
  }) {
    return Hero(
      tag: tag,
      child: child,
    );
  }
}

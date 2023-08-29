import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimation extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerAnimation({super.key,
    required this.child,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [baseColor, highlightColor, baseColor],
        stops: const [0.4, 0.5, 0.6],
      ),
      child: child,
    );
  }
}
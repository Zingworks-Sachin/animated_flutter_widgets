import 'package:animated_flutter_widgets/utility/painter/heart_painter.dart';
import 'package:flutter/material.dart';

class HeartShape extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const HeartShape({super.key, this.width = 100, this.height = 100, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: HeartPainter(color),
      ),
    );
  }
}
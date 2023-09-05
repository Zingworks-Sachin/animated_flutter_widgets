import 'package:animated_flutter_widgets/utility/painter/heart_painter.dart';
import 'package:flutter/material.dart';

/// A widget that displays a heart shape with customizable width, height, and color.
class HeartShape extends StatelessWidget {
  final double width;       /// The width of the heart shape.
  final double height;      /// The height of the heart shape.
  final Color color;       /// The color of the heart shape.

  /// Constructor for the HeartShape widget.
  const HeartShape({
    Key? key,
    this.width = 100,       /// Default width of the heart shape.
    this.height = 100,      /// Default height of the heart shape.
    this.color = Colors.red,  /// Default color of the heart shape.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: HeartPainter(color),  /// Use the HeartPainter to draw the heart shape with the specified color.
      ),
    );
  }
}
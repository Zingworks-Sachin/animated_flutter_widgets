import 'package:flutter/material.dart';

/// A custom painter for drawing a heart shape.
class HeartPainter extends CustomPainter {
  final Color? color;   /// The color of the heart shape (optional).

  /// Constructor for the HeartPainter class.
  HeartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.red   /// Set the paint color to the specified color or default to red.
      ..style = PaintingStyle.fill;   /// Set the paint style to fill.

    final path = Path();

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final controlPointX = size.width / 2;
    final controlPointY = size.height / 2;

    // Move the starting point to the center of the canvas.
    path.moveTo(centerX, centerY);

    // Create a cubic Bezier curve to draw the top part of the heart.
    path.cubicTo(
      centerX + controlPointX,
      centerY - controlPointY,
      centerX + controlPointX,
      centerY + controlPointY,
      centerX,
      centerY + (size.height * 0.6),
    );

    // Create a cubic Bezier curve to draw the bottom part of the heart.
    path.cubicTo(
      centerX - controlPointX,
      centerY + controlPointY,
      centerX - controlPointX,
      centerY - controlPointY,
      centerX,
      centerY,
    );

    // Draw the heart shape on the canvas using the defined path and paint.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;  /// This custom painter does not require repainting.
  }
}
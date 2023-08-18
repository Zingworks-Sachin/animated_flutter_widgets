import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  final Color? color;
  HeartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.red
      ..style = PaintingStyle.fill;

    final path = Path();

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final controlPointX = size.width / 2;
    final controlPointY = size.height / 2;

    path.moveTo(centerX, centerY);
    path.cubicTo(
      centerX + controlPointX,
      centerY - controlPointY,
      centerX + controlPointX,
      centerY + controlPointY,
      centerX,
      centerY + (size.height * 0.6),
    );
    path.cubicTo(
      centerX - controlPointX,
      centerY + controlPointY,
      centerX - controlPointX,
      centerY - controlPointY,
      centerX,
      centerY,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
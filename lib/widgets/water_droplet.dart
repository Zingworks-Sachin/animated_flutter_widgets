import 'package:flutter/material.dart';

class DropletPainter extends CustomPainter {
  final Color? dropColor;
  DropletPainter({this.dropColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dropColor ?? Colors.blueAccent
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;

    final Path path = Path()
      ..moveTo(width * 0.5, 0)
      ..quadraticBezierTo(width * 0.95, height * 1.2, width * 0.5, height * 1.2)
      ..quadraticBezierTo(width * 0.05, height * 1.2, width * 0.5, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
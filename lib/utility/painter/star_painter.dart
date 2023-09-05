import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarPainter extends CustomPainter {
  final Color? starColor;
  final String? centerText;
  final TextStyle? centerTextStyle;
  final double fontSizeRatio;

  StarPainter({
    this.starColor,
    this.centerText,
    this.centerTextStyle,
    this.fontSizeRatio = 0.2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = starColor ?? Colors.yellow
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final outerRadius = size.width / 2;
    final innerRadius = size.width / 4;

    final path = Path();
    for (int i = 0; i < 5; i++) {
      double angle = math.pi * 2 * i / 5;
      double x = centerX + outerRadius * math.cos(angle);
      double y = centerY + outerRadius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      angle += math.pi * 2 / 10;
      x = centerX + innerRadius * math.cos(angle);
      y = centerY + innerRadius * math.sin(angle);
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);

    if (centerText != null && centerTextStyle != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: centerText,
          style: centerTextStyle,
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center
      );

      final maxWidth = size.width - 2 * innerRadius;
      textPainter.layout(maxWidth: maxWidth);

      final textX = centerX - textPainter.width / 2;
      final textY = centerY - textPainter.height / 2;
      textPainter.paint(canvas, Offset(textX, textY));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

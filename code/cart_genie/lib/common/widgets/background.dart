import 'dart:math';

import 'package:flutter/material.dart';

class Semicircle extends StatelessWidget {
  final double radius;
  final Color color;

  const Semicircle({
    super.key,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: _SemicirclePainter(radius, color),
      ),
    );
  }
}

class _SemicirclePainter extends CustomPainter {
  final double radius;
  final Color color;

  _SemicirclePainter(this.radius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCircle(center: Offset(size.width / 2, 0), radius: radius);
    const startAngle = 0.0;
    const sweepAngle = pi; // This makes it a semicircle (π is approximately 3.14)

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

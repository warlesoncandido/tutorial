import 'package:flutter/material.dart';
import 'package:tutorial/models/shape_models.dart';

class HolePainter extends CustomPainter {
  final double dx;
  final double dy;
  final double radius;
  final ShapeFocus shapeFocus;

  HolePainter({
    this.dx,
    this.dy,
    this.radius,
    this.shapeFocus = ShapeFocus.oval,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    if (shapeFocus == ShapeFocus.oval) {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addOval(
                  Rect.fromCircle(center: Offset(dx, dy), radius: radius - 30))
              ..close(),
          ),
          paint);
    } else {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addRect(
                  Rect.fromCircle(center: Offset(dx, dy), radius: radius - 30))
              ..close(),
          ),
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

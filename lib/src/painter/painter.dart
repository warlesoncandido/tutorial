import 'package:flutter/material.dart';
import 'package:tutorial/src/models/shape_models.dart';

class HolePainter extends CustomPainter {
  final double? dx;
  final double? dy;
  final double? width;
  final double? height;
  final ShapeFocus? shapeFocus;

  HolePainter({
    this.dx,
    this.dy,
    this.width,
    this.height,
    this.shapeFocus = ShapeFocus.oval,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color.fromRGBO(0, 0, 0, 0.8);
    if (shapeFocus == ShapeFocus.oval) {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addOval(
                  Rect.fromCircle(center: Offset(dx!, dy!), radius: width!))
              ..close(),
          ),
          paint);
    } else {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addRect(Rect.fromLTWH(
                  dx! - (width! / 2), dy! - (height! / 2), width!, height!))
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

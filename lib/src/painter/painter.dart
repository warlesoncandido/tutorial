import 'package:flutter/material.dart';
import 'package:tutorial/src/models/shape_models.dart';

class HolePainter extends CustomPainter {
  final double dx;
  final double dy;
  final double width;
  final double height;
  final Color color;
  final ShapeFocus shapeFocus;

  HolePainter({
    this.dx,
    this.dy,
    this.width,
    this.height,
    this.color,
    this.shapeFocus = ShapeFocus.oval,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    if (shapeFocus == ShapeFocus.oval) {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addOval(Rect.fromCircle(center: Offset(dx, dy), radius: width))
              ..close(),
          ),
          paint);
    } else if (shapeFocus == ShapeFocus.roundedSquare) {
      canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addRRect(
              RRect.fromRectAndCorners(Rect.fromLTWH(
                dx - (width / 2), dy - (height / 2), width, height),
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              )
            )
            ..close(),
        ),
        paint
      );
    } else {
      canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addRect(Rect.fromLTWH(
                dx - (width / 2), dy - (height / 2), width, height))
            ..close(),
        ),
        paint
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

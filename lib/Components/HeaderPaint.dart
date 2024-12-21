import 'package:flutter/material.dart';
import 'package:fry_guys/Constants/Colors.dart';

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Yellow Circle (Top Left)

    paint.color = yellow;
    canvas.drawCircle(
      const Offset(0, -80), // Center of the circle
      80, // Radius
      paint,
    );
    paint.color = Colors.white;
    canvas.drawCircle(
      const Offset(0, -80), // Center of the circle
      30, // Radius
      paint,
    );
    paint.color = const Color(0xffffece7);
    canvas.drawCircle(
      const Offset(90, -90), // Center of the circle
      80, // Radius
      paint,
    );

    // Orange Circle (Top Right)
    paint.color = yellow;
    canvas.drawCircle(
      Offset(size.width + 0, -80), // Center of the circle
      80, // Radius
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

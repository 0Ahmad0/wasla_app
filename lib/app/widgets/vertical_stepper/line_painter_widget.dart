import 'package:flutter/material.dart';
class LinePainter extends CustomPainter {
  final Color color;
  final bool isDashed;

  LinePainter({required this.color, required this.isDashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.75;

    if (isDashed) {
      const dashHeight = 5.0;
      const dashSpace = 5.0;
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(Offset(size.width / 2, startY),
            Offset(size.width / 2, startY + dashHeight), paint);
        startY += dashHeight + dashSpace;
      }
    } else {
      canvas.drawLine(Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

import 'package:flutter/material.dart';

import 'line_painter_widget.dart';

class CustomLine extends StatelessWidget {
  final Color color;
  final bool isDashed;
  final double height;

  const CustomLine({
    super.key,
    required this.color,
    required this.isDashed,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: LinePainter(color: color, isDashed: isDashed),
      ),
    );
  }
}

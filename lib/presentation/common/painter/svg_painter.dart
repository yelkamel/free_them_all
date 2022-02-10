import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPainter extends CustomPainter {
  SvgPainter(this.svg);

  final DrawableRoot svg;
  @override
  void paint(Canvas canvas, Size size) {
    svg.toPicture();
    svg.scaleCanvasToViewBox(canvas, size);
    svg.clipCanvasToViewBox(canvas);
    svg.draw(canvas, Rect.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

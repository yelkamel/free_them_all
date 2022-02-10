import 'package:flutter/material.dart';

class BubbleDialogPainter extends CustomPainter {
  final Color bgColor;

  BubbleDialogPainter(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-10, 0);
    path.lineTo(0, -10);
    path.lineTo(10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

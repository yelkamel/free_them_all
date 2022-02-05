import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_them_all/model/character.dart';
import 'package:free_them_all/utils/random.dart';

class CharacterImage extends StatelessWidget {
  final Character character;
  const CharacterImage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: character.svgRoot != null
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    generateRandomColor(),
                    generateRandomColor(),
                    generateRandomColor(),
                  ],
                ),
              ),
              child: CustomPaint(
                painter: SvgPainter(character.svgRoot!),
                child: Container(),
              ),
            )
          : const SizedBox(),
    );
  }
}

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

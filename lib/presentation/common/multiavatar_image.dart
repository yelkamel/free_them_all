import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_them_all/service/svg_whrapper.dart';
import 'package:free_them_all/utils/random.dart';
import 'package:get/get.dart';
import 'package:multiavatar/multiavatar.dart';

class MultiAvatarImage extends StatefulWidget {
  const MultiAvatarImage({Key? key}) : super(key: key);

  @override
  State<MultiAvatarImage> createState() => _MultiAvatarImageState();
}

class _MultiAvatarImageState extends State<MultiAvatarImage> {
  DrawableRoot? svgRoot;

  @override
  void initState() {
    super.initState();
    _generateSvg();
  }

  Future<void> _generateSvg() async {
    final svgCode = multiavatar(generatedRandomId(), trBackground: true);
    final drawableRoot = await SvgWrapper(svgCode).generateLogo();

    if (drawableRoot == null) {
      Get.snackbar("Oups", "Erreur de generation d'avatar");
    }

    setState(() => svgRoot = drawableRoot!);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: svgRoot != null
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
                painter: SvgPainter(svgRoot!),
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
    svg.scaleCanvasToViewBox(canvas, size);
    svg.clipCanvasToViewBox(canvas);
    svg.draw(canvas, Rect.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

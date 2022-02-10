import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';

import '../../service/drawable.dart';
import 'painter/svg_painter.dart';

class AntagonistImage extends StatefulWidget {
  const AntagonistImage({Key? key}) : super(key: key);

  @override
  State<AntagonistImage> createState() => _AntagonistImageState();
}

class _AntagonistImageState extends State<AntagonistImage> {
  DrawableRoot? svgRoot;

  @override
  void initState() {
    super.initState();
    loadAntagonist();
  }

  Future<void> loadAntagonist() async {
    final svgCode = multiavatar('X-SLAYER', trBackground: true);
    final res = await generateDrawableFrom(svgCode);
    setState(() => svgRoot = res);
  }

  @override
  Widget build(BuildContext context) {
    return svgRoot != null
        ? CustomPaint(
            painter: SvgPainter(svgRoot!),
            child: Container(),
          )
        : const SizedBox();
  }
}

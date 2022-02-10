import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_them_all/utils/random.dart';
import 'package:multiavatar/multiavatar.dart';

import '../../service/drawable.dart';
import 'painter/svg_painter.dart';

class RandomAvatarAnimated extends StatefulWidget {
  const RandomAvatarAnimated({Key? key}) : super(key: key);

  @override
  State<RandomAvatarAnimated> createState() => _RandomAvatarAnimatedState();
}

class _RandomAvatarAnimatedState extends State<RandomAvatarAnimated> {
  DrawableRoot? svgRoot;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    loadAntagonist();
  }

  Future<void> loadAntagonist() async {
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      final svgCode = multiavatar(generatedRandomId(), trBackground: true);
      final res = await generateDrawableFrom(svgCode);
      setState(() => svgRoot = res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: svgRoot != null
          ? CustomPaint(
              painter: SvgPainter(svgRoot!),
              child: Container(),
            )
          : const SizedBox(),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/character_controller.dart';
import 'painter/svg_painter.dart';

class VictimImage extends StatelessWidget {
  const VictimImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterController = Get.find<CharacterController>();
    return Center(
      child: characterController.victim.svgRoot != null
          ? CustomPaint(
              painter: SvgPainter(characterController.victim.svgRoot!),
              child: Container(),
            )
          : const SizedBox(),
    );
  }
}

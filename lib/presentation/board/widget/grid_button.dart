import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/character_controller.dart';

class BoardGridButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final double dimension;
  final int tileNumber;

  const BoardGridButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.dimension,
    required this.tileNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactereCtrl = Get.find<CharacterController>();

    return RawMaterialButton(
      onPressed: onPress,
      child: SizedBox.square(
        dimension: dimension,
        child: Stack(
          fit: StackFit.expand,
          children: [
            charactereCtrl.goodSplited[tileNumber],
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

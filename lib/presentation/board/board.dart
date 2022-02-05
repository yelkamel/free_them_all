import 'dart:math';

import 'package:flutter/material.dart';
import 'package:free_them_all/controller/character_controller.dart';
import 'package:free_them_all/presentation/board/board_state.dart';
import 'package:free_them_all/presentation/board/widget/menu.dart';
import 'package:free_them_all/presentation/common/character_image.dart';
import 'package:free_them_all/theme/color.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'widget/grid_button.dart';

class Board extends StatelessWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactereCtrl = Get.find<CharacterController>();
    final dim = min(MediaQuery.of(context).size.width * 0.5, 500);
    return GetX<BoardController>(
      init: BoardController(),
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox.square(
            dimension: dim.toDouble(),
            child: Stack(
              children: [
                // CharacterImage(character: charactereCtrl.good),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.numbers.length,
                  itemBuilder: (context, index) {
                    return controller.numbers[index] != 0
                        ? Container(
                            color: kColorwhite,
                            child: SizedBox.square(
                              dimension: dim / 3,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  charactereCtrl.goodSplited[
                                      controller.numbers[index] - 1],
                                  Center(
                                    child: BoardGridButton(
                                      text: "${controller.numbers[index]}",
                                      onPress: () =>
                                          controller.onPressGridItem(index),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          const BoardMenu()
        ],
      ),
    );
  }
}

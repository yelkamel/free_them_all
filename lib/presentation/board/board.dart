import 'dart:math';

import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board_state.dart';
import 'package:get/get.dart';
import 'widget/grid_button.dart';

class Board extends StatelessWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dim = min(MediaQuery.of(context).size.width * 0.5, 500);
    return GetX<BoardController>(
      init: BoardController(),
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox.square(
            dimension: dim.toDouble(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.numbers.length,
              itemBuilder: (context, index) {
                return controller.numbers[index] != 0
                    ? BoardGridButton(
                        text: "${controller.numbers[index]}",
                        onPress: () => controller.onPressGridItem(index),
                        dimension: dim.toDouble() / 3,
                        tileNumber: controller.numbers[index] - 1,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

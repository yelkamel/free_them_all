import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board_state.dart';
import 'package:free_them_all/presentation/board/widget/menu.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'widget/grid_button.dart';

class Board extends StatelessWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BoardController>(
      init: BoardController(),
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox.square(
            dimension: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: controller.numbers.length,
                itemBuilder: (context, index) {
                  return controller.numbers[index] != 0
                      ? BoardGridButton(
                          text: "${controller.numbers[index]}",
                          onPress: () => controller.onPressGridItem(index),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
          const BoardMenu()
        ],
      ),
    );
  }
}

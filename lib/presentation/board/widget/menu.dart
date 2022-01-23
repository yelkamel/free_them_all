import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../board_state.dart';
import 'time.dart';
import 'reset_button.dart';
import 'move.dart';

class BoardMenu extends GetView<BoardController> {
  const BoardMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BoardResetButton(
            onPress: controller.onPressResetBoard,
            text: "Reset",
          ),
          Obx(() => BoardMove(move: controller.move.value)),
          BoardTimer(secondsPassed: controller.secondsPassed),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board_state.dart';
import 'package:free_them_all/presentation/board/widget/menu.dart';
import 'package:free_them_all/presentation/common/multiavatar_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'widget/grid_button.dart';
import 'package:image/image.dart' as imglib;

List<Image> splitImage(List<int> input) {
  // convert image to image from image package
  imglib.Image? image = imglib.decodeImage(input);

  int x = 0, y = 0;
  int width = (image!.width / 3).round();
  int height = (image!.height / 3).round();

  // split image to parts
  List<imglib.Image> parts = [];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      parts.add(imglib.copyCrop(image, x, y, width, height));
      x += width;
    }
    x = 0;
    y += height;
  }

  // convert image from image package to Image Widget to display
  List<Image> output = [];
  for (var img in parts) {
    // output.add(Image.memory(imglib.encodeJpg(img)));
  }

  return output;
}

class Board extends StatefulWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dim = 500.0;
    return GetX<BoardController>(
      init: BoardController(),
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox.square(
            dimension: dim,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => Opacity(
                    opacity: 1 - _controller.value,
                    child: const MultiAvatarImage(),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
              ],
            ),
          ),
          const BoardMenu()
        ],
      ),
    );
  }
}

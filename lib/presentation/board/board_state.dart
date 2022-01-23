import 'package:free_them_all/presentation/dialog/win_dialog.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  RxList<int> numbers =
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].obs;
  Rx<int> move = 0.obs;

  int secondsPassed = 0;
  bool isActive = false;

  @override
  void onInit() {
    super.onInit();
    numbers.shuffle();
  }

  void onPressGridItem(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }

    final isMovable =
        index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
            index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
            (index - 4 >= 0 && numbers[index - 4] == 0) ||
            (index + 4 < 16 && numbers[index + 4] == 0);

    if (isMovable) {
      move.value++;
      numbers[numbers.indexOf(0)] = numbers[index];
      numbers[index] = 0;
    }
    checkWin();
  }

  void onPressResetBoard() {
    numbers.shuffle();
    move.value = 0;
    secondsPassed = 0;
    isActive = false;
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      Get.dialog(
        const WinDialog(),
        barrierDismissible: false,
      );
    }
  }
}

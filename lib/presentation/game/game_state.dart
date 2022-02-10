import 'package:get/get.dart';

enum GameStep {
  intro,
  showVictim,
  breakVictim,
  startGame,
}

class GameState extends GetxController {
  final step = Rx(GameStep.intro);
  final hideAntagonist = RxBool(false);

  void onAntagonistSpeak(int i) {
    if (i == 2) step.value = GameStep.showVictim;
    if (i == 3) step.value = GameStep.breakVictim;
  }

  void onAntagonistSpealFinish() {
    hideAntagonist.value = true;
  }
}

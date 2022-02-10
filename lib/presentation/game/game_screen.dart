import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board.dart';
import 'package:free_them_all/presentation/game/game_state.dart';
import 'package:get/get.dart';

import '../common/antagonist_image.dart';
import '../common/random_avatar_animated.dart';
import '../common/victim_image.dart';
import 'widget/antagonist_dialog.dart';

class GameScreen extends StatelessWidget {
  final void Function()? onFinish;
  const GameScreen({Key? key, this.onFinish}) : super(key: key);

  static show() {
    Get.off(
      const GameScreen(),
      transition: Transition.circularReveal,
      duration: const Duration(seconds: 1),
    );
  }

  Widget buildStep(GameStep step) {
    switch (step) {
      case GameStep.intro:
        return const RandomAvatarAnimated();
      case GameStep.showVictim:
        return const VictimImage();
      case GameStep.breakVictim:
        return const Board();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: GetX<GameState>(
        init: GameState(),
        builder: (state) => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: buildStep(state.step.value)),
            ),
            const AntagonistDialog(),
          ],
        ),
      ),
    );
  }
}

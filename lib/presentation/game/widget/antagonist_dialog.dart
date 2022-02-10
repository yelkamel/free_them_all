import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/game/game_state.dart';
import 'package:get/get.dart';

import '../../common/antagonist_image.dart';
import '../../common/painter/bubble_dialog_painter.dart';

class AntagonistDialog extends StatefulWidget {
  const AntagonistDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AntagonistDialog> createState() => _AntagonistDialogState();
}

class _AntagonistDialogState extends State<AntagonistDialog> {
  @override
  Widget build(BuildContext context) {
    final state = Get.find<GameState>();

    return Obx(() {
      return AnimatedAlign(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        alignment: state.hideAntagonist.value
            ? const Alignment(-2, 0)
            : state.step.value == GameStep.breakVictim
                ? Alignment.topLeft
                : Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            height: 200,
            width: 300,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 200.0,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DefaultTextStyle(
                            style: Theme.of(context).textTheme.subtitle1!,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText('Who I will break....'),
                                TyperAnimatedText('Not that one'),
                                TyperAnimatedText('This one will be fin'),
                                TyperAnimatedText('*Badoumkam !*'),
                                TyperAnimatedText("It's will never be ordered"),
                                TyperAnimatedText(
                                    "in few moment, it's will be to late"),
                                TyperAnimatedText('hahaha bye !'),
                              ],
                              isRepeatingAnimation: false,
                              onNext: (_, __) => state.onAntagonistSpeak(_),
                              onFinished: state.onAntagonistSpealFinish,
                            ),
                          ),
                        ),
                      ),
                      CustomPaint(
                        painter: BubbleDialogPainter(
                          Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 34.0, left: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: AntagonistImage(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

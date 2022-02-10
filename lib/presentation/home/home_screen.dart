import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/game/game_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static replace() {
    Get.off(
      const HomeScreen(),
      transition: Transition.circularReveal,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            RawMaterialButton(
              onPressed: GameScreen.show,
              child: Text("Start"),
            ),
            RawMaterialButton(
              onPressed: GameScreen.show,
              child: Text("All my succes"),
            ),
            RawMaterialButton(
              onPressed: GameScreen.show,
              child: Text("Connect my data"),
            )
          ],
        ),
      ),
    );
  }
}

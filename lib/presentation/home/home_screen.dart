import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board.dart';
import 'package:get/get.dart';

import 'widgets/header.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: <Widget>[
              HomeHeader(size: size),
              const Board(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:free_them_all/controller/ctrl.dart';
import 'package:free_them_all/presentation/game/game_screen.dart';
import 'package:layoutools/layoutools.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  final void Function()? onFinish;
  const SplashScreen({Key? key, this.onFinish}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashAnimation();
  }

  Future<void> splashAnimation() async {
    setupController();
    await Future.delayed(const Duration(seconds: 2));
    HomeScreen.replace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: LoadingCircle(),
      ),
    );
  }
}

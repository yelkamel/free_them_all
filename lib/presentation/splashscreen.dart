import 'package:flutter/material.dart';
import 'package:free_them_all/controller/ctrl.dart';
import 'package:free_them_all/presentation/home/home_screen.dart';
import 'package:layoutools/layoutools.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    HomeScreen.replace();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:  LoadingCircle()));
  }
}

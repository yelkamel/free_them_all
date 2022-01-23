import 'package:flutter/material.dart';
import 'package:free_them_all/presentation/board/board.dart';

import 'widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            HomeHeader(size: size),
            const Board(),
          ],
        ),
      ),
    );
  }
}

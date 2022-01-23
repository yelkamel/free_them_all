import 'package:flutter/material.dart';

class BoardTimer extends StatelessWidget {
  final int secondsPassed;

  const BoardTimer({Key? key, required this.secondsPassed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "time: $secondsPassed",
        style: const TextStyle(
          fontSize: 18,
          decoration: TextDecoration.none,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BoardMove extends StatelessWidget {
  final int move;

  const BoardMove({
    Key? key,
    required this.move,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Move: ${move}",
        style: TextStyle(
            color: Colors.white, decoration: TextDecoration.none, fontSize: 18),
      ),
    );
  }
}

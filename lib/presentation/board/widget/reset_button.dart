import 'package:flutter/material.dart';

class BoardResetButton extends StatelessWidget {
  final void Function() onPress;
  final String text;

  const BoardResetButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Text("Reset"),
    );
  }
}

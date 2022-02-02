import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardGridButton extends StatelessWidget {
  final void Function() onPress;
  final String text;

  const BoardGridButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Container(
        color: Colors.green,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () {
        Get.dialog(Dialog(
          elevation: 5.0,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          // child: Image.memory(_imageFile!),
        ));
        onPress();
      },
    );
  }
}

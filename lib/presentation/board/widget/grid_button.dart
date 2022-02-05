import 'package:flutter/material.dart';
import 'package:free_them_all/theme/color.dart';

class BoardGridButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final Widget? child;

  const BoardGridButton(
      {Key? key, required this.text, required this.onPress, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Stack(
        children: [
          if (child != null) child!,
          Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kColorwhite,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () {
        /*
        Get.dialog(Dialog(
          elevation: 5.0,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          // child: Image.memory(_imageFile!),
        ));*/
        onPress();
      },
    );
  }
}

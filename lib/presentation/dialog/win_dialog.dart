import 'package:flutter/material.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "You Win!!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 220.0,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.white),
                  ),
                  fillColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

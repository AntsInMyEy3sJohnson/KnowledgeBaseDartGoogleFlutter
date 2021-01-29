import 'package:flutter/material.dart';

class ButtonWithBottomSheet extends StatelessWidget {
  const ButtonWithBottomSheet();
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: const Text("Show Bottom Sheet"),
      onPressed: () {
        showBottomSheet<String>(
            context: context,
            builder: (BuildContext buildContext) {
              return Container(
                color: Colors.black54,
                height: 200,
                child: const Center(
                  child: const Text(
                    "I'm the bottom sheet",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}

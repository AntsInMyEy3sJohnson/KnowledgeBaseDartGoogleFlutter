import 'package:flutter/material.dart';

class ButtonWithSimpleDialog extends StatelessWidget {
  const ButtonWithSimpleDialog();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("SimpleDialog"),
      onPressed: () {
        // 'showDialog()' returns a Future<T>!
        final type = showDialog<String>(
          context: context,
          builder: (BuildContext buildContext) {
            return SimpleDialog(
              title: const Text("Favorite Coffee?"),
              children: [
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, "firenze"),
                  child: const Text("Firenze"),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, "crema"),
                  child: const Text("Crema"),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, "amalfi"),
                  child: const Text("Amalfi"),
                ),
              ],
            );
          },
        );
        type.then(print);
      },
    );
  }
}

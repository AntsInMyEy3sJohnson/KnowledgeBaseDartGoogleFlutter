import 'package:flutter/material.dart';

class ButtonWithAlertDialog extends StatelessWidget {

  final String _alertQuestion;

  const ButtonWithAlertDialog(this._alertQuestion);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("AlertDialog"),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Alert Dialog Example"),
              content: Text(_alertQuestion),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Yes!"),
                  color: Colors.amber,
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("No."),
                  color: Colors.amber,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

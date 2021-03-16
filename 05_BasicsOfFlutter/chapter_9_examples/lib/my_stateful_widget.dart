import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  final String _s;
  const MyStatefulWidget(this._s);

  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget._s}"),
        Text("$_counter"),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() => _counter++);
          },
        ),
      ],
    );
  }

}

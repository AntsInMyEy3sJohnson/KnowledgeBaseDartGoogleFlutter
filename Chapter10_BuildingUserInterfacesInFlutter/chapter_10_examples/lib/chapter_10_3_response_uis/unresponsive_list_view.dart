import 'package:flutter/material.dart';

class UnresponsiveListView extends StatelessWidget {
  const UnresponsiveListView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, id) {
          // This is not responsive -- if the device orientation changes
          // from portrait to landscape, there'll be a lot of unused screen
          // space to the right of each item in the list.
          return ListTile(
            leading: const Icon(Icons.android),
            title: Text("Item No. $id"),
          );
        },
      ),
    );
  }
}

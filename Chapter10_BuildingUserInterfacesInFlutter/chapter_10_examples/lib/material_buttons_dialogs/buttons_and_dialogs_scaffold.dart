import 'package:flutter/material.dart';

import 'button_with_alert_dialog.dart';
import 'button_with_bottom_sheet.dart';
import 'button_with_simple_dialog.dart';

class ButtonsAndDialogsScaffold extends StatelessWidget {
  const ButtonsAndDialogsScaffold();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // By default, the app bar automatically adds
        // a "back" button while navigating away from the
        // home page, and setting the below to 'false' will
        // deactivate this behavior
        automaticallyImplyLeading: true,
        title: const Text('Chapter 10 Examples'),
        actions: [
          // In general, actions are clickable buttons carrying
          // an icon that visually represents each button's
          // purpose
          Padding(
              padding: EdgeInsets.only(right: 25),
              child: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () => print("Info button pressed"),
              ))
        ],
      ),
      // Drawer: Container that slides into the screen from one
      // side (horizontally from left to right, in most cases)
      // in order to show a list of items. Usually, the drawer's
      // items route the user to specific pages of the app.
      // Below: 'Traditional' left-to-right drawer
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("Events"),
              onTap: () => print("Events item tapped"),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text("Map"),
              onTap: () => print("Map item tapped"),
            ),
          ],
        ),
      ),
      // This one slides in from right to left
      endDrawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text("I'm a RaisedButton"),
            ),
            // Like a static version of a RaisedButton
            FlatButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text("I'm a FlatButton"),
            ),
            Container(
              child: Column(
                children: [
                  Text("Do I want coffee?"),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Yes"),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.height),
              onPressed: () {},
            ),
            // Dialogs require a build context containing
            // some localization, and the default one is provided
            // by the 'MaterialApp'. Hence, the build context used
            // by the dialog must come from somewhere below
            // the MaterialApp -- if the dialogs were embedded here,
            // an exception ("No MaterialLocalizations found") would
            // be thrown!
            ButtonWithAlertDialog("Are you alerted?"),
            ButtonWithSimpleDialog(),
            ButtonWithBottomSheet(),
          ],
        ),
      ),
      // Usually appears in the lower-right corner
      // of the screen, but this is configurable.
      // A Scaffold can only carry a single FAB!
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      // 'endFloat' is the default
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }


}
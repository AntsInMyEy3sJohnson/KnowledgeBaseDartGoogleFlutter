import 'package:chapter_10_examples/material_buttons_dialogs/button_with_alert_dialog.dart';
import 'package:chapter_10_examples/material_buttons_dialogs/button_with_bottom_sheet.dart';
import 'package:chapter_10_examples/material_buttons_dialogs/button_with_simple_dialog.dart';
import 'package:chapter_10_examples/material_buttons_dialogs/buttons_and_dialogs_scaffold.dart';
import 'package:chapter_10_examples/responsive_user_interfaces//responsive_list_view.dart';
import 'package:chapter_10_examples/responsive_user_interfaces//unresponsive_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 'ThemeData' should always declare 'primaryColor' (for the most common
      // widgets such as scaffolds, tab bars, text field focuses, ...) and
      // 'accentColor' (color for foreground widgets such as FABs)
      // To implement light and dark themes, sets of predefined colors
      // are available through the named constructors '.dark()' and '.light()'
      // It's also possible to use a theme on one specific widget, for example,
      // the footer
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey
      ),
      // Scaffold
      // Implements basic material design layout structure (drawer,
      // app bar, footer, floating action button in lower-right
      // corner, ...)
      // home: const ButtonsAndDialogsScaffold(),
      // home: const UnresponsiveListView(),
      home: const ResponseListView(),
    );
  }
}

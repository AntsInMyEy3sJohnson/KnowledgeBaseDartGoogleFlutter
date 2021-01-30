import 'package:chapter_11_examples/chapter_11_1_set_state_ui_updates/demo_page.dart';
import 'package:chapter_11_examples/chapter_11_2_passing_state_with_provider/counter_model.dart';
import 'package:chapter_11_examples/chapter_11_2_passing_state_with_provider/demo_page_using_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Note to self: MUST NOT FORGET 'CONST' CONSTRUCTOR!
      // home: const DemoPage(),
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        // By doing this, 'DemoPageUsingProvider' becomes a
        // listener to the invocations of 'notifyListeners()'
        // within the model class
        child: const DemoPageUsingProvider(),
      ),
    );
  }
}


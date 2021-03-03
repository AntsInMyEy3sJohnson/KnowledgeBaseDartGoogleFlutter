import 'package:chapter_16_examples/testing_widgets/person.dart';
import 'package:chapter_16_examples/testing_widgets/widget_test_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Tests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: const WidgetTestHome("Jane", "Doe", 28),
      ),
    );
  }
}

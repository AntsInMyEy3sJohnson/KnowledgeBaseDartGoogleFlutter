import 'package:chapter_16_examples/testing_widgets/person.dart';
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
      home: const WidgetTestHome(),
    );
  }
}

class WidgetTestHome extends StatelessWidget {
  const WidgetTestHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Person(27, "John", "Doe"),
      ),
    );
  }
}

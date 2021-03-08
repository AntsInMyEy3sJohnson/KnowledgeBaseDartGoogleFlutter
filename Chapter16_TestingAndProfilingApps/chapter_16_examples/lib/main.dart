import 'package:chapter_16_examples/integration_testing/simple_counter.dart';
import 'package:chapter_16_examples/testing_widgets/widget_with_counter_bloc.dart';
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
        // body: const WidgetTest("Jane", "Doe", 28),
        // body: const WidgetWithCounterBlocHome(),
        body: const SimpleCounterScaffold()
      ),
    );
  }
}

import 'package:chapter_19_examples/forms_and_validation/layout.dart';
import 'package:chapter_19_examples/forms_and_validation/login_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: const Layout(),
      ),
    );
  }
}

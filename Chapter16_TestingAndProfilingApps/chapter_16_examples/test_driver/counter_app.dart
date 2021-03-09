import 'package:chapter_16_examples/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

// Can be started using the following command (from project's root directory):
// $ flutter drive --target=test_driver/counter_app.dart
// Caution: Pay attention to file naming! If the file enabling the Flutter driver
// extension and running the app/widget under test is named 'something.dart', then
// 'flutter drive' will expect a file called 'something_test.dart' in the same directory.
void main() {
  // Prepares Dart VM for an instrumented test. This is required so the "test driver"
  // can perform various UI actions in place of an actual user (pressing UI buttons,
  // scrolling, etc.).
  enableFlutterDriverExtension();

  // Can be passed any widget that needs testing
  runApp(MyApp());
}

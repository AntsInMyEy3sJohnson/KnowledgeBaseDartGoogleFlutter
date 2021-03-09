import 'package:chapter_16_examples/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Prepares Dart VM for an instrumented test. This is required so the "test driver"
  // can perform various UI actions in place of an actual user (pressing UI buttons,
  // scrolling, etc.).
  enableFlutterDriverExtension();

  // Can be passed any widget that needs testing
  runApp(MyApp());

  group("Test of the simple Counter app", () {
    final counterStateText = driver.find.byValueKey("counterStateText");
    final incrementButton = driver.find.byValueKey("counterIncrementButton");
    final decrementButton = driver.find.byValueKey("counterDecrementButton");

    driver.FlutterDriver flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect();
    });

    tearDownAll(() async {
      flutterDriver.close();
    });

    test("Test counter increment", () async {
      await flutterDriver.tap(incrementButton);
      await flutterDriver.tap(incrementButton);

      final currentCounterState = flutterDriver.getText(counterStateText);
      expect(currentCounterState, "2");
    });

    test("Test counter decrement", () async {
      await flutterDriver.tap(decrementButton);

      final currentCounterState = flutterDriver.getText(counterStateText);
      expect(currentCounterState, "1");
    });
  });
}

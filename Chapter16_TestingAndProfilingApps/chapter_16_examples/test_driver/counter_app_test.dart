import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:test/test.dart';

void main() {
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

      final currentCounterState = await flutterDriver.getText(counterStateText);
      expect(currentCounterState, "2");
    });

    test("Test counter decrement", () async {
      await flutterDriver.tap(decrementButton);

      final currentCounterState = await flutterDriver.getText(counterStateText);
      expect(currentCounterState, "1");
    });
  });
}

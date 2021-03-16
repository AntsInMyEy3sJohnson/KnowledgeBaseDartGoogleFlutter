import 'package:flutter_test/flutter_test.dart';

void main() {
  // Testing asynchronous code and streams
  test('Test method with "async" and "await"', () async {
    // Nothing new -- this works as if the code were synchronous, except its
    // execution might take slightly longer
    final number = await Future<int>.value(42);
    expect(number, equals(42));
  });

  final coffeeCounter = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  test('Testing the "coffeeCounter" stream', () {
    expect(
        coffeeCounter,
        // Many more 'emit' matchers available
        emitsInOrder([
          // List of individual matchers goes here
          1,
          2,
          3,
          4,
          emitsAnyOf([5, 6]),
          emitsDone,
        ]));
  });
}

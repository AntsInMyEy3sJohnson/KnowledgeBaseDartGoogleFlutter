import 'package:chapter_16_examples/fraction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Expect 6 divided by 3 to be 2.', () {
    final fraction = Fraction(n: 6, d: 3);

    final expected = 2.0;
    final actual = fraction.toDouble;

    expect(actual, expected);
  });
}

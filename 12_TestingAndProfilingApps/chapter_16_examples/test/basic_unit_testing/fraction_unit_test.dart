import 'package:chapter_16_examples/basic_unit_testing/fraction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('All testing related to the "Fraction" class.', () {
    test('Expect 6 divided by 3 to be 2.', () {
      final fraction = Fraction(n: 6, d: 3);

      final expected = 2.0;

      // Matcher argument here is only a single value, but the matcher library
      // offers many useful methods to be used.
      expect(fraction.toDouble, expected);
    });

    test('Expect invocation of "negate" to produce negated number.', () {
      final fraction = Fraction(n: 10, d: 2);

      final expected = -5.0;

      fraction.negate();

      expect(fraction.toDouble, expected);
    });

    test(
        'Expect exception to be thrown when attempting to '
        'initialize Fraction object with 0 denominator.', () {
      expect(() => Fraction(n: 1, d: 0), throwsA(isA<FractionException>()));
    });
  });
}

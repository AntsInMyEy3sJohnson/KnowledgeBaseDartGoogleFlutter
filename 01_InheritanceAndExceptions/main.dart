import 'fraction.dart';

void main() {

  final duck = Duck('quack');
  duck.likesWater();
  duck.swim();
  duck.walk();

  print("1/3".toFraction());

  try {
    final f = ExFraction(1, 0);
  } on IntegerDivisionByZeroException catch (ex) {
    print(ex);
  } on FormatException {
    // do something
  } catch (ex) {
    // 'catch-all'
    print('General error: $ex');
  }
  // 'finally' just like in Java

}

// Exceptions
// Dart API provides interface 'Exception' implemented by all exception classes
// in Dart's core library --> Good idea to implement interface in own exception classes, too
// Error class: Caution: Convention for using 'Error' class is different from Java.
// In Java: Use 'Error' when an abnormal condition is so catastrophic for program flow
// that nothing can be done about it (i. e. 'OutOfMemoryError')
// In Dart: Use 'Error' for programming-related errors like stepping out of a list's
// bounds, or more general: Use 'Error' whenever unexpected program flow was caused
// by a programming error.
// And -- just like in Java -- errors should not be caught.
// Exception => "Logical errors"
// Errors => Language-specific programming mistakes the programmer should fix
// 'rethrow' keyword to re-throw exceptions -- prefer it over re-throwing the
// same exception using 'throw' because 'rethrow' preserves the original stack trace
class FractionDivisionByZeroException implements Exception {
  final String message;
  const FractionDivisionByZeroException(this.message);

  @override
  String toString() => message;

}

class ExFraction {
  final int _n;
  final int _d;

  ExFraction(int n, int d)
      : _n = n,
        _d = d != 0 ? d : throw FractionDivisionByZeroException("Denominator must not be zero.");
}

// Comparable<T>
class ComparableFraction implements Comparable<ComparableFraction> {
  final int _n;
  final int _d;

  ComparableFraction(this._n, this._d);

  int get n => _n;

  int get d => _d;

  double toDouble() => _n / _d;

  @override
  int compareTo(ComparableFraction other) {
    if (toDouble() < other.toDouble()) return -1;
    if (toDouble() > other.toDouble()) return 1;
    return 0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComparableFraction &&
          runtimeType == other.runtimeType &&
          _n == other._n &&
          _d == other._d;

  @override
  int get hashCode => _n.hashCode ^ _d.hashCode;
}

// Mixins
// Mixin features:
// * A class can be associated to arbitrarily many mixins
// * The methods "imported" by means of the mixins are inherited to subclasses
mixin Swimming {
  void swim() => print('Swimming.');

  void likesWater() => true;
}

mixin Walking {
  void walk() => print('Walking.');
}

// Mixins can be constrained to be used only on the subclasses of a certain type:
mixin Coding on Human {
  void turnCoffeeIntoCode() => print('Turning coffee into code.');
}

// Would not compile:
// class Human with Coding {}
// --> Can only use mixin on subclasses of 'Human'
class Developer extends Human with Coding {}

class Duck with Walking, Swimming {
  final String _sound;

  Duck(this._sound);

  @override
  String toString() => '$_sound';
}

// The 'covariant' keyword
abstract class Fruit {}

class Apple extends Fruit {}

class Grape extends Fruit {}

class Banana extends Fruit {}

abstract class Mammal {
  void eat(Fruit fruit);
}

class Human extends Mammal {
  // Fine without 'covariant' keyword
  @override
  void eat(Fruit fruit) => print("Eating fruit.");
}

class Monkey extends Mammal {
  // Only compiles with 'covariant' keyword.
  // Better: Define parameter in parent class as 'covariant'
  @override
  void eat(covariant Banana banana) => print("Eating banana.");
}


// Extension methods
// Should generally be put in a dedicated file so they can be imported by importing
// the file as a library
// Extensions are a great means to implement short and trivial functionality and
// should therefore be preferred to static 'utility functions'
// Extension methods cannot be used with 'dynamic' (caution: Attempting to do so
// will not result in a compile-time error, but yield a runtime exception)
extension FractionExtension on String {
  bool isFraction() => this.contains('/');

  // This is brilliant, I like this!
  Fraction toFraction() => Fraction.fromString(this);
}

class Fraction {
  final int _n;
  final int _d;

  Fraction(this._n, this._d);

  Fraction.fromString(String s)
      : _n = int.tryParse(s.substring(0, s.indexOf('/'))) ?? 1,
        _d = int.tryParse(s.substring(s.indexOf('/') + 1)) ?? 1;

  int get n => _n;

  int get d => _d;

  @override
  String toString() => '$_n / $_d';
}
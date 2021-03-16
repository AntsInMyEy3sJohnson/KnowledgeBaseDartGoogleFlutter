class Fraction {
  int _n;
  int _d;

  Fraction({int n = 0, int d = 1}) {
    _n = n;
    _d = d == 0 ? throw FractionException("Denominator must not be zero.") : d;
  }

  void negate() => _n *= -1;

  double get toDouble => _n / _d;

  @override
  String toString() {
    return 'Fraction{_n: $_n, _d: $_d}';
  }
}

class FractionException implements Exception {
  final String message;

  const FractionException(this.message);
}

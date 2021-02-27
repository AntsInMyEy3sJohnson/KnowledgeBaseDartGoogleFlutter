class Fraction {
  int _n;
  int _d;

  Fraction({int n = 0, int d = 1})
      : _n = n,
        _d = d;
  
  void negate() => _n * -1;
  
  double get toDouble => _n / _d;

  @override
  String toString() {
    return 'Fraction{_n: $_n, _d: $_d}';
  }

}

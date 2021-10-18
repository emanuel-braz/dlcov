class Coverage {
  final double _minCoverage;
  double _totalCoverage = 0;

  bool get isCovered {
    if (_minCoverage <= 0) {
      return true;
    }
    return totalCoverage >= minCoverage;
  }

  double get minCoverage => double.parse(_minCoverage.toStringAsFixed(1));

  double get totalCoverage => double.parse(_totalCoverage.toStringAsFixed(1));
  set totalCoverage(double value) {
    _totalCoverage = value;
  }

  Coverage(this._minCoverage);
}

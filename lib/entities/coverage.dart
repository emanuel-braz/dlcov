/// Coverage entity
class Coverage {
  final double _minCoverage;
  double _totalCoverage = 0;

  /// if [isCovered]
  bool get isCovered {
    if (_minCoverage <= 0) {
      return true;
    }
    return totalCoverage >= minCoverage;
  }

  /// [minCoverage]
  double get minCoverage => double.parse(_minCoverage.toStringAsFixed(1));

  /// [totalCoverage]
  double get totalCoverage => double.parse(_totalCoverage.toStringAsFixed(1));
  set totalCoverage(double value) {
    _totalCoverage = value;
  }

  /// [Coverage] constructor
  Coverage(this._minCoverage);
}

import 'dart:io';

class Dlcov {
  void call(List<String> arguments) async {
    late String lcovFile;
    late double minCoverage;

    try {
      lcovFile = arguments[0];
      minCoverage = double.parse(arguments[1]);
    } catch (e) {
      print('[ERROR]: Invalid argument');
      exit(128);
    }

    try {
      final lines = await File(lcovFile).readAsLines();
      final coverage = lines.fold([0, 0], (List<int> data, line) {
        var testedLines = data[0];
        var totalLines = data[1];
        if (line.startsWith('DA')) {
          totalLines++;
          if (double.parse(line.split(',')[1]) > 0) {
            testedLines++;
          }
        }
        return [testedLines, totalLines];
      });

      final testedLines = coverage[0];
      final totalLines = coverage[1];
      final totalCoverage = (testedLines / totalLines) * 100;

      if (minCoverage > totalCoverage) {
        print(
            '[FAIL]: The total code coverage ${totalCoverage.toStringAsFixed(1)}% is lower than expected $minCoverage%');
        exit(1);
      } else {
        print(
            '[SUCCESS]: The total code coverage ${totalCoverage.toStringAsFixed(1)}% is equal to, or greater than expected $minCoverage%');
        exit(0);
      }
    } catch (e) {
      print('[ERROR]: Command invoked cannot execute');
      exit(126);
    }
  }
}

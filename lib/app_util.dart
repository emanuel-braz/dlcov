import 'dart:io';

import 'package:dlcov/coverage_entity.dart';

class AppUtil {
  Future<CoverageEntity> getCoverageEntity(
      double minCoverage, String lcovFile) async {
    var entity = CoverageEntity(minCoverage, lcovFile);
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

    entity.totalCoverage = (testedLines / totalLines) * 100;

    return entity;
  }
}

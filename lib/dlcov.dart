import 'dart:io';
import 'package:dlcov/coverage_entity.dart';
import 'package:dlcov/app_util.dart';

class Dlcov {
  late CoverageEntity coverageInfo;

  void call(List<String> arguments) async {
    try {
      var lcovFile = arguments[0];
      var minCoverage = double.parse(arguments[1]);
      coverageInfo = await AppUtil().getCoverageEntity(minCoverage, lcovFile);
    } catch (e) {
      print('[ERROR]: Invalid or missing arguments');
      exit(128);
    }

    try {
      if (!coverageInfo.isCovered) {
        print(
            '[FAIL]: The total code coverage ${coverageInfo.totalCoverage.toStringAsFixed(1)}% is lower than expected ${coverageInfo.minCoverage}%');
        exit(1);
      } else {
        print(
            '[SUCCESS]: The total code coverage ${coverageInfo.totalCoverage.toStringAsFixed(1)}% is equal to, or greater than expected ${coverageInfo.minCoverage}%');
        exit(0);
      }
    } catch (e) {
      print('[ERROR]: Command invoked cannot execute');
      exit(126);
    }
  }
}

import 'dart:io';

import '../entities/lcov.dart';

class VerifyCoverage {
  void call(Lcov lcov) {
    try {
      if (lcov.coverage.isCovered) {
        print(
            '[SUCCESS]: The total code coverage ${lcov.coverage.totalCoverage.toStringAsFixed(1)}% is equal to, or greater than expected ${lcov.coverage.minCoverage}%');
        exit(0);
      } else {
        print(
            '[FAIL]: The total code coverage ${lcov.coverage.totalCoverage.toStringAsFixed(1)}% is lower than expected ${lcov.coverage.minCoverage}%');
        exit(1);
      }
    } catch (e) {
      print('[ERROR]: Command invoked cannot execute');
      exit(126);
    }
  }
}

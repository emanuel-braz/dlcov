import 'dart:io';

import '../core/app_error_codes.dart';
import '../entities/lcov.dart';

class VerifyCoverage {
  /// Verify the test coverage
  void call(Lcov lcov) {
    try {
      if (lcov.coverage.isCovered) {
        print(
            '[SUCCESS]: The total code coverage ${lcov.coverage.totalCoverage.toStringAsFixed(1)}% is equal to, or greater than expected ${lcov.coverage.minCoverage}%');
        exit(AppErrorCodes.noError);
      } else {
        print(
            '[FAIL]: The total code coverage ${lcov.coverage.totalCoverage.toStringAsFixed(1)}% is lower than expected ${lcov.coverage.minCoverage}%');
        exit(AppErrorCodes.generalError);
      }
    } catch (e) {
      print('[ERROR]: Command invoked cannot execute');
      exit(AppErrorCodes.commandCannotExecute);
    }
  }
}

import 'dart:io';

import '../core/app_constants.dart';
import '../entities/lcov.dart';

class Logger {
  final coverageParam = 'coverage=';
  final minCoverageParam = 'minCoverage=';
  final successParam = 'success=';

  void log(Lcov lcov) {
    try {
      final file = File(AppConstants.dlcovLogFile)..createSync();

      try {
        final lines = file.readAsLinesSync();

        if (lines.isNotEmpty) {
          final lastLine = lines.last;
          final params = lastLine.split(',');

          if (params[0].startsWith(coverageParam)) {
            final lastCoverage = double.parse(params[0].split('=').last);
            if (lastCoverage > lcov.coverage.totalCoverage) {
              print('Decrease ${lastCoverage - lcov.coverage.totalCoverage} coverage :(');
            } else if (lastCoverage < lcov.coverage.totalCoverage) {
              print('Increase ${lcov.coverage.totalCoverage - lastCoverage} coverage :)');
            } else {
              print('Keep same coverage :|');
            }
          }

          if (lines.length > AppConstants.maxLogLines) {
            _writeToFile(file, lcov, FileMode.write);
          } else {
            _writeToFile(file, lcov, FileMode.append);
          }
        } else {
          _writeToFile(file, lcov, FileMode.append);
        }
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  void _writeToFile(File file, Lcov lcov, FileMode mode) {
    file.writeAsStringSync(
      '$coverageParam${lcov.coverage.totalCoverage}, $minCoverageParam${lcov.config.percentage}, $successParam${lcov.coverage.isCovered}\n',
      mode: mode,
    );
  }
}

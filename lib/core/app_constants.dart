/// [AppConstants]
class AppConstants {
  static String argLongFile = 'file';
  static String argLongCoverage = 'coverage';
  static String argLongExcludeSufix = 'exclude-sufix';
  static String argLongLog = 'log';

  static String argShortFile = 'f';
  static String argShortCoverage = 'c';
  static String argShortExcludeSufix = 'e';
  static String argShortLog = 'l';

  static String falseAsStringValue = 'false';
  static String excludeSufixDefaultValue = '.g.dart,.freezed.dart,.part.dart';
  static String lcovPathDefaultValue = 'coverage/lcov.info';

  static String dlcovLogFile = './dlcov.log';
  static int maxLogLines = 1000;
  static String fileSystemExceptionMessage =
      'The lcov file is not valid! Please enter a valid file and/or correct path\n e.g. "-f path/to/lcov.info"';

  static String dlcovFileReferences = 'test/dlcov_references_test.dart';
}

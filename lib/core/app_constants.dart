/// [AppConstants]
class AppConstants {
  static String argLongFile = 'file';
  static String argLongCoverage = 'coverage';
  static String argLongExcludeSufix = 'exclude-sufix';
  static String argLongLog = 'log';
  static String argLongHelp = 'help';
  static String argLongPackageName = 'package-name';

  static String argShortFile = 'f';
  static String argShortCoverage = 'c';
  static String argShortExcludeSufix = 'e';
  static String argShortLog = 'l';
  static String argShortHelp = 'h';
  static String argShortPackageName = 'p';

  static String falseAsStringValue = 'false';
  static String excludeSufixDefaultValue = '.g.dart,.freezed.dart,.part.dart';
  static String lcovPathDefaultValue = 'coverage/lcov.info';

  static String dlcovLogFile = './dlcov.log';
  static int maxLogLines = 1000;
  static String fileSystemExceptionMessage =
      '\nDid you forget to run flutter test --coverage?\n\n'
      'Please run "flutter test --coverage" or enter a valid lcov.info file.\ne.g. "-f path/to/lcov.info"\n';

  static String dlcovFileReferences = 'test/dlcov_references_test.dart';
}

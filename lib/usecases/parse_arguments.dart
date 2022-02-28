import 'package:args/args.dart';

import '../core/app_constants.dart';

class ParseArguments {
  /// Return argResults
  ArgResults getArgResults(List<String> arguments, ArgParser parser) {
    parser.addOption(AppConstants.argLongCoverage,
        abbr: AppConstants.argShortCoverage, mandatory: true);

    parser.addOption(AppConstants.argLongExcludeSufix,
        abbr: AppConstants.argShortExcludeSufix,
        defaultsTo: AppConstants.excludeSufixDefaultValue,
        mandatory: false);

    parser.addOption(AppConstants.argLongLog,
        abbr: AppConstants.argShortLog,
        defaultsTo: AppConstants.falseAsStringValue,
        mandatory: false);

    parser.addOption(AppConstants.argLongPackageName,
        abbr: AppConstants.argShortPackageName,
        defaultsTo: null,
        mandatory: false);

    final argResults = parser.parse(arguments);

    return argResults;
  }
}

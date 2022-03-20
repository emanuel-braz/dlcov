import 'dart:io';

import 'package:args/args.dart';

import '../core/app_constants.dart';

class ParseArguments {
  /// Return argResults
  ArgResults getArgResults(List<String> arguments, ArgParser parser) {
    parser.addOption(AppConstants.argLongCoverage,
        abbr: AppConstants.argShortCoverage, mandatory: false);

    parser.addCommand(AppConstants.cmdPrepare, ArgParser());

    parser.addFlag(AppConstants.argLongHelp,
        defaultsTo: false,
        abbr: AppConstants.argShortHelp,
        callback: showHelpAndExit,
        help: AppConstants.argHelpDescription);

    parser.addOption(AppConstants.argLongExcludeSuffix,
        abbr: AppConstants.argShortExcludeSuffix,
        defaultsTo: AppConstants.excludeSuffixDefaultValue,
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

showHelpAndExit(bool help) {
  if (help) {
    print('\nLong\t\tShort\tMandatory\tDefault\t\t\tSample\t\tDescription\n\n'
        '--coverage\t-c\ttrue\t\t80.0\t\t\t\t\tMin coverage threshold\n'
        '--log\t\t-l\tfalse\t\tfalse\t\t\ttrue\t\tLog every test coverage info in dlcov.log - Limit up to 1000 lines\n'
        '--exclude-suffix\t-e\tfalse\t\t.g.dart,.freezed.dart\t.g.dart\t\tRemove generated files from test coverage results, separated by commas\n'
        '--package-name\t-p\tfalse\t\tcurr dir name\t\tdlcov\t\tUse this, if root folder is not the same as the package name\n\n'
        'Example: dlcov -c 80\n');
    exit(0);
  }
}

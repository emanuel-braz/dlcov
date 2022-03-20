import 'dart:io';

import 'package:args/args.dart';

import '../core/app_constants.dart';

class ParseArguments {
  /// Return argResults
  ArgResults getArgResults(List<String> arguments, ArgParser parser) {
    parser.addOption(AppConstants.argLongCoverage,
        abbr: AppConstants.argShortCoverage, mandatory: false);

    parser.addOption(AppConstants.argLcovGen, mandatory: false);

    parser.addOption(AppConstants.argIncludeUntestedFiles, mandatory: false);

    parser.addCommand(AppConstants.cmdGenRefs, ArgParser());

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
    print('\n'
        '--coverage, -c\t\t\tMin coverage threshold\n'
        '--log, -l\t\t\tLog every test coverage info in dlcov.log - Limit up to 1000 lines\n'
        '--exclude-suffix, -e\t\tRemove generated files from test coverage results, separated by commas\n'
        '--include-untested-files\tUse this, if root folder is not the same as the package name\n'
        '--lcov-gen\t\t\tGenerate `lcov.info` through the command "flutter test --coverage"\n'
        '\nCommands:\n\n'
        'gen-refs\t\t\tGenerate tested and untested file references, it should be used before `lcov.info` file generation step.\n\n'
        '\tUsage Example:\n'
        '\tdlcov -c 80 --lcov-gen="flutter test --coverage"\n');
    exit(0);
  }
}

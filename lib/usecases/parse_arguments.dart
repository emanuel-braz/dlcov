import 'dart:io';

import 'package:args/args.dart';

import '../core/app_constants.dart';
import '../core/app_error_codes.dart';

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

    parser.addMultiOption(AppConstants.argLongExcludeFiles,
        splitCommas: true, help: AppConstants.argLongExcludeFilesHelp);

    parser.addMultiOption(AppConstants.argLongExcludeContents,
        splitCommas: true, help: AppConstants.argLongExcludeContentsHelp);

    parser.addOption(AppConstants.argLongExcludeContentsPath,
        mandatory: false, help: AppConstants.argLongExcludeContentsPathHelp);

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
        '--include-untested-files\tGet reports more coherent with reality, and do not ignore untested files during the analysis\n'
        '--lcov-gen\t\t\tGenerate `lcov.info` through the command "flutter test --coverage"\n'
        '--exclude-files\t\t\tExclude files using regular expression\n'
        '--exclude-contents\t\t\tExclude files using regular expression by it\'s content/code \n'
        '--exclude-contents-path\t\t\tSelect a dictionary file, in order to exclude files using regular expression by it\'s content/code\n'
        '\nCommands:\n\n'
        'gen-refs\t\t\tGenerate tested and untested file references, it should be used before `lcov.info` file generation step.\n\n'
        '\tUsage Example:\n'
        '\tdlcov -c 80 --lcov-gen="flutter test --coverage"\n');
    exit(AppErrorCodes.noError);
  }
}

import 'dart:io';

import 'package:args/args.dart';
import 'package:dlcov/core/app_constants.dart';
import 'package:dlcov/entities/config.dart';
import 'package:dlcov/repositories/config_repostory.dart';
import 'package:dlcov/repositories/record_repository.dart';
import 'package:dlcov/usecases/create_file_references.dart';
import 'package:dlcov/usecases/get_config.dart';
import 'package:dlcov/usecases/get_lcov.dart';
import 'package:dlcov/usecases/get_records.dart';
import 'package:dlcov/usecases/parse_arguments.dart';
import 'package:dlcov/usecases/verify_coverage.dart';
import 'package:dlcov/utils/file_system/file_system_util.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  final Config config;

  parser.addFlag('help',
      defaultsTo: false, abbr: 'h', callback: showHelpAndExit);

  final argResults = ParseArguments().getArgResults(arguments, parser);
  config = GetConfig(ConfigRepository(argResults), parser)();

  // Create references for all dart files
  await CreateFileReferences(
          CreateFileReferencesHelper(FileSystemUtil()),
          AppConstants.sourceDirectory,
          config.excludeSufixes,
          config.packageName)
      .call();

  // Generate lcov.info
  await Process.run('flutter', ['test', '--coverage']);

  // Verify minimum coverage threshold
  final getLcov = GetLcov(
      config, GetRecords(RecordsRepository(AppConstants.lcovPathDefaultValue)));
  VerifyCoverage()(await getLcov());
}

showHelpAndExit(bool help) {
  if (help) {
    print('\nLong\t\tShort\tMandatory\tDefault\t\t\tSample\t\tDescription\n\n'
        '--coverage\t-c\ttrue\t\t80.0\t\t\t\t\tMin coverage threshold\n'
        '--log\t\t-l\tfalse\t\tfalse\t\t\ttrue\t\tLog every test coverage info in dlcov.log - Limit up to 1000 lines\n'
        '--exclude-sufix\t-e\tfalse\t\t.g.dart,.freezed.dart\t.g.dart\t\tRemove generated files from test coverage results, separated by commas\n'
        '--package-name\t-p\tfalse\t\tcurr dir name\t\tdlcov\t\tUse this, if root folder is not the same as the package name\n\n'
        'Example: dlcov -c 80\n');
    exit(0);
  }
}

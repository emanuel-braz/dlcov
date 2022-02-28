import 'dart:io';

import 'package:args/args.dart';
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

  parser.addFlag('help',
      defaultsTo: false, abbr: 'h', callback: showHelpAndExit);

  final argResults = ParseArguments().getArgResults(arguments, parser);
  final config = GetConfig(ConfigRepository(argResults), parser)();

  // Create references for all dart files
  await CreateFileReferences(CreateFileReferencesHelper(FileSystemUtil()),
          'lib', config.excludeSufixes, config.packageName)
      .call();

  // Verify minimum coverage threshold
  final getLcov = GetLcov(config, GetRecords(RecordsRepository(config.file)));
  VerifyCoverage()(await getLcov());
}

showHelpAndExit(bool help) {
  if (help) {
    print('\nLong\t\tShort\tMandatory\tDefault\t\t\tSample\t\tDescription\n\n'
        '--coverage\t-c\ttrue\t\t80.0\t\t\t\t\tMin coverage threshold\n'
        '--file\t\t-f\tfalse\t\tcoverage/lcov.info\t./lcov.info	Relative lcov file path\n'
        '--log\t\t-l\tfalse\t\tfalse\t\t\ttrue\t\tLog every test coverage info in dlcov.log - Limit up to 1000 lines\n'
        '--exclude-sufix\t-e\tfalse\t\t.g.dart,.freezed.dart\t.g.dart\t\tRemove generated files from test coverage results, separated by commas\n'
        '--package-name\t-p\tfalse\t\tcurr dir name\t\tdlcov\t\tUse this, if root folder is not the same as the package name\n\n'
        'Example: dlcov -f coverage/lcov.info -c 80\n');
    exit(0);
  }
}

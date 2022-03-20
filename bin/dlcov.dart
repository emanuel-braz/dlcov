import 'dart:io';
import 'package:args/args.dart';
import 'package:dlcov/core/app_constants.dart';
import 'package:dlcov/entities/config.dart';
import 'package:dlcov/repositories/config_repository.dart';
import 'package:dlcov/repositories/record_repository.dart';
import 'package:dlcov/usecases/create_file_references.dart';
import 'package:dlcov/usecases/get_config.dart';
import 'package:dlcov/usecases/get_lcov.dart';
import 'package:dlcov/usecases/get_records.dart';
import 'package:dlcov/usecases/parse_arguments.dart';
import 'package:dlcov/usecases/verify_coverage.dart';
import 'package:dlcov/utils/commands/app_command.dart';
import 'package:dlcov/utils/file_system/file_system_util.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  final Config config;

  final argResults = ParseArguments().getArgResults(arguments, parser);
  config = GetConfig(ConfigRepository(argResults), parser)();

  if (config.command?.name == AppConstants.cmdPrepare) {
    return AppCommand()
        .setCommands(parser: parser, config: config, arguments: arguments)
        .run(arguments);
  }

  // Create references for all dart files
  await CreateFileReferences(
          CreateFileReferencesHelper(FileSystemUtil()),
          AppConstants.sourceDirectory,
          config.excludeSuffixes,
          config.packageName)
      .call();

  // Generate lcov.info
  await Process.run('flutter', ['test', '--coverage'],
      runInShell: Platform.isWindows);

  // Verify minimum coverage threshold
  final getLcov = GetLcov(
      config, GetRecords(RecordsRepository(AppConstants.lcovPathDefaultValue)));

  VerifyCoverage()(await getLcov());
}

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
  final argResults = ParseArguments().getArgResults(arguments, parser);
  final config = GetConfig(ConfigRepository(argResults), parser)();

  // Create references for all dart files
  await CreateFileReferences(
    CreateFileReferencesHelper(FileSystemUtil()),
    'lib',
    config.excludeSufixes,
  ).call();

  // Verify minimum coverage threshold
  final getLcov = GetLcov(config, GetRecords(RecordsRepository(config.file)));
  VerifyCoverage()(await getLcov());
}

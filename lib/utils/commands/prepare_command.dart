import 'dart:io';

import 'package:args/command_runner.dart';

import '../../core/app_constants.dart';
import '../../entities/config.dart';
import '../../usecases/create_file_references.dart';
import '../file_system/file_system_util.dart';

class PrepareCommand extends Command {
  final Config config;

  @override
  final name = 'prepare';
  @override
  final description =
      'Generate a dependencies file, so that Flutter takes all files into account when generate lcov.info';

  PrepareCommand(this.config) {
    argParser.addOption(AppConstants.argLongPackageName,
        abbr: AppConstants.argShortPackageName,
        defaultsTo: null,
        mandatory: false);
  }

  /// excute run
  @override
  void run() async {
    await CreateFileReferences(
            CreateFileReferencesHelper(FileSystemUtil()),
            AppConstants.sourceDirectory,
            config.excludeSuffixes,
            config.packageName)
        .call();
    exit(0);
  }
}

import 'dart:io';

import 'package:args/command_runner.dart';

import '../../core/app_constants.dart';
import '../../entities/config.dart';
import '../../usecases/create_file_references.dart';
import '../app_error_codes.dart';

class GenRefsCommand extends Command {
  final Config config;
  final CreateFileReferences createFileReferences;

  @override
  final name = AppConstants.cmdGenRefs;
  @override
  final description = AppConstants.cmdGenRefsHelp;

  GenRefsCommand({
    required this.config,
    required this.createFileReferences,
  }) {
    argParser.addOption(AppConstants.argLongPackageName,
        abbr: AppConstants.argShortPackageName,
        defaultsTo: null,
        mandatory: false);

    argParser.addOption(AppConstants.argLongExcludeSuffix,
        abbr: AppConstants.argShortExcludeSuffix,
        defaultsTo: AppConstants.excludeSuffixDefaultValue,
        mandatory: false);

    argParser.addMultiOption(AppConstants.argLongExcludeFiles,
        splitCommas: true, help: AppConstants.argLongExcludeFilesHelp);

    argParser.addMultiOption(AppConstants.argLongExcludeContents,
        splitCommas: true, help: AppConstants.argLongExcludeContentsHelp);

    argParser.addOption(AppConstants.argLongExcludeContentsPath,
        help: AppConstants.argLongExcludeContentsPathHelp, mandatory: false);
  }

  /// excute run createFileReferences
  @override
  void run() async {
    await createFileReferences();
    exit(AppErrorCodes.noError);
  }
}

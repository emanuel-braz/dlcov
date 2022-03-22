import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import '../../core/app_constants.dart';
import '../../entities/config.dart';
import '../../usecases/create_file_references.dart';
import '../../utils/file_system/file_system_util.dart';
import 'gen_refs_command.dart';

/// AppCommand
class AppCommand {
  CommandRunner setCommands(
      {required ArgParser parser,
      required Config config,
      required List<String> arguments}) {
    return CommandRunner(AppConstants.cmdGenRefs, AppConstants.cmdGenRefsHelp)
      ..addCommand(GenRefsCommand(
          config: config,
          createFileReferences: CreateFileReferences(
              CreateFileReferencesHelper(FileSystemUtil()),
              AppConstants.sourceDirectory,
              config)));
  }
}

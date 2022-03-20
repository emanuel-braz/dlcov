import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import '../../core/app_constants.dart';
import '../../entities/config.dart';
import 'prepare_command.dart';

/// AppCommand
class AppCommand {
  CommandRunner setCommands(
      {required ArgParser parser,
      required Config config,
      required List<String> arguments}) {
    return CommandRunner(AppConstants.cmdPrepare, AppConstants.cmdPrepareHelp)
      ..addCommand(PrepareCommand(config));
  }
}

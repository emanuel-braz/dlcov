import 'package:args/command_runner.dart';

/// command
class HelpCommand extends Command {
  @override
  final name = 'help';
  @override
  final description = 'Dlcov Help';

  /// excute run
  @override
  void run() {
    print('help message');
  }
}

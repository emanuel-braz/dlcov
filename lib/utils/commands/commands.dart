import 'package:args/command_runner.dart';

class HelpCommand extends Command {
  @override
  final name = 'help';
  @override
  final description = 'Dlcov Help';

  @override
  void run() {
    print('help message');
  }
}

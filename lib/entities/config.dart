import 'package:args/args.dart';

/// Config entity
class Config {
  final double percentage;
  final List<String> excludeSuffixes;
  final bool log;
  final String? packageName;
  final ArgResults? command;

  // If should include untested files to report
  final bool includeUntestedFiles;

  final String? lcovGen;

  Config(
      {required this.percentage,
      required this.excludeSuffixes,
      required this.includeUntestedFiles,
      required this.log,
      this.packageName,
      this.command,
      this.lcovGen});
}

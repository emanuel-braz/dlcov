import 'package:args/args.dart';

/// Config model
class ConfigModel {
  /// percentage
  final double percentage;

  final List<String> excludeSuffixes;

  /// log
  final bool log;

  /// package name
  final String? packageName;

  /// Command
  final ArgResults? command;

  // If should include untested files to report
  final bool includeUntestedFiles;

  final String? lcovGen;

  ConfigModel(
      {required this.percentage,
      required this.excludeSuffixes,
      required this.includeUntestedFiles,
      required this.log,
      this.packageName,
      this.command,
      this.lcovGen});
}

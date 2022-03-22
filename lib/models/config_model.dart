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

  /// lcov generator
  final String? lcovGen;

  /// file name patterns
  final List<RegExp> excludeFiles;

  /// content/code patterns
  final List<RegExp> excludeContents;

  /// [excludeContentsPath]
  final String? excludeContentsPath;

  ConfigModel(
      {required this.percentage,
      required this.excludeSuffixes,
      required this.includeUntestedFiles,
      required this.excludeFiles,
      required this.excludeContents,
      required this.log,
      this.packageName,
      this.command,
      this.lcovGen,
      this.excludeContentsPath});
}

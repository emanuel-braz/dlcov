import 'package:args/args.dart';

/// Config entity
class Config {
  final double percentage;
  final List<String> excludeSuffixes;
  final bool log;
  final String? packageName;
  final ArgResults? command;

  /// file name patterns
  List<RegExp> excludeFiles;

  /// file content patterns
  List<RegExp> excludeContents;

  // If should include untested files to report
  final bool includeUntestedFiles;

  /// [lcovGen]
  final String? lcovGen;

  /// [excludeContentsPath]
  final String? excludeContentsPath;

  Config(
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

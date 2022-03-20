import 'package:args/args.dart';

/// Config entity
class Config {
  final double percentage;
  final List<String> excludeSuffixes;
  final bool log;
  final String? packageName;
  final ArgResults? command;

  Config(
      {required this.percentage,
      required this.excludeSuffixes,
      required this.log,
      this.packageName,
      this.command});
}

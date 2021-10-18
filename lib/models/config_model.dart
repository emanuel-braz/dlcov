class ConfigModel {
  final String file;
  final double percentage;
  final List<String> excludeSufixes;
  final bool log;

  ConfigModel({
    required this.file,
    required this.percentage,
    required this.excludeSufixes,
    required this.log,
  });
}

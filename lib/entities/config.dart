/// Config entity
class Config {
  final String file;
  final double percentage;
  final List<String> excludeSufixes;
  final bool log;
  final String? packageName;

  Config(
      {required this.file,
      required this.percentage,
      required this.excludeSufixes,
      required this.log,
      this.packageName});
}

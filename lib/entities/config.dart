/// Config entity
class Config {
  final double percentage;
  final List<String> excludeSufixes;
  final bool log;
  final String? packageName;

  Config(
      {required this.percentage,
      required this.excludeSufixes,
      required this.log,
      this.packageName});
}

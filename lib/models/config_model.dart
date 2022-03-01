/// Config model
class ConfigModel {
  /// percentage
  final double percentage;

  final List<String> excludeSuffixes;

  /// log
  final bool log;

  /// package name
  final String? packageName;

  ConfigModel(
      {required this.percentage,
      required this.excludeSuffixes,
      required this.log,
      this.packageName});
}

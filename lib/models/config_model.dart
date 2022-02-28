/// Config model
class ConfigModel {
  /// percentage
  final double percentage;

  final List<String> excludeSufixes;

  /// log
  final bool log;

  /// package name
  final String? packageName;

  ConfigModel(
      {required this.percentage,
      required this.excludeSufixes,
      required this.log,
      this.packageName});
}

/// Config model
class ConfigModel {
  /// file
  final String file;

  /// percentage
  final double percentage;

  final List<String> excludeSufixes;

  /// log
  final bool log;

  /// package name
  final String? packageName;

  ConfigModel(
      {required this.file,
      required this.percentage,
      required this.excludeSufixes,
      required this.log,
      this.packageName});
}

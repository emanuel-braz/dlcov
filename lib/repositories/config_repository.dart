import 'package:args/args.dart';

import '../core/app_constants.dart';
import '../models/config_model.dart';

/// Config repository
class ConfigRepository {
  ArgResults argResults;
  ConfigRepository(this.argResults);

  /// Execute usecase
  ConfigModel call() {
    late double percentage;
    late List<String> excludeSuffixes;
    late bool log;
    late String? packageName;
    late ArgResults? command;

    try {
      command = argResults.command;

      percentage =
          double.parse(argResults[AppConstants.argLongCoverage] ?? '0');
      final String excludesResult =
          argResults[AppConstants.argLongExcludeSuffix];
      excludeSuffixes = excludesResult
          .split(',')
          .map((e) => e.trim())
          .where((element) => element != '')
          .toList();
      log = argResults[AppConstants.argLongLog].toString().toLowerCase() ==
          'true';
      packageName = argResults[AppConstants.argLongPackageName];
    } catch (e) {
      print(e);
      rethrow;
    }

    return ConfigModel(
        percentage: percentage,
        excludeSuffixes: excludeSuffixes,
        log: log,
        packageName: packageName,
        command: command);
  }
}

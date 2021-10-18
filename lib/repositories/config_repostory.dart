import 'package:args/args.dart';

import '../core/app_constants.dart';
import '../models/config_model.dart';

/// Config repository
class ConfigRepository {
  ArgResults argResults;
  ConfigRepository(this.argResults);

  /// Execute usecase
  ConfigModel call() {
    late String file;
    late double percentage;
    late List<String> excludeSufixes;
    late bool log;

    try {
      file = argResults[AppConstants.argLongFile];
      percentage = double.parse(argResults[AppConstants.argLongCoverage]);
      final String excludesResult =
          argResults[AppConstants.argLongExcludeSufix];
      excludeSufixes = excludesResult
          .split(',')
          .map((e) => e.trim())
          .where((element) => element != '')
          .toList();
      log = argResults[AppConstants.argLongLog].toString().toLowerCase() ==
          'true';
    } catch (e) {
      print(e);
      rethrow;
    }

    return ConfigModel(
      file: file,
      percentage: percentage,
      excludeSufixes: excludeSufixes,
      log: log,
    );
  }
}

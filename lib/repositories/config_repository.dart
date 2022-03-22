import 'package:args/args.dart';
import 'package:dlcov/core/extensions/list_extension.dart';

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
    bool includeUntestedFiles = false;
    late String? lcovGen;
    late List<RegExp> excludeFiles;
    late List<RegExp> excludeContents;
    late String? excludeContentsPath;

    try {
      command = argResults.command;

      final includeUntestedFilesInput =
          argResults[AppConstants.argIncludeUntestedFiles];

      includeUntestedFiles = includeUntestedFilesInput != null
          ? includeUntestedFilesInput == 'true'
          : false;

      lcovGen = argResults[AppConstants.argLcovGen];

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

      excludeFiles =
          List<String>.from(argResults[AppConstants.argLongExcludeFiles])
              .mapRegex()
              .toList();

      excludeContents =
          List<String>.from(argResults[AppConstants.argLongExcludeContents])
              .mapRegex()
              .toList();

      excludeContentsPath = argResults[AppConstants.argLongExcludeContentsPath];
    } catch (e) {
      print(e);
      rethrow;
    }

    return ConfigModel(
        percentage: percentage,
        excludeSuffixes: excludeSuffixes,
        log: log,
        packageName: packageName,
        command: command,
        includeUntestedFiles: includeUntestedFiles,
        lcovGen: lcovGen,
        excludeFiles: excludeFiles,
        excludeContents: excludeContents,
        excludeContentsPath: excludeContentsPath);
  }
}

import 'package:args/args.dart';

import '../entities/config.dart';
import '../repositories/config_repository.dart';

class GetConfig {
  final ConfigRepository repository;
  final ArgParser parser;
  GetConfig(this.repository, this.parser);

  /// Execute usecase
  Config call() {
    final configModel = repository.call();
    return Config(
        percentage: configModel.percentage,
        log: configModel.log,
        excludeSuffixes: configModel.excludeSuffixes,
        packageName: configModel.packageName);
  }
}

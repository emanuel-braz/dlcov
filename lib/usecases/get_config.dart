import 'package:args/args.dart';

import '../entities/config.dart';
import '../repositories/config_repostory.dart';

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
        excludeSufixes: configModel.excludeSufixes,
        packageName: configModel.packageName);
  }
}

import 'dart:io';

import '../entities/config.dart';
import '../entities/lcov.dart';
import '../utils/logger.dart';
import 'get_records.dart';

class GetLcov {
  final Config config;
  final GetRecords getRecords;

  GetLcov(this.config, this.getRecords);

  /// Execute usecase
  Future<Lcov> call() async {
    try {
      final records = await getRecords();

      final lcov = Lcov(config: config, records: records);

      if (lcov.config.log) {
        Logger().log(lcov);
      }

      return lcov;
    } catch (e) {
      exit(128);
    }
  }
}

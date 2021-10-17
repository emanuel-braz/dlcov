import 'dart:io';

import 'package:dlcov/core/app_constants.dart';
import 'package:lcov_parser/lcov_parser.dart';

import 'config.dart';
import 'coverage.dart';

class Lcov {
  final Config config;
  late Coverage coverage;
  List<Record> records;

  var totalHits = 0;
  var totalFinds = 0;

  Lcov({required this.config, required this.records}) {
    try {
      coverage = Coverage(config.percentage);

      records = records.where((element) => !hasSufix(element.file ?? '')).toList();
      records.forEach(updateTotals);

      final totalCoverage = (totalHits / totalFinds) * 100;
      coverage.totalCoverage = totalCoverage;
    } on FileSystemException {
      print(AppConstants.fileSystemExceptionMessage);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  bool hasSufix(String value) {
    final matchList = config.excludeSufixes.where((element) => value.endsWith(element));
    return matchList.isNotEmpty;
  }

  void updateTotals(Record rec) {
    totalFinds += rec.lines?.found ?? 0;
    totalHits += rec.lines?.hit ?? 0;
  }
}

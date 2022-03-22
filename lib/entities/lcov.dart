import 'dart:io';

import 'package:dlcov/core/extensions/list_extension.dart';
import 'package:dlcov/utils/file_matcher_util.dart';
import 'package:lcov_parser/lcov_parser.dart';

import '../core/app_constants.dart';
import '../utils/file_system/file_system_util.dart';
import 'config.dart';
import 'coverage.dart';

/// Lcov entity
class Lcov {
  /// [Config]
  final Config config;

  /// [Coverage]
  late Coverage coverage;

  /// [List<Record>]
  List<Record> records;

  /// totalHits
  var totalHits = 0;

  /// totalFinds
  var totalFinds = 0;

  /// [Lcov] constructor
  Lcov({required this.config, required this.records}) {
    try {
      coverage = Coverage(config.percentage);
      final fileMatcher = FileMatcherUtil();
      final fileSystemUtil = FileSystemUtil();

      records = records
          .where((record) => !fileMatcher.hasSuffix(
              file: record.file ?? '', excludeSuffixes: config.excludeSuffixes))
          .where((record) => !fileMatcher.hasPattern(
              value: record.file ?? '', patterns: config.excludeFiles))
          .toList();

      if (config.excludeContentsPath != null) {
        final excludeContentsByPathList = fileSystemUtil
            .readAsLinesSync(config.excludeContentsPath!)
            .mapRegex()
            .toList(growable: false);

        records = records.where((record) {
          if (record.file == null) return true;
          final file = File(record.file!);
          final loc = file.readAsLinesSync();
          final hasPatterns = fileMatcher.hasPatterns(
              values: loc, patterns: excludeContentsByPathList);
          return !hasPatterns;
        }).toList();
      } else if (config.excludeContents.isNotEmpty) {
        records = records.where((record) {
          if (record.file == null) return true;
          final file = File(record.file!);
          final loc = file.readAsLinesSync();
          final hasPatterns = fileMatcher.hasPatterns(
              values: loc, patterns: config.excludeContents);
          return !hasPatterns;
        }).toList();
      }

      records.forEach(updateTotals);

      final totalCoverage = (totalHits / totalFinds) * 100;
      coverage.totalCoverage = totalCoverage;
    } on FileSystemException catch (e) {
      print(AppConstants.fileSystemExceptionMessage);
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Update totals
  void updateTotals(Record rec) {
    totalFinds += rec.lines?.found ?? 0;
    totalHits += rec.lines?.hit ?? 0;
  }
}

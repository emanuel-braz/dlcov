import 'dart:io';

import 'package:lcov_parser/lcov_parser.dart';

import '../core/app_constants.dart';

/// Records repository
class RecordsRepository {
  final String _file;
  RecordsRepository(this._file);

  /// Execute usercase
  Future<List<Record>> call() async {
    late List<Record> records;
    try {
      records = await Parser.parse(_file);
    } on FileSystemException catch (e) {
      print(AppConstants.fileSystemExceptionMessage);
      print(e);
    } catch (e) {
      rethrow;
    }

    return records;
  }
}

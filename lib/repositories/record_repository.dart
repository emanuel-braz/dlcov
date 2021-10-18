import 'dart:io';

import 'package:lcov_parser/lcov_parser.dart';

import '../core/app_constants.dart';

class RecordsRepository {
  final String _file;
  RecordsRepository(this._file);

  Future<List<Record>> call() async {
    late List<Record> records;
    try {
      records = await Parser.parse(_file);
    } on FileSystemException {
      print(AppConstants.fileSystemExceptionMessage);
    } catch (e) {
      rethrow;
    }

    return records;
  }
}

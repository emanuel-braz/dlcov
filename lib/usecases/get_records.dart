import 'package:dlcov/repositories/record_repository.dart';
import 'package:lcov_parser/lcov_parser.dart';

class GetRecords {
  final RecordsRepository repository;
  GetRecords(this.repository);

  Future<List<Record>> call() async {
    return await repository.call();
  }
}

import 'package:dlcov/entities/coverage.dart';
import 'package:test/test.dart';

void main() {
  group('Coverage Entity tests: ', () {
    test(
        'When minCoverage is 12% and totalCoverage is 15%, [isCovered] must be true',
        () {
      // arrange
      var coverageEntity = Coverage(12);
      const isCoveredExpectedResult = true;

      // act
      coverageEntity.totalCoverage = 15;

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });

    test(
        'When minCoverage is 12% and totalCoverage is 11%, [isCovered] must be false',
        () {
      // arrange
      var coverageEntity = Coverage(12);
      const isCoveredExpectedResult = false;

      // act
      coverageEntity.totalCoverage = 11;

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });

    test(
        'When minCoverage is 12.5% and totalCoverage is 12.5%, [isCovered] must be true',
        () {
      // arrange
      var coverageEntity = Coverage(12.5);
      const isCoveredExpectedResult = true;

      // act
      coverageEntity.totalCoverage = 12.5;

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });
  });
}

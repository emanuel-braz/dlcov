import 'dart:io';
import 'package:dlcov/coverage_entity.dart';
import 'package:dlcov/app_util.dart';
import 'package:test/test.dart';

void main() {
  group('dlcov binary tests (14.5% covered): ', () {
    test('When testing 12% over 14.5% of coverage, should result exit code 0',
        () async {
      // arrange
      late ProcessResult result;
      // act
      result = await Process.run(
          'dart', ['bin/dlcov.dart', 'fixtures/lcov.info', '12']);
      // assert
      expect(result.exitCode, 0);
    });

    test('When testing 14.5% over 14.5% of coverage, should result exit code 0',
        () async {
      // arrange
      late ProcessResult result;
      // act
      result = await Process.run(
          'dart', ['bin/dlcov.dart', 'fixtures/lcov.info', '14.5']);
      // assert
      expect(result.exitCode, 0);
    });

    test('When testing 15% over 14.5% of coverage, should result exit code 1',
        () async {
      // arrange
      late ProcessResult result;
      // act
      result = await Process.run(
          'dart', ['bin/dlcov.dart', 'fixtures/lcov.info', '15']);
      // assert
      expect(result.exitCode, 1);
    });

    test('When file lcov.info not found, should result exit code 128',
        () async {
      // arrange
      late ProcessResult result;
      // act
      result = await Process.run(
          'dart', ['bin/dlcov.dart', 'fixtures_error/lcov.info', '15']);
      // assert
      expect(result.exitCode, 128);
    });
  });

  group('AppUtil tests (14.5% covered): ', () {
    late AppUtil appUtil;

    setUp(() {
      appUtil = AppUtil();
    });

    test('When minCoverage is 12%, [isCovered] must be true', () async {
      // arrange
      late CoverageEntity coverageEntity;
      const isCoveredExpectedResult = true;

      // act
      coverageEntity =
          await appUtil.getCoverageEntity(12.0, 'fixtures/lcov.info');

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });

    test('When minCoverage is 15%, [isCovered] must be false', () async {
      // arrange
      late CoverageEntity coverageEntity;
      const isCoveredExpectedResult = false;

      // act
      coverageEntity =
          await appUtil.getCoverageEntity(15.0, 'fixtures/lcov.info');

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });
  });

  group('Coverage Entity tests: ', () {
    test(
        'When minCoverage is 12% and totalCoverage is 15%, [isCovered] must be true',
        () {
      // arrange
      var coverageEntity = CoverageEntity(12, 'fixtures/lcov.info');
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
      var coverageEntity = CoverageEntity(12, 'fixtures/lcov.info');
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
      var coverageEntity = CoverageEntity(12.5, 'fixtures/lcov.info');
      const isCoveredExpectedResult = true;

      // act
      coverageEntity.totalCoverage = 12.5;

      // assert
      expect(coverageEntity.isCovered, equals(isCoveredExpectedResult));
    });
  });
}

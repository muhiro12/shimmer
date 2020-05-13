import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/shimmer_logs_parser.dart';

import '../test_data.dart';

void main() {
  final testData = TestData.logs;
  final instance = ShimmerLogsParser(testData);
  group(
    'sortedByDate() case test data',
    () {
      final result = instance.sortedByDate();
      test(
        'return value length should be test data length',
        () {
          expect(
            result.value.length,
            testData.value.length,
          );
        },
      );
      test(
        'return value first date should be test data last date',
        () {
          expect(
            result.value.first.date,
            testData.value.last.date,
          );
        },
      );
      test(
        'return value last should be test data first date',
        () {
          expect(
            result.value.last.date,
            testData.value.first.date,
          );
        },
      );
      test(
        'original value should not be changed',
        () {
          expect(
            instance.original,
            testData,
          );
        },
      );
    },
  );
  group(
    'toCategorizedLogsList() case test data',
    () {
      final result = instance.toCategorizedLogsList();
      test(
        'return value length should be 3',
        () {
          expect(
            result.length,
            3,
          );
        },
      );
      test(
        'return value categories should only contain plain, concert and book',
        () {
          expect(
            result.map((albumItem) => albumItem.key),
            [
              ShimmerCategory.plain,
              ShimmerCategory.concert,
              ShimmerCategory.book,
            ],
          );
        },
      );
      test(
        'return value should has 2 plain',
        () {
          expect(
            result
                .firstWhere(
                  (albumItem) => albumItem.key == ShimmerCategory.plain,
                )
                .value
                .length,
            2,
          );
        },
      );
      test(
        'return value should has 1 concert',
        () {
          expect(
            result
                .where(
                  (albumItem) => albumItem.key == ShimmerCategory.concert,
                )
                .length,
            1,
          );
        },
      );
      test(
        'return value should be start with plain',
        () {
          expect(
            result.first.key,
            ShimmerCategory.plain,
          );
        },
      );
    },
  );
}

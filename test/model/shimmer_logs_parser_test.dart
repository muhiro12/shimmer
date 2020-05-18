import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
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
        'original value should not be changed',
        () {
          expect(
            instance.logs,
            testData,
          );
        },
      );
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
        'return value first date should be test data [3]',
        () {
          expect(
            result.value.first.date,
            testData.value[3].date,
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
    },
  );
  group(
    'whereOfPublished() case test data',
    () {
      final result = instance.whereOfPublished();
      test(
        'original value should not be changed',
        () {
          expect(
            instance.logs,
            testData,
          );
        },
      );
      test(
        'return value should contain published',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.published)
                .isNotEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain draft',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.draft)
                .isEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain archived',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.archived)
                .isEmpty,
            true,
          );
        },
      );
    },
  );
  group(
    'whereOfDraft() case test data',
    () {
      final result = instance.whereOfDraft();
      test(
        'original value should not be changed',
        () {
          expect(
            instance.logs,
            testData,
          );
        },
      );
      test(
        'return value should contain draft',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.draft)
                .isNotEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain published',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.published)
                .isEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain archived',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.archived)
                .isEmpty,
            true,
          );
        },
      );
    },
  );
  group(
    'whereOfArchived() case test data',
    () {
      final result = instance.whereOfArchived();
      test(
        'original value should not be changed',
        () {
          expect(
            instance.logs,
            testData,
          );
        },
      );
      test(
        'return value should contain archived',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.archived)
                .isNotEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain published',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.published)
                .isEmpty,
            true,
          );
        },
      );
      test(
        'return value should not contain draft',
        () {
          expect(
            result.value
                .where((log) => log.state == ShimmerLogState.draft)
                .isEmpty,
            true,
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
        'original value should not be changed',
        () {
          expect(
            instance.logs,
            testData,
          );
        },
      );
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
        'return value categories should only contain Plain, Concert and Book',
        () {
          expect(
            result.map((albumItem) => albumItem.key).toSet(),
            {
              'Plain',
              'Concert',
              'Book',
            },
          );
        },
      );
      test(
        'return value should has 3 plain',
        () {
          expect(
            result
                .firstWhere(
                  (albumItem) => albumItem.key == 'Plain',
                )
                .value
                .length,
            3,
          );
        },
      );
      test(
        'return value should has 1 concert',
        () {
          expect(
            result
                .where(
                  (albumItem) => albumItem.key == 'Concert',
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
            'Plain',
          );
        },
      );
    },
  );
}

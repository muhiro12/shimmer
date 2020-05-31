import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';

import '../test_data.dart';

class ShimmerLogsDataStoreTest extends ShimmerLogsDataStoreInterface {
  @override
  List<ShimmerLog> load() {
    return TestData.logList;
  }

  @override
  void save(ShimmerLog log) {}

  @override
  void delete(ShimmerLog log) {}
}

void main() {
  final testData = TestData.logList;
  final instance = ShimmerLogsRepository(ShimmerLogsDataStoreTest());
  group(
    'load() case test data',
    () {
      final result = instance.load();
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
            true,
          );
        },
      );
      test(
        'return value length should be test data length',
        () {
          expect(
            result.value.length,
            testData.length,
          );
        },
      );
      test(
        'return value first date should be test data first',
        () {
          expect(
            result.value.first.date,
            testData.first.date,
          );
        },
      );
      test(
        'return value last should be test data last',
        () {
          expect(
            result.value.last.date,
            testData.last.date,
          );
        },
      );
    },
  );
  group(
    'fetchAllSortedByDate() case test data',
    () {
      final result = instance.fetchAllSortedByDate();
      test(
        'return value length should be test data length',
        () {
          expect(
            result.value.length,
            testData.length,
          );
        },
      );
      test(
        'return value first date should be test data [3]',
        () {
          expect(
            result.value.first.date,
            testData[3].date,
          );
        },
      );
      test(
        'return value last should be test data first',
        () {
          expect(
            result.value.last.date,
            testData.first.date,
          );
        },
      );
    },
  );
  group(
    'fetchPublished() case test data',
    () {
      final result = instance.fetchPublished();
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
      test(
        'return value first should be test data [3]',
        () {
          expect(
            result.value.first,
            testData[3],
          );
        },
      );
      test(
        'return value last should be test data [0]',
        () {
          expect(
            result.value.last,
            testData.first,
          );
        },
      );
    },
  );
  group(
    'fetchDraft() case test data',
    () {
      final result = instance.fetchDraft();
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
      test(
        'return value first should be test data [6]',
        () {
          expect(
            result.value.first,
            testData[6],
          );
        },
      );
      test(
        'return value last should be test data [5]',
        () {
          expect(
            result.value.last,
            testData[5],
          );
        },
      );
    },
  );
  group(
    'fetchArchived() case test data',
    () {
      final result = instance.fetchArchived();
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
        'return value first should be test data [4]',
        () {
          expect(
            result.value.first,
            testData[4],
          );
        },
      );
      test(
        'return value last should be test data [7]',
        () {
          expect(
            result.value.last,
            testData[7],
          );
        },
      );
    },
  );
  group(
    'fetchCategorized() case test data',
    () {
      final result = instance.fetchCategorized(ShimmerCategory.concert);
      test(
        'result value is category',
        () {
          expect(
            result.key,
            'Concert',
          );
        },
      );
      test(
        'return value first should be test data [1]',
        () {
          expect(
            result.value.first,
            testData[1],
          );
        },
      );
      test(
        'return value last should be test data [1]',
        () {
          expect(
            result.value.last,
            testData[1],
          );
        },
      );
    },
  );
  group(
    'fetchAlbumItems() case test data',
    () {
      final result = instance.fetchAlbumItems();
      test(
        'return value length should be 5',
        () {
          expect(
            result.length,
            5,
          );
        },
      );
      test(
        'return value state should contain published, draft and archived',
        () {
          expect(
            result.map((albumItem) => albumItem.state).toSet(),
            {
              ShimmerLogState.published,
              ShimmerLogState.draft,
              ShimmerLogState.archived,
            },
          );
        },
      );
      test(
        'published of return value should only contain Plain, Concert and Book',
        () {
          expect(
            result
                .where(
                  (albumItem) => albumItem.state == ShimmerLogState.published,
                )
                .map(
                  (albumItem) => albumItem.logs.key,
                )
                .toSet(),
            {
              'Plain',
              'Concert',
              'Book',
            },
          );
        },
      );
      test(
        'return value should has 2 published plain',
        () {
          expect(
            result
                .where(
                  (albumItem) => albumItem.state == ShimmerLogState.published,
                )
                .firstWhere((albumItem) => albumItem.logs.key == "Plain")
                .logs
                .value
                .length,
            2,
          );
        },
      );
      test(
        'return value should has 1 published concert',
        () {
          expect(
            result
                .where(
                  (albumItem) => albumItem.state == ShimmerLogState.published,
                )
                .firstWhere((albumItem) => albumItem.logs.key == "Concert")
                .logs
                .value
                .length,
            1,
          );
        },
      );
      test(
        'return value should be start with plain',
        () {
          expect(
            result.first.logs.key,
            'Plain',
          );
        },
      );
      test(
        'first of return value length should be 2',
        () {
          expect(
            result.first.logs.value.length,
            2,
          );
        },
      );
      test(
        'first of return value first date should be test data [2]',
        () {
          expect(
            result.first.logs.value.first.date,
            testData[2].date,
          );
        },
      );
      test(
        'first of return value last should be test data first',
        () {
          expect(
            result.first.logs.value.last.date,
            testData.first.date,
          );
        },
      );
    },
  );
}

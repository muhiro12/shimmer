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
    'fetchAll() case test data',
    () {
      final result = instance.fetchAll();
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
        'return value key should only contain plain, concert, book, Draft and Archived',
        () {
          expect(
            result.map((albumItem) => albumItem.key).toSet(),
            {
              ShimmerCategory.plain,
              ShimmerCategory.concert,
              ShimmerCategory.book,
              'Draft',
              'Archived',
            },
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
      test(
        'return value length should be 2',
        () {
          expect(
            result.first.value.length,
            2,
          );
        },
      );
      test(
        'return value first date should be test data [2]',
        () {
          expect(
            result.first.value.first.date,
            testData[2].date,
          );
        },
      );
      test(
        'return value last should be test data first',
        () {
          expect(
            result.first.value.last.date,
            testData.first.date,
          );
        },
      );
    },
  );
}

import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';

class ShimmerLogsDataStoreTest extends ShimmerLogsDataStoreInterface {
  @override
  void add(ShimmerLog log) {}

  @override
  List<ShimmerLog> fetchAll() {
    final log1 = ShimmerLog();
    log1.date = DateTime(1);
    log1.category = ShimmerCategory.plain;

    final log2 = ShimmerLog();
    log2.date = DateTime(200);
    log2.category = ShimmerCategory.concert;

    final log3 = ShimmerLog();
    log3.date = DateTime(30);
    log3.category = ShimmerCategory.plain;

    final testData = <ShimmerLog>[
      log1,
      log2,
      log3,
    ];
    return testData;
  }
}

void main() {
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
        'return value length should be 3',
        () {
          expect(
            result.length,
            3,
          );
        },
      );
      test(
        'return value first date should be test data first date',
        () {
          expect(
            result.first.date,
            instance.fetchAll().first.date,
          );
        },
      );
      test(
        'return value last should be test data last date',
        () {
          expect(
            result.last.date,
            instance.fetchAll().last.date,
          );
        },
      );
    },
  );
  group(
    'fetchAllReversed() case test data',
    () {
      final result = instance.fetchAllReversed();
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
        'return value first date should be test data last date',
        () {
          expect(
            result.first.date,
            instance.fetchAll().last.date,
          );
        },
      );
      test(
        'return value last should be test data first date',
        () {
          expect(
            result.last.date,
            instance.fetchAll().first.date,
          );
        },
      );
    },
  );
  group(
    'fetchAllGroupedByCategory() case test data',
    () {
      final result = instance.fetchAllGroupedByCategory();
      test(
        'return value length should be 2',
        () {
          expect(
            result.length,
            2,
          );
        },
      );
      test(
        'return value keys should only contain plain and concert',
        () {
          expect(
            result.keys,
            [
              ShimmerCategory.plain,
              ShimmerCategory.concert,
            ],
          );
        },
      );
      test(
        'return value should has 2 plain',
        () {
          expect(
            result[ShimmerCategory.plain].length,
            2,
          );
        },
      );
      test(
        'return value should has 1 concert',
        () {
          expect(
            result[ShimmerCategory.concert].length,
            1,
          );
        },
      );
    },
  );
}

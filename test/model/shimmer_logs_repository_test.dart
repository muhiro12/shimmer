import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';

class ShimmerLogsDataStoreTest extends ShimmerLogsDataStoreInterface {
  @override
  List<ShimmerLog> load() {
    final log1 = ShimmerLog(
      date: DateTime(1),
      category: ShimmerCategory.plain,
    );

    final log2 = ShimmerLog(
      date: DateTime(200),
      category: ShimmerCategory.concert,
    );

    final log3 = ShimmerLog(
      date: DateTime(30),
      category: ShimmerCategory.plain,
    );

    final log4 = ShimmerLog(
      date: DateTime(4000),
      category: ShimmerCategory.book,
    );

    final testData = <ShimmerLog>[
      log1,
      log2,
      log3,
      log4,
    ];
    return testData;
  }

  @override
  void save(ShimmerLog log) {}

  @override
  void delete(ShimmerLog log) {}
}

void main() {
  final instance = ShimmerLogsRepository(ShimmerLogsDataStoreTest());
  group(
    'fetch() case test data',
    () {
      final result = instance.fetch();
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
        'return value length should be 4',
        () {
          expect(
            result.value.length,
            4,
          );
        },
      );
      test(
        'return value first date should be test data first date',
        () {
          expect(
            result.value.first.date,
            instance.fetch().value.first.date,
          );
        },
      );
      test(
        'return value last should be test data last date',
        () {
          expect(
            result.value.last.date,
            instance.fetch().value.last.date,
          );
        },
      );
    },
  );
  group(
    'fetchSortedByCreatedDate() case test data',
    () {
      final result = instance.fetchSortedByCreatedDate();
      test(
        'return value length should be 4',
        () {
          expect(
            result.value.length,
            4,
          );
        },
      );
      test(
        'return value first date should be test data last date',
        () {
          expect(
            result.value.first.date,
            instance.fetch().value.last.date,
          );
        },
      );
      test(
        'return value last should be test data first date',
        () {
          expect(
            result.value.last.date,
            instance.fetch().value.first.date,
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

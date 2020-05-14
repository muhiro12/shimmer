import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/shimmer_logs.dart';

import '../test_data.dart';

void main() {
  final testData = TestData.logList;
  final instance = ShimmerLogs(
    value: testData,
  );
  group(
    'where() case test data',
    () {
      final Function closure =
          (ShimmerLog log) => log.category == ShimmerCategory.plain;
      test(
        'return value should be same with test data value',
        () {
          expect(
            instance.where(closure).value,
            testData.where(closure).toList(),
          );
        },
      );
      test(
        'original value should not be changed',
        () {
          expect(
            instance.value,
            testData,
          );
        },
      );
    },
  );
}

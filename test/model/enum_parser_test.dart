import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data_box.dart';
import 'package:shimmer/model/enum_parser.dart';

void main() {
  group(
    'stringOf()',
    () {
      test(
        'return value should be category name',
        () {
          expect(EnumParser.stringOf(ShimmerCategory.book), 'book');
        },
      );
      test(
        'return value should be key name',
        () {
          expect(EnumParser.stringOf(ShimmerDataBox.key), 'key');
        },
      );
    },
  );
  group(
    'upperCamelCaseStringOf()',
    () {
      test(
        'return value should be category name starting with a cappital latter',
        () {
          expect(
              EnumParser.upperCamelCaseStringOf(ShimmerCategory.book), 'Book');
        },
      );
      test(
        'return value should be key name starting with a cappital latter',
        () {
          expect(EnumParser.upperCamelCaseStringOf(ShimmerDataBox.key), 'Key');
        },
      );
    },
  );
}
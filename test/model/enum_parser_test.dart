import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log_box.dart';
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
          expect(EnumParser.stringOf(ShimmerLogBox.key), 'key');
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
          expect(EnumParser.upperCamelCaseStringOf(ShimmerLogBox.key), 'Key');
        },
      );
    },
  );
}

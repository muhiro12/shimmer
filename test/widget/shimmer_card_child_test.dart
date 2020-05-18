import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/widget/shimmer_card/shimmer_card_child.dart';

void main() {
  group(
    'init() case default',
    () {
      final result = ShimmerCardChild.init();
      test(
        'return value should be null',
        () {
          expect(
            result,
            null,
          );
        },
      );
    },
  );
  group(
    'init() case items is empty',
    () {
      final result = ShimmerCardChild.init(
        items: [],
      );
      test(
        'return value should be null',
        () {
          expect(
            result,
            null,
          );
        },
      );
    },
  );
  group(
    'init() case T is String',
    () {
      final result = ShimmerCardChild.init(
        items: ['text', 'text'],
      );
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
            true,
          );
        },
      );
    },
  );
  group(
    'init() case T is String and all items are empty',
    () {
      final result = ShimmerCardChild.init(
        items: ['', ''],
      );
      test(
        'return value should be null',
        () {
          expect(
            result,
            null,
          );
        },
      );
    },
  );
  group(
    'createChildren() case T is String',
    () {
      final result = ShimmerCardChild.createChildren(
        [
          'text',
          'text',
        ],
      );
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
        'return value length should be items.length',
        () {
          expect(
            result.length,
            2,
          );
        },
      );
    },
  );
  group(
    'createChildren() case T is String and empty text and not empty text',
    () {
      final result = ShimmerCardChild.createChildren(
        ['', 'text'],
      );
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
        'return value length body should be not empty text count',
        () {
          expect(
            result.length,
            1,
          );
        },
      );
    },
  );
  group(
    'createChildren() case T is String and all items are empty',
    () {
      final result = ShimmerCardChild.createChildren(
        ['', ''],
      );
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
        'return value should be empty',
        () {
          expect(
            result.isEmpty,
            true,
          );
        },
      );
    },
  );
}

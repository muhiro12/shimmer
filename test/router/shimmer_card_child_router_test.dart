import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/router/shimmer_card_child_router.dart';

void main() {
  group(
    'injected() case default',
    () {
      final result = ShimmerCardChildRouter().injected();
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
        'return value body should be null',
        () {
          expect(
            result.body,
            null,
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
  group(
    'injected() case items is empty',
    () {
      final result = ShimmerCardChildRouter(
        items: [],
      ).injected();
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
        'return value body should be null',
        () {
          expect(
            result.body,
            null,
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
  group(
    'injected() case T is String',
    () {
      final result = ShimmerCardChildRouter(
        items: ['text', 'text'],
      ).injected();
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
        'return value body should not be null',
        () {
          expect(
            result.body != null,
            true,
          );
        },
      );
      test(
        'return value should not be empty',
        () {
          expect(
            result.isNotEmpty,
            true,
          );
        },
      );
    },
  );
  group(
    'injected() case T is String and all items are empty',
    () {
      final result = ShimmerCardChildRouter(
        items: ['', ''],
      ).injected();
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
        'return value body should be null',
        () {
          expect(
            result.body,
            null,
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
  group(
    'createInstance() case args is null',
    () {
      final result = ShimmerCardChildRouter().createInstance(null);
      test(
        'return value body should be null',
        () {
          expect(
            result.body,
            null,
          );
        },
      );
      test(
        'return value isEmpty should be true',
        () {
          expect(
            result.isEmpty,
            true,
          );
        },
      );
      test(
        'return value isNotEmpty should should be false',
        () {
          expect(
            result.isNotEmpty,
            false,
          );
        },
      );
    },
  );
  group(
    'createInstance() case args is not null',
    () {
      final result = ShimmerCardChildRouter().createInstance(Text(''));
      test(
        'return value body should not be null',
        () {
          expect(
            result.body != null,
            true,
          );
        },
      );
      test(
        'return value isEmpty should be false',
        () {
          expect(
            result.isEmpty,
            false,
          );
        },
      );
      test(
        'return value isNotEmpty should should be true',
        () {
          expect(
            result.isNotEmpty,
            true,
          );
        },
      );
    },
  );
  group(
    'createChildren() case T is String',
    () {
      final result = ShimmerCardChildRouter(
        items: [
          'text',
          'text',
        ],
      ).createChildren();
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
      final result = ShimmerCardChildRouter(
        items: ['', 'text'],
      ).createChildren();
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
      final result = ShimmerCardChildRouter(
        items: ['', ''],
      ).createChildren();
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

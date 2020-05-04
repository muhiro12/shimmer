import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/widget/shimemr_card.dart';

void main() {
  group(
    'init()',
    () {
      test(
        'return value should be null when args is empty',
        () {
          final result = ShimmerCard.init();
          expect(
            result,
            null,
          );
        },
      );
      test(
        'return value should be null when children is empty',
        () {
          final result = ShimmerCard.init(children: []);
          expect(
            result,
            null,
          );
        },
      );
      test(
        'return value should not be null when children is not empty',
        () {
          final result = ShimmerCard.init(
            children: [
              Text(''),
            ],
          );
          expect(
            result != null,
            true,
          );
        },
      );
      test(
        'return value children length should be 1 when children length is 1',
        () {
          final result = ShimmerCard.init(
            children: [
              Text(''),
            ],
          );
          expect(
            result.children.length,
            1,
          );
        },
      );
      test(
        'return value children length should be 5 when children length is 3',
        () {
          final result = ShimmerCard.init(
            children: [
              Text(''),
              Text(''),
              Text(''),
            ],
          );
          expect(
            result.children.length,
            5,
          );
        },
      );
    },
  );
}

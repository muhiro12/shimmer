import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/model/list_extension.dart';

void main() {
  group(
    'added()',
    () {
      final original = [0, 1, 2, 3, 4, 5];
      final result = original.added(6);
      test(
        'return value should be added value',
        () {
          expect(
            result,
            [0, 1, 2, 3, 4, 5, 6],
          );
        },
      );
      test(
        'return value should not be changed',
        () {
          expect(
            original,
            [0, 1, 2, 3, 4, 5],
          );
        },
      );
    },
  );
  group(
    'addedAll()',
    () {
      final original = [0, 1, 2, 3, 4, 5];
      final result = original.addedAll([6, 7]);
      test(
        'return value should be added value',
        () {
          expect(
            result,
            [0, 1, 2, 3, 4, 5, 6, 7],
          );
        },
      );
      test(
        'return value should not be changed',
        () {
          expect(
            original,
            [0, 1, 2, 3, 4, 5],
          );
        },
      );
    },
  );
  group(
    'safetySublist() case original is empty',
    () {
      final original = [];
      final instance = original;
      test(
        'return value should be empty when start is 0',
        () {
          expect(
            instance.safetySublist(0),
            [],
          );
        },
      );
      test(
        'return value should be empty when start is out of length',
        () {
          expect(
            instance.safetySublist(10),
            [],
          );
        },
      );
    },
  );
  group(
    'safetySublist() case default',
    () {
      final original = [0, 1, 2, 3, 4, 5];
      final instance = original;
      test(
        'return value should be original.sublist(0) when start is null',
        () {
          expect(
            instance.safetySublist(null),
            original.sublist(0),
          );
        },
      );
      test(
        'return value should be original.sublist when start is 0',
        () {
          expect(
            instance.safetySublist(0),
            original.sublist(0),
          );
        },
      );
      test(
        'return value should be original.sublist when start is 1',
        () {
          expect(
            instance.safetySublist(1),
            original.sublist(1),
          );
        },
      );
      test(
        'return value should be empty when start is out of length',
        () {
          expect(
            instance.safetySublist(10),
            [],
          );
        },
      );
      test(
        'return value should be original.sublist when start is 0 and end is 0',
        () {
          expect(
            instance.safetySublist(0, 0),
            original.sublist(0, 0),
          );
        },
      );
      test(
        'return value should be original.sublist when start is 0 and end is 1',
        () {
          expect(
            instance.safetySublist(0, 1),
            original.sublist(0, 1),
          );
        },
      );
      test(
        'return value should be original.sublist when start is 1 and end is 3',
        () {
          expect(
            instance.safetySublist(1, 3),
            original.sublist(1, 3),
          );
        },
      );
      test(
        'return value should be original.sublist(1) when start is 1 and end is out of length',
        () {
          expect(
            instance.safetySublist(1, 10),
            original.sublist(1),
          );
        },
      );
      test(
        'return value should be empty when start is out of length and end is out of length',
        () {
          expect(
            instance.safetySublist(10, 20),
            [],
          );
        },
      );
      test(
        'return value should be empty when start is larger than end',
        () {
          expect(
            instance.safetySublist(3, 2),
            [],
          );
        },
      );
      test(
        'return value should be original.sublist when start equal end',
        () {
          expect(
            instance.safetySublist(3, 3),
            original.sublist(3, 3),
          );
        },
      );
    },
  );
  group(
    'separated() case original length is even number',
    () {
      final original = [0, 1, 2, 3, 4, 5];
      final instance = original;
      test(
        'return value should be List<[_]> when list is separated by none',
        () {
          expect(
            instance.separated(),
            [
              [0],
              [1],
              [2],
              [3],
              [4],
              [5]
            ],
          );
        },
      );
      test(
        'return value should be List<[_]> when list is separated by 1',
        () {
          expect(
            instance.separated(by: 1),
            [
              [0],
              [1],
              [2],
              [3],
              [4],
              [5],
            ],
          );
        },
      );
      test(
        'return value should be List<[_, _]> when list is separated by 2',
        () {
          expect(
            instance.separated(by: 2),
            [
              [0, 1],
              [2, 3],
              [4, 5],
            ],
          );
        },
      );
      test(
        'return value should be List<[_, _, _]> when list is separated by 3',
        () {
          expect(
            instance.separated(by: 3),
            [
              [0, 1, 2],
              [3, 4, 5],
            ],
          );
        },
      );
    },
  );
  group(
    'separated() case original length is even number',
    () {
      final original = [0, 1, 2, 3, 4, 5, 6];
      final instance = original;
      test(
        'return value should be List<[_, _]> when list is separated by 2',
        () {
          expect(
            instance.separated(by: 2),
            [
              [0, 1],
              [2, 3],
              [4, 5],
              [6],
            ],
          );
        },
      );
      test(
        'return value should be List<[_, _, _]> when oddList is separated by 3',
        () {
          expect(
            instance.separated(by: 3),
            [
              [0, 1, 2],
              [3, 4, 5],
              [6],
            ],
          );
        },
      );
    },
  );
}

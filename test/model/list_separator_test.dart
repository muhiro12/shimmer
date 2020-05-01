import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/model/list_separator.dart';

void main() {
  group(
    'execute()',
    () {
      final evenList = Iterable.generate(6).toList();
      final oddList = Iterable.generate(7).toList();
      test(
        'return value should be List<[_]> when list is separated by none',
        () {
          expect(
            ListSeparator.execute(evenList),
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
            ListSeparator.execute(evenList, by: 1),
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
        'return value should be List<[_, _]> when evenList is separated by 2',
        () {
          expect(
            ListSeparator.execute(evenList, by: 2),
            [
              [0, 1],
              [2, 3],
              [4, 5],
            ],
          );
        },
      );
      test(
        'return value should be List<[_, _]> when oddList is separated by 2',
        () {
          expect(
            ListSeparator.execute(oddList, by: 2),
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
        'return value should be List<[_, _, _]> when evenList is separated by 3',
        () {
          expect(
            ListSeparator.execute(evenList, by: 3),
            [
              [0, 1, 2],
              [3, 4, 5],
            ],
          );
        },
      );
      test(
        'return value should be List<[_, _, _]> when oddList is separated by 3',
        () {
          expect(
            ListSeparator.execute(oddList, by: 3),
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

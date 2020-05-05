import 'dart:math';

extension ListExtension<T> on List<T> {
  List<T> added(T value) {
    final newList = toList();
    newList.add(value);
    return newList;
  }

  List<T> addedAll(Iterable<T> values) {
    final newList = toList();
    newList.addAll(values);
    return newList;
  }

  List<T> safetySublist(int start, [int end]) {
    start = start ?? 0;
    end = end ?? length;
    if (start > end) {
      return [];
    }
    return sublist(
      min(start, length),
      min(end, length),
    );
  }

  List<List<T>> separated({int by = 1}) {
    final newList = <List<T>>[];
    for (int index = 0; index < length / by; index++) {
      final start = index * by;
      newList.add(
        safetySublist(start, start + by),
      );
    }
    return newList;
  }
}

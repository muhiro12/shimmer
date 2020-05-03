import 'dart:math';

class ExtendedList<T> {
  final List<T> original;

  ExtendedList(this.original);

  List<T> added(T value) {
    final newValue = original.toList();
    newValue.add(value);
    return newValue;
  }

  List<T> addedAll(Iterable<T> values) {
    final newValue = original.toList();
    newValue.addAll(values);
    return newValue;
  }

  List<T> safetySublist(int start, [int end]) {
    if (original == null) {
      return null;
    }
    start = start ?? 0;
    end = end ?? original.length;
    if (start > end) {
      return [];
    }
    return original.sublist(
      min(start, original.length),
      min(end, original.length),
    );
  }

  List<List<T>> separated({int by = 1}) {
    if (original == null) {
      return null;
    }
    final newValue = <List<T>>[];
    for (int index = 0; index < original.length / by; index++) {
      final start = index * by;
      newValue.add(
        safetySublist(start, start + by),
      );
    }
    return newValue;
  }
}

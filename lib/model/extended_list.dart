import 'dart:math';

class ExtendedList<T> {
  final List<T> _original;

  ExtendedList(this._original);

  List<T> toList() {
    return _original;
  }

  List<T> added(T value) {
    final newValue = _original.toList();
    newValue.add(value);
    return newValue;
  }

  List<T> addedAll(Iterable<T> values) {
    final newValue = _original.toList();
    newValue.addAll(values);
    return newValue;
  }

  List<T> safetySublist(int start, [int end]) {
    if (_original == null) {
      return null;
    }
    start = start ?? 0;
    end = end ?? _original.length;
    if (start > end) {
      return [];
    }
    return _original.sublist(
      min(start, _original.length),
      min(end, _original.length),
    );
  }

  List<List<T>> separated({int by = 1}) {
    if (_original == null) {
      return null;
    }
    final newValue = <List<T>>[];
    for (int index = 0; index < _original.length / by; index++) {
      final start = index * by;
      newValue.add(
        safetySublist(start, start + by),
      );
    }
    return newValue;
  }
}

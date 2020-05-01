import 'dart:math';

class ListSeparator {
  static List execute(List list, {int by = 1}) {
    final newList = [];
    for (int index = 0; index < list.length / by; index++) {
      newList.add(
        list.sublist(
          index * by,
          min(
            index * by + by,
            list.length,
          ),
        ),
      );
    }
    return newList;
  }
}

import 'dart:math';

class ListSeparator {
  static List execute(List list, {int separatedBy = 1}) {
    final newList = [];
    for (int index = 0; index < list.length / separatedBy; index++) {
      newList.add(
        list.sublist(
          index * separatedBy,
          min(
            index * separatedBy + separatedBy,
            list.length,
          ),
        ),
      );
    }
    return newList;
  }
}

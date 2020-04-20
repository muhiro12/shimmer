class EnumParser {
  static String stringOf(dynamic value) {
    return value.toString().replaceAll(value.runtimeType.toString() + '.', '');
  }

  static String upperCamelCaseStringOf(dynamic value) {
    final String stringOfValue = stringOf(value);
    return stringOfValue.replaceRange(0, 1, stringOfValue[0].toUpperCase());
  }
}

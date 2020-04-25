class DateParser {
  static String yearMonthDayStringOf(DateTime date) {
    return date.toString().substring(0, 10);
  }
}

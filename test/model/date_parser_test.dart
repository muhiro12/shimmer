import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/model/date_parser.dart';

void main() {
  group(
    'yearMonthDayStringOf()',
    () {
      test(
        'return value style should be yyyy-MM-dd',
        () {
          final date = DateTime.parse('20200425T184230');
          expect(
            DateParser.yearMonthDayStringOf(date),
            '2020-04-25',
          );
        },
      );
    },
  );
}

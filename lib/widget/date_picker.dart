import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/date_parser.dart';

class DatePicker extends StatefulWidget {
  final GlobalKey<_DatePickerState> key = GlobalKey<_DatePickerState>();

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 30),
          lastDate: DateTime(DateTime.now().year + 10),
        );
        setState(() {
          this.date = date;
        });
      },
      child: Text(
        DateParser.yearMonthDayStringOf(date),
      ),
    );
  }
}

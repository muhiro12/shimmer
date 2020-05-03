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
      onPressed: () => _onButtonPressed(context),
      child: Text(
        DateParser.yearMonthDayStringOf(date),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(date.year - 30),
      lastDate: DateTime(date.year + 10),
    );
    if (selectedDate != null) {
      setState(() {
        date = selectedDate;
      });
    }
  }
}

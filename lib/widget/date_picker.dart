import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/date_parser.dart';

class DatePicker extends StatefulWidget {
  DatePicker({this.initialDate});

  final DateTime initialDate;

  final GlobalKey<_DatePickerState> key = GlobalKey<_DatePickerState>();

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _onPressed(context),
      child: Text(
        DateParser.yearMonthDayStringOf(date),
      ),
    );
  }

  void _onPressed(BuildContext context) async {
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

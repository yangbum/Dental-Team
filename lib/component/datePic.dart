import 'package:flutter/material.dart';

import '../main.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(dateTime == null
            ? ' '
            : dateTime.toString().split(' ').first),
        IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now())
                  .then((date) {
                    setState(() {
                      dateTime = date;
                    });
                  });
            })
      ],
    );
  }
}

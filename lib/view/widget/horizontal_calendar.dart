import 'package:countyourblessings/view/constant/color.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    Key? key,
  }) : super(key: key);

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      width: 60,
      height: 120,
      controller: _controller,
      initialSelectedDate: DateTime.now(),
      selectionColor: kTertiaryColor,
      monthTextStyle: const TextStyle(
        fontSize: 1,
        color: Colors.transparent,
      ),
      dayTextStyle: const TextStyle(
        fontSize: 17,
      ),
      dateTextStyle: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
      ),
      inactiveDates: [
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
        DateTime.now().add(const Duration(days: 7))
      ],
      onDateChange: (date) {
        // New date selected
        setState(() {
          _selectedValue = date;
        });
      },
    );
  }
}


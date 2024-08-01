import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../utils/constants/colors.dart';

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({
    super.key,
    required DateTime focusedDay,
    required DateTime firstDay,
    required DateTime lastDay,
  })  : _focusedDay = focusedDay,
        _firstDay = firstDay,
        _lastDay = lastDay;

  final DateTime _focusedDay;
  final DateTime _firstDay;
  final DateTime _lastDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: _firstDay,
      lastDay: _lastDay,
      weekendDays: [6],
      headerStyle: HeaderStyle(
        decoration: BoxDecoration(
          color: TColors.primary.withOpacity(0.1),
        ),
        headerMargin: const EdgeInsets.only(bottom: 20),
        headerPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        titleTextStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: TColors.primary),
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
            color: TColors.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)),
        todayTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: TColors.primary,
        ),
      ),
    );
  }
}

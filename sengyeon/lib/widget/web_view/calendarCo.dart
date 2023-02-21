import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCo extends StatefulWidget {
  const CalendarCo({super.key});

  @override
  State<CalendarCo> createState() => _CalendarCoState();
}

class _CalendarCoState extends State<CalendarCo> {
  DateTime _focusedDay = DateTime.now(); // 오늘날짜
  DateTime? _selectedDate; // 선택한 날짜
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ko_KR",

      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: _focusedDay,
      calendarStyle: CalendarStyle(
        defaultTextStyle: const TextStyle(
          color: Colors.grey,
        ),
        weekendTextStyle: const TextStyle(color: Colors.red),
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(70, 244, 67, 54), width: 1.5)),
        todayTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        selectedDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 244, 67, 54), width: 1.5)),
        selectedTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),

      firstDay: DateTime(2020, 1, 1),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _calendarFormat,
      onDaySelected: (
        selectedDay,
        focusedDay,
      ) {
        if (!isSameDay(_selectedDate, selectedDay)) {
          setState(() {
            _selectedDate = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      // 날짜 선택
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      // 버튼
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },

      eventLoader: _listOfDayEvents,
    );
  }

// 이벤트로드
  Map<String, List> mySelectedEvents = {};
  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    } else {
      return [];
    }
  }
}

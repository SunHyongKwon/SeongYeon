import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/widget/calendar/calendarCo.dart';
import 'package:pj_test/widget/calendar/clist.dart';
import 'package:pj_test/widget/calendar/current_status.dart';

import '../widget/calendar/addFloatingButton.dart';

class CalendarPage1 extends StatelessWidget {
  const CalendarPage1({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController<String> controller = StreamController.broadcast();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CalendarCo(
              controller: controller,
            ),
            const SizedBox(
              height: 20,
            ),
            CurrentStatus(
              stream: controller.stream,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              child: Clist(
                stream: controller.stream,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddFloatingButton(
        stream: controller.stream,
        controller: controller,
      ),
    );
  }
}

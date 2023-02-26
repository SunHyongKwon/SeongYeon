import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/widget/calendar/addFloatingButton.dart';
import 'package:pj_test/widget/calendar/calendarCo.dart';
import 'package:pj_test/widget/calendar/clist.dart';
import 'package:pj_test/widget/calendar/current_status.dart';

class CalendarPage1 extends StatelessWidget {
  const CalendarPage1({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController<String> controller = StreamController.broadcast();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
              SingleChildScrollView(
                child: Clist(
                  stream: controller.stream,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddFloatingButton(
        stream: controller.stream,
        controller: controller,
      ),
    );
  }
}

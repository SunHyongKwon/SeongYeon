import 'package:flutter/material.dart';
import 'package:pj_test/widget/web_view/calendarCo.dart';
import 'package:pj_test/widget/web_view/clist.dart';
import 'package:pj_test/widget/web_view/current_status.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CalendarCo(),
              CurrentStatus(),
              Clist(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //_showAddEventDialog();
        },
        label: const Text(
          "+",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // function
}

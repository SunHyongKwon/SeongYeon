import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:pj_test/view/calendar_page1.dart';
import 'package:pj_test/view/calendar_page2.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
            controller: controller,
            indicatorColor: Color.fromARGB(255, 255, 163, 72),
            labelColor: Color.fromARGB(255, 255, 163, 72),
            unselectedLabelColor: Color.fromARGB(255, 252, 199, 145),
            tabs: const [
              Tab(
                text: "달력",
              ),
              Tab(
                text: "일별",
              ),
            ]),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          CalendarPage1(),
          CalendarPage2(),
        ],
      ),
    );
  }
=======
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
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
}

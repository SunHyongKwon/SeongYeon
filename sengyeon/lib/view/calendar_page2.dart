import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/calendar.dart';
import '../repository/database_handler.dart';

class CalendarPage2 extends StatefulWidget {
  const CalendarPage2({super.key});

  @override
  State<CalendarPage2> createState() => _CalendarPage2State();
}

class _CalendarPage2State extends State<CalendarPage2> {
  late DatabaseHandler handler; // DatabaseHandler 클라스로 만들어준 클라스

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler(); //생성자
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: handler.queryCal(), //데이터베이스 부르는거
        builder:
            (BuildContext context, AsyncSnapshot<List<Calendar>> snapshot) {
          //데이터는 스냅샷에 들어있다
          if (snapshot.hasData) {
            //데이터 있을경우
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            snapshot.data![index].writeday.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Divider(
                        //   height: 0.1,
                        // ),
                        SizedBox(
                          height: 89,
                          child: Card(
                            margin: const EdgeInsets.all(0), // 카드간의 간격
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    if (snapshot.data![index].inex == "수입") ...[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: const CircleAvatar(
                                            backgroundColor: Color.fromARGB(
                                                255, 250, 187, 187),
                                            child: Text(
                                              "수입",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ] else ...[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: const CircleAvatar(
                                            backgroundColor: Color.fromARGB(
                                                255, 177, 195, 255),
                                            child: Text(
                                              "지출",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data![index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (snapshot.data![index].income ==
                                            0) ...[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 14),
                                            child: Text(
                                              "-${snapshot.data![index].expenditure}원",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 177, 195, 255),
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Padding(
                                            padding: EdgeInsets.only(top: 14),
                                            child: Text(
                                              "+${snapshot.data![index].income}원",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 250, 187, 187),
                                              ),
                                            ),
                                          ),
                                        ],
                                        const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "잔액 : ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            //데이터 없으면
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

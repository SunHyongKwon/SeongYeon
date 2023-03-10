import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj_test/model/calendar.dart';
import '../../repository/database_handler.dart';

class Clist extends StatefulWidget {
  final Stream<String> stream;

  const Clist({super.key, required this.stream});

  @override
  State<Clist> createState() => _ClistState();
}

class _ClistState extends State<Clist> {
  // late DatabaseHandler handler; // DatabaseHandler 클라스로 만들어준 클라스
  var f = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
  late List<Calendar> list;

  @override
  void initState() {
    super.initState();
    list = [];
    myList(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    widget.stream.listen((event) {
      // 날짜를 가지고 가서 list 불러오는 함수 불러오기
      myList(event);
    });
  }

  // -----------------------------------------------
  // 날짜 변할 때 마다 새로운 리스트 가져오는 함수
  myList(String day) {
    DatabaseHandler handler = DatabaseHandler();
    handler.queryYear(day).then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(list[index].toString()),
            child: Card(
              margin: const EdgeInsets.all(0), // 카드간의 간격
              elevation: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              backgroundColor: list[index].inex == "수입"
                                  ? const Color.fromARGB(255, 250, 187, 187)
                                  : const Color.fromARGB(255, 177, 195, 255),
                              child: Text(
                                list[index].inex == "수입" ? '수입' : '지출',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            list[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: Text(
                                list[index].expenditure == 0
                                    ? "+ ${f.format(list[index].income)}"
                                    : "- ${f.format(list[index].expenditure)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: list[index].expenditure == 0
                                      ? const Color.fromARGB(255, 250, 187, 187)
                                      : const Color.fromARGB(
                                          255, 177, 195, 255),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

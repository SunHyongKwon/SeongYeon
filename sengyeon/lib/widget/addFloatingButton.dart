import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/calendar.dart';
import '../repository/database_handler.dart';

class AddFloatingButton extends StatefulWidget {
  final StreamController<String> controller;
  final Stream<String> stream;
  const AddFloatingButton(
      {super.key, required this.stream, required this.controller});

  @override
  State<AddFloatingButton> createState() => _AddFloatingButtonState();
}

class _AddFloatingButtonState extends State<AddFloatingButton> {
  late DatabaseHandler handler;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  late String _selectedDate;

  late bool _switch;
  // 수입 지출 스위치
  late String _status;
  // 수입 지출
  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  // 제목
  final amountController = TextEditingController();
  // 금액
  final contentController = TextEditingController();
  // 메모
  final incomController = TextEditingController();
  // 수입
  final expenditureController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler(); //생성자

    _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    widget.stream.listen((selectDay) {
      // 날짜를 가지고 가서 list 불러오는 함수 불러오기
      setState(() {
        _selectedDate = selectDay;
      });
    });

    _switch = true;
    _status = "지출";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 150),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          _showAddEventDialog();
        },
        child: const Text(
          "+",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // function
  _showAddEventDialog() async {
    await showDialog(
        barrierDismissible: false, // 바깥영역 터치시 창닫기 x
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "가계부 입력",
                textAlign: TextAlign.center,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_status),
                      Switch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                            _switch = value;
                            _swichOnOff();
                          });
                        },
                      ),
                    ],
                  ),
                  TextField(
                    controller: titleController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: "제목"),
                  ),
                  TextField(
                    controller: amountController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: "금액"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: contentController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: "메모"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    titleController.clear();
                    amountController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        amountController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("제목과 가격을 모두 입력해 주세요!"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    } else {
                      // print(titleController);
                      // print(amountController);

                      addCal();
                      widget.controller.add(_selectedDate);
                      // 달력의 검정색 표시
                      // if (mySelectedEvents[DateFormat("yyyy-MM-dd")
                      //         .format(_selectedDate!)] !=
                      //     null) {
                      //   mySelectedEvents[
                      //           DateFormat("yyyy-MM-dd").format(_selectedDate!)]
                      //       ?.add({
                      //     "Income": _status,
                      //     "Title": titleController.text,
                      //     "Amount": amountController.text
                      //   });
                      // } else {
                      //   mySelectedEvents[
                      //       DateFormat("yyyy-MM-dd").format(_selectedDate!)] = [
                      //     {
                      //       "Income": _status,
                      //       "Title": titleController.text,
                      //       "Amount": amountController.text,
                      //     }
                      //   ];
                      // }

                      print("데이터베이스 저장 ${json.encode(mySelectedEvents)}");
                      titleController.clear();
                      amountController.clear();
                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          });
        });
  }

  _swichOnOff() {
    if (_switch == true) {
      setState(() {
        _status = "지출";
        _switch = true;
      });
    } else {
      setState(() {
        _status = "수입";
        _switch = false;
      });
    }
  }

  // db에 데이터 저장
  Future<int> addCal() async {
    print(_selectedDate);

    Calendar addCal;
    if (_status == "지출") {
      addCal = Calendar(
          title: titleController.text,
          inex: _status,
          income: 0,
          expenditure: int.parse(amountController.text),
          content: contentController.text,
          writeday: _selectedDate);
    } else {
      addCal = Calendar(
          title: titleController.text,
          inex: _status,
          income: int.parse(amountController.text),
          expenditure: 0,
          content: contentController.text,
          writeday: _selectedDate);
    }

    await handler.insertCal(addCal);
    return 0;
  }
}

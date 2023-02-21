import 'package:flutter/material.dart';

import '../../repository/database_handler.dart';

class Clist extends StatefulWidget {
  const Clist({super.key});

  @override
  State<Clist> createState() => _ClistState();
}

class _ClistState extends State<Clist> {
  late DatabaseHandler handler; // DatabaseHandler 클라스로 만들어준 클라스

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 204,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //
              },
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
                          if (1 + 2 == 3) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 250, 187, 187),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 177, 195, 255),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "제목",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 14),
                              child: Text(
                                "100000000원",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "날짜",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

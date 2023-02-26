import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final StreamController<int> controller;
  const Home({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 45,
      //   title: const Text('Home'),
      //   centerTitle: true,
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: <Color>[
      //           Color(0xffFFB973),
      //           Colors.white38,
      //           Color(0xffFFB973),
      //         ])),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.add(1);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('images/map.jpeg'),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 210,
                      left: 30,
                      child: Text(
                        '지도보러가기',
                        style: TextStyle(
                          fontSize: 24, // 글꼴 크기
                          fontWeight: FontWeight.bold, // 글꼴 가중치
                          fontStyle: FontStyle.italic, // 글꼴 스타일
                          letterSpacing: 1.5, // 글자 간격
                          wordSpacing: 5, // 단어 간격
                          height: 1.5, // 줄 간격
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.add(2);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('images/charttt.png'),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 210,
                      left: 30,
                      child: Text(
                        '차트보러가기',
                        style: TextStyle(
                          fontSize: 24, // 글꼴 크기
                          fontWeight: FontWeight.bold, // 글꼴 가중치
                          fontStyle: FontStyle.italic, // 글꼴 스타일
                          letterSpacing: 1.5, // 글자 간격
                          wordSpacing: 5, // 단어 간격
                          height: 1.5, // 줄 간격
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.add(3);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'images/food2.webp',
                            fit: BoxFit.fill,
                            height: 250,
                            width: 400,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 210,
                      left: 30,
                      child: Text(
                        '농수산물 갸격표',
                        style: TextStyle(
                          fontSize: 24, // 글꼴 크기
                          fontWeight: FontWeight.bold, // 글꼴 가중치
                          fontStyle: FontStyle.italic, // 글꼴 스타일
                          fontFamily: 'San Francisco',
                          letterSpacing: 1.5, // 글자 간격
                          wordSpacing: 5, // 단어 간격
                          height: 1.5, // 줄 간격
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.add(4);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('images/calendar.png'),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 270,
                      left: 30,
                      child: Text(
                        '가게부 작성',
                        style: TextStyle(
                          fontSize: 24, // 글꼴 크기
                          fontWeight: FontWeight.bold, // 글꼴 가중치
                          fontStyle: FontStyle.italic, // 글꼴 스타일
                          letterSpacing: 1.5, // 글자 간격
                          wordSpacing: 5, // 단어 간격
                          height: 1.5, // 줄 간격
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          // controller.add(4);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('images/calc.jpeg'),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 270,
                      left: 30,
                      child: Text(
                        '계산기',
                        style: TextStyle(
                          fontSize: 24, // 글꼴 크기
                          fontWeight: FontWeight.bold, // 글꼴 가중치
                          fontStyle: FontStyle.italic, // 글꼴 스타일
                          letterSpacing: 1.5, // 글자 간격
                          wordSpacing: 5, // 단어 간격
                          height: 1.5, // 줄 간격
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

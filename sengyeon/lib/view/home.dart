import 'dart:async';

import 'package:flutter/material.dart';
<<<<<<< HEAD

class Home extends StatelessWidget {
  final StreamController<int> controller;
  const Home({super.key, required this.controller});
=======
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  // late WebViewController controller = WebViewController()
  //   ..loadRequest(Uri.parse('http://127.0.0.1:5000/main'))
  //   ..loadRequest(Uri.parse('http://www.naver.com'))
  //   ..loadRequest(Uri.parse('http://www.daum.net'));

  // late String url;
  late String dropdownValue;
  late List<String> items;
  // late WebViewController controller;
  late String siteName;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    dropdownValue = '성별';
    items = ['성별', '연령대별', '시간대별', '요일별'];
    siteName = 'http://127.0.0.1:5000/main';
    isLoading = true;
    // loadMap('성별');
  }
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
                          child: Image.asset('images/food.png'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
=======
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('WebView'),
          actions: [
            DropdownButton(
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: const TextStyle(color: Colors.black, fontSize: 16),
              onChanged: (value) {
                // loadMap(value);
              },
            )
          ],
        ),
      ),
      // body: SafeArea(
      //     child: Stack(
      //   children: [
      //     WebViewWidget(
      //       controller: controller,
      //     ),
      //   ],
      // )),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewController) {
              _controller.complete(webviewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }

  loadMap(value) {
    setState(() {
      if (value == '성별') {
        _controller.future.then((value) => value.loadUrl('https://$siteName'));
        // controller = WebViewController()
        //   ..loadRequest(Uri.parse('https://www.naver.com'));
      } else {}
    });
  }
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
}

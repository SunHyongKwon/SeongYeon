import 'dart:async';

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}

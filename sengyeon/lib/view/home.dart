import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse('http://127.0.0.1:5000/main'));

  // late String url;
  late String dropdownValue;
  late List<String> items;
  // late WebViewController controller;

  @override
  void initState() {
    super.initState();
    dropdownValue = 'One';
    items = ['성별', '연령대별', '시간대별', '요일별'];
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
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }

  // loadMap(value) {
  //   setState(() {
  //     if (value == '성별') {
  //       controller = WebViewController()
  //         ..loadRequest(Uri.parse('https://www.naver.com'));
  //     } else {}
  //   });
  // }
}

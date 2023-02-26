import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/model/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // WebViewController는 callBack을 통해 화면구성을 한 후 사용이 가능하다
  // Completer 비동기 처리방식
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: true,
            child: WebView(
              initialUrl: WebViewModel.siteName,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (url) {
                setState(() {
                  WebViewModel.isLoading = false;
                });
              },
              onPageStarted: (url) {
                setState(() {
                  WebViewModel.isLoading = true;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 70, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    hint: const SizedBox(
                      width: 120,
                      child: Center(
                        child: Text('업종선택'),
                      ),
                    ),
                    items: WebViewModel.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    borderRadius: BorderRadius.circular(15),
                    onChanged: (value) {
                      loadMap(value);
                    },
                    underline: Container(
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  loadMap(value) {
    if (value == '성별') {
      WebViewModel.siteName = 'http://127.0.0.1:5000/gender';
    } else if (value == '시간대별') {
      WebViewModel.siteName = 'http://127.0.0.1:5000/time';
    } else if (value == '연령대별') {
      WebViewModel.siteName = 'http://127.0.0.1:5000/age';
    } else {
      WebViewModel.siteName = 'http://127.0.0.1:5000/week';
    }
    WebViewModel.appbarTitle = value + ' 매출';
    _controller.future.then((value) => value.loadUrl(WebViewModel.siteName));
  }
}

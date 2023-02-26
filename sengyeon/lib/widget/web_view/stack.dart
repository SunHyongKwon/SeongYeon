// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pj_test/view_model/web_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewStack extends StatefulWidget {
//   const WebViewStack({super.key});

//   @override
//   State<WebViewStack> createState() => _WebViewStackState();
// }

// class _WebViewStackState extends State<WebViewStack> {
//   // WebViewController는 callBack을 통해 화면구성을 한 후 사용이 가능하다
//   // Completer 비동기 처리방식
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: WebViewModel.siteName,
//       builder: (context, value1, child) {
//         _controller.future.then((value) => value.loadUrl(value1));
//         print("1");
//         return FutureBuilder(
//             future: _controller.future,
//             builder: (context, snapshot) {
//               print("2");
//               return Stack(
//                 children: [
//                   WebView(
//                     initialUrl: value1,
//                     javascriptMode: JavascriptMode.unrestricted,
//                     onWebViewCreated: (WebViewController webViewController) {
//                       _controller.complete(webViewController);
//                     },
//                     onPageFinished: (url) {
//                       setState(() {
//                         print("3");
//                         WebViewModel.isLoading = false;
//                       });
//                     },
//                     onPageStarted: (url) {
//                       setState(() {
//                         print("4");
//                         WebViewModel.isLoading = true;
//                       });
//                     },
//                   ),
//                   WebViewModel.isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : Stack()
//                 ],
//               );
//             });
//       },
//     );
//   }
// }

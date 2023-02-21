import 'package:flutter/material.dart';
import 'package:pj_test/widget/web_view/dropdown.dart';
import 'package:pj_test/widget/web_view/stack.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
        actions: const [
          DropDown(),
        ],
      ),
      body: const WebViewStack(),
    );
  }
} // End





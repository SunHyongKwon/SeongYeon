import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final StreamController<int> controller;
  const Home({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: const Text('Home'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xffFFB973),
                Colors.white38,
                Color(0xffFFB973),
              ])),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 280,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.add(1);
                  },
                  child: const Text('WebView'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 280,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.add(2);
                  },
                  child: const Text('Chart'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 280,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.add(3);
                  },
                  child: const Text('FoodList'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 280,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.add(4);
                  },
                  child: const Text('Calendar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

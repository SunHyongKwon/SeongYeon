import 'package:flutter/material.dart';
import 'package:python_project/home.dart';
import 'package:python_project/view/tapbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const NavigationBarPage(),
    );
  }
}

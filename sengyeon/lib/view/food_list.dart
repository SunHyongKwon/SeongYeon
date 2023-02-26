<<<<<<< HEAD
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pj_test/widget/foodList/button.dart';
import 'package:pj_test/widget/foodList/listView.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController<String> controller = StreamController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(child: TopButton(controller: controller)),
              Expanded(child: FoodListView(stream: controller.stream)),
            ],
          ),
        ),
=======
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFB973),
        title: const Text('Food List'),
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
      ),
    );
  }
}

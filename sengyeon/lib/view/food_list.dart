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
      ),
    );
  }
}

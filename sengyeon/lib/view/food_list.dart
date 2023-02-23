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
      appBar: AppBar(
        toolbarHeight: 45,
        title: const Text('Food List'),
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
          children: [
            SizedBox(child: TopButton(controller: controller)),
            Expanded(child: FoodListView(stream: controller.stream)),
          ],
        ),
      ),
    );
  }
}

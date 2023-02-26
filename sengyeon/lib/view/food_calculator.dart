import 'package:flutter/material.dart';
import 'package:pj_test/model/food_model.dart';
import 'package:pj_test/widget/calculator/calculator_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFB973),
        title: const Text(
          '농수산물 무게별 가격 확인',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CalculatorWidget(
              // pass callback function to handle state update
              listUpdate: () {
                setState(() {
                  FoodModelList();
                });
              },
              lastPrice: FoodModelList.lastPrice,
            ),
          ),
        ],
      ),
    );
  }
}

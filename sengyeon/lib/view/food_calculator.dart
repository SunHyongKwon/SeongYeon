import 'package:flutter/material.dart';
import 'package:pj_test/widget/food_price/calculator_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return CalculatorWidget();
  }
}

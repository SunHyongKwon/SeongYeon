import 'package:flutter/material.dart';
import 'package:python_project/widget/calculator_widget.dart';

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

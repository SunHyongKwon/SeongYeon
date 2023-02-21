import 'package:flutter/material.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [Text('1')],
      ),
    );
  }
}

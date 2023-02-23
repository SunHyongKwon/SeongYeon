import 'package:flutter/material.dart';
import 'package:pj_test/widget/indicator/indicator_component.dart';

class Indicator extends StatelessWidget {
  final Color color;

  const Indicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          foregroundPainter: IndicatorComponent(
            context: context,
            color: color,
          ),
          size: Size(MediaQuery.of(context).size.width / 5, 0),
        ),
      ],
    );
  }
}

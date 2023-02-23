import 'package:flutter/material.dart';
import 'package:pj_test/widget/indicator/indicator.dart';

class Indicators extends StatelessWidget {
  final List<Color> colorList;

  const Indicators({super.key, required this.colorList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          color: colorList[0],
        ), // 동 선택
        Indicator(
          color: colorList[1],
        ), // 점포 수 , 프랜차이즈 점포 수 , 개업 점포 수
        Indicator(
          color: colorList[2],
        ), // 총 직장 인구 수 , 10대 직장 인구 수
        Indicator(
          color: colorList[3],
        ), // 결과 확인
      ],
    );
  }
}

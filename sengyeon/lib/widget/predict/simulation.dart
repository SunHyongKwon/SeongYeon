import 'package:flutter/material.dart';
import 'package:pj_test/widget/predict/chart_container.dart';

class Simul extends StatelessWidget {
  final TabController controller;

  const Simul({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const ChartContainer(
              text: '상권에 점포수가 많으면 매출이 늘어날까?',
              type: 'shop',
            ),
            const ChartContainer(
              text: '상권에 직장인이 많으면 매출이 늘어날까?',
              type: 'pop',
            ),
            const ChartContainer(
              text: '상권에 프랜차이즈가 많으면 매출이 늘어날까?',
              type: 'franchise',
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                // controller 이용해서 화면 넘기기
                controller.animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 254, 138, 15),
              ),
              child: const Text('복합적으로 판단해보기'),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

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
<<<<<<< HEAD
            const SizedBox(
              height: 20,
            ),
            const Text(
              '간단하게 매출 파악할 수 있어요',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text(
                  '     매출 예측을 위한 데이터의 평균 값들이 세팅되어 있는 상태에서 \n     해당 값들의 변경을 통해 간편하게 \n     자기 매장의 매출 예측을 하실 수 있습니다.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(195, 129, 128, 128),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
                height: 10,
                indent: 10,
              ),
            ),
=======
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
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
<<<<<<< HEAD
              height: 20,
=======
              height: 40,
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
            ),
            ElevatedButton(
              onPressed: () {
                // controller 이용해서 화면 넘기기
                controller.animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 254, 138, 15),
              ),
<<<<<<< HEAD
              child: const Text(
                '복합적으로 판단해보기',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
=======
              child: const Text('복합적으로 판단해보기'),
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
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

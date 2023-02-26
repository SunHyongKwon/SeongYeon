import 'package:flutter/material.dart';
import 'package:pj_test/widget/predict/predict.dart';
import 'package:pj_test/widget/predict/simulation.dart';

class PredictSimul extends StatefulWidget {
  const PredictSimul({super.key});

  @override
  State<PredictSimul> createState() => _PredictSimulState();
}

class _PredictSimulState extends State<PredictSimul>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     '매장의 매출을 예측해 보세요',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Color.fromARGB(216, 255, 255, 255),
      //     ),
      //   ),
      //   backgroundColor: const Color(0xffFFB973),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: controller,
              labelColor: const Color.fromARGB(255, 255, 148, 33),
              unselectedLabelColor: const Color.fromARGB(207, 255, 172, 84),
              indicatorColor: const Color.fromARGB(255, 255, 148, 33),
              tabs: const [
                Tab(
                  child: Text(
                    '시뮬레이션',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '예측해보기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  Simul(
                    controller: controller,
                  ), // simulation 화면
                  const Predict(), // 예측해보는 화면
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

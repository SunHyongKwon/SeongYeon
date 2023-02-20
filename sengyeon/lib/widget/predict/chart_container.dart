import 'package:flutter/material.dart';
import 'package:pj_test/service/simulation_service.dart';
import 'package:pj_test/widget/chart/line_chart.dart';

class ChartContainer extends StatefulWidget {
  final String text;
  final String type;

  const ChartContainer({
    super.key,
    required this.text,
    required this.type,
  });

  @override
  State<ChartContainer> createState() => _ChartContainerState();
}

class _ChartContainerState extends State<ChartContainer> {
  late List<double> points = [];
  late List<String> labels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeChart();
  }

  @override
  Widget build(BuildContext context) {
    return points.isEmpty && labels.isEmpty
        ? const CircularProgressIndicator()
        : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 254, 138, 15),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomPaint(
                size: const Size(300, 200),
                foregroundPainter: LineChart(
                  points: points,
                  labels: labels,
                  pointSize: 15.0, // 점의 크기를 정합니다.
                  lineWidth: 5.0, // 선의 굵기를 정합니다.
                  lineColor:
                      const Color.fromARGB(255, 254, 138, 15), // 선의 색을 정합니다.
                  pointColor: const Color.fromARGB(255, 254, 138, 15),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          );
  } // build 함수

  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.20
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : labelsMap 과 pointsMap 만들기
  makeChart({start = 10}) async {
    /// 1. 머신러닝 예측 하기 위해 service와 연결 시켜야 된다.
    /// 1-1. 타입 별로 받아올 service를 나눠야 될 것 같다.
    SimulationService simService = SimulationService();

    Map map;

    if (widget.type == 'shop') {
      // 점포수 바뀔 시에 받아올 부분
      map = await simService.changeShop(start: start);
    } else if (widget.type == 'pop') {
      // 직장 인구수 바뀔 시에 받아올 부분
      map = await simService.changePop();
    } else if (widget.type == 'franchise') {
      // 프랜차이즈 점포 수 바뀔 시에 받아올 부분
      map = await simService.changeFranchise();
    } else {
      map = {};
    }

    /// 2. 받아온 값을 labelsMap과 pointsMap에 연결해야 된다.

    // 오류 방지
    setState(() {
      labels = map['labels'];
      points = map['points'];
    });
  }
}

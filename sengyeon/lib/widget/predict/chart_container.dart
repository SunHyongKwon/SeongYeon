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
  late int start;
  late int realStart;
  late int interval;
  late Color btnReduceColor;
  late Color btnAddColor;

  @override
  void initState() {
    super.initState();
    start = 0; // 시작값 조정값
    realStart = widget.type == 'shop'
        ? 40
        : widget.type == 'pop'
            ? 200
            : 1;

    interval = widget.type == 'shop'
        ? 5
        : widget.type == 'pop'
            ? 20
            : 1;
    btnAddColor = const Color.fromARGB(255, 177, 195, 255);
    btnReduceColor = const Color.fromARGB(66, 0, 0, 0);
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
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        changeValue(false);
                      });
                    },
                    fillColor: btnReduceColor,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '시작값 : ${(realStart + start).toString()}  간격 : ${interval.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        changeValue(true);
                      });
                    },
                    fillColor: btnAddColor,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPaint(
                size: const Size(300, 200),
                foregroundPainter: LineChart(
                  points: points,
                  labels: labels,
                  pointSize: 15.0, // 점의 크기를 정합니다.
                  lineWidth: 3.0, // 선의 굵기를 정합니다.
                  lineColor:
                      const Color.fromARGB(255, 250, 187, 187), // 선의 색을 정합니다.
                  pointColor: const Color.fromARGB(255, 250, 187, 187),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                  height: 10,
                  indent: 10,
                ),
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
  makeChart() async {
    /// 1. 머신러닝 예측 하기 위해 service와 연결 시켜야 된다.
    /// 1-1. 타입 별로 받아올 service를 나눠야 될 것 같다.
    SimulationService simService = SimulationService();

    Map map = {};

    if (widget.type == 'shop') {
      // 점포수 바뀔 시에 받아올 부분
      map = await simService.changeShop(start: start);
    } else if (widget.type == 'pop') {
      // 직장 인구수 바뀔 시에 받아올 부분
      map = await simService.changePop(start: start);
    } else if (widget.type == 'franchise') {
      // 프랜차이즈 점포 수 바뀔 시에 받아올 부분
      map = await simService.changeFranchise(start: start);
    }

    /// 2. 받아온 값을 labelsMap과 pointsMap에 연결해야 된다.
    setState(() {
      labels = map['labels'];
      points = map['points'];
    });
  }

  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.20
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : + - 버튼 누를시 값 변경 시키기
  changeValue(bool type) async {
    btnAddColor = const Color.fromARGB(255, 177, 195, 255);
    if (type) {
      if (widget.type == 'shop') {
        // 점포수 바뀔 시에 받아올 부분
        start += 3;
      } else if (widget.type == 'pop') {
        // 직장 인구수 바뀔 시에 받아올 부분
        if (start < 810) {
          start += 5;
        } else {
          btnAddColor = const Color.fromARGB(66, 0, 0, 0);
        }
      } else if (widget.type == 'franchise') {
        // 프랜차이즈 점포 수 바뀔 시에 받아올 부분
        if (start < 12) {
          start += 1;
        } else {
          btnAddColor = const Color.fromARGB(66, 0, 0, 0);
        }
      }
    } else {
      if (widget.type == 'shop') {
        // 점포수 바뀔 시에 받아올 부분
        start -= 3;
      } else if (widget.type == 'pop') {
        // 직장 인구수 바뀔 시에 받아올 부분
        start -= 5;
      } else if (widget.type == 'franchise') {
        // 프랜차이즈 점포 수 바뀔 시에 받아올 부분
        start -= 1;
      }
    }

    if (start < 0) {
      btnReduceColor = const Color.fromARGB(66, 0, 0, 0);
      start = 0;
    } else {
      btnReduceColor = const Color.fromARGB(255, 177, 195, 255);
    }

    await makeChart();

    setState(() {});
  }
}

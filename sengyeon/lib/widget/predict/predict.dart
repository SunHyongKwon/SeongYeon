import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/view_model/feature_view_model.dart';
import 'package:pj_test/widget/indicator/indicators.dart';
import 'package:pj_test/widget/predict/inputview.dart/inputview_four.dart';
import 'package:pj_test/widget/predict/inputview.dart/inputview_one.dart';
import 'package:pj_test/widget/predict/inputview.dart/inputview_three.dart';
import 'package:pj_test/widget/predict/inputview.dart/inputview_two.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  final StreamController<int> controller = StreamController();

  late List<bool> stackList;
  late List<Color> colorList;
  late int index;

  @override
  void initState() {
    super.initState();

    stackList = [true, false, false, false];
    colorList = [
      Colors.orange,
      Colors.black12,
      Colors.black12,
      Colors.black12,
    ];
    index = 0;

    // init 될 때 static 값 초기화 시키기
    Feature.dong = "";
    Feature.shop = 0;
    Feature.openShop = 0;
    Feature.franchiseShop = 0;
    Feature.worker = 0;
    Feature.teen = 0;

    controller.stream.listen((event) {
      setState(() {
        index = event;
        whenPop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${index + 1} 단계',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Indicators(
                    colorList: colorList,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Stack(
              children: [
                Visibility(
                  visible: stackList[0],
                  child: const InputViewOne(),
                ),
                Visibility(
                  visible: stackList[1],
                  child: const InputViewTwo(),
                ),
                Visibility(
                  visible: stackList[2],
                  child: const InputViewThree(),
                ),
                Visibility(
                  visible: stackList[3],
                  child: InputViewFour(controller: controller),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          changeVisibleAndColor(false);
                        },
                        shape: const CircleBorder(),
                        child: const SizedBox(
                          height: 200,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 40,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          changeVisibleAndColor(true);
                        },
                        shape: const CircleBorder(),
                        child: const SizedBox(
                          height: 200,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 40,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// -----------------------------------------------------------------------------
  /// 만든이 : 권순형
  /// 작성일 : 2022.02.23
  /// 수정일 :
  /// 삭제일 :
  /// 설명 : 버튼 눌렀을 때, visibility와 색깔 채우는 거 바꾸기
  changeVisibleAndColor(bool type) {
    if (type) {
      if (index < 3) {
        index++;
      }
    } else {
      if (index > 0) {
        index--;
      }
    }

    for (var i = 0; i < 4; i++) {
      if (i <= index) {
        colorList[i] = Colors.orange;
      } else {
        colorList[i] = Colors.black12;
      }
    }

    stackList = [false, false, false, false];

    stackList[index] = true;

    setState(() {});
  }

  whenPop() {
    for (var i = 0; i < 4; i++) {
      if (i <= index) {
        colorList[i] = Colors.orange;
      } else {
        colorList[i] = Colors.black12;
      }
    }

    stackList = [false, false, false, false];

    stackList[index] = true;

    setState(() {});
  }
}

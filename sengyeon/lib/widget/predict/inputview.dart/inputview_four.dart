import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj_test/service/simulation_service.dart';
import 'package:pj_test/view_model/feature_view_model.dart';

class InputViewFour extends StatefulWidget {
  final StreamController<int> controller;

  const InputViewFour({super.key, required this.controller});

  @override
  State<InputViewFour> createState() => _InputViewFourState();
}

class _InputViewFourState extends State<InputViewFour> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                '입력한 값 확인하기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Divider(
                  color: Colors.black54,
                ),
              ),
              const Text(
                '현재 지원되는 예측 모델은 관악구만 해당 됩니다.\n추후 업데이트를 통해 다른 구의 매출 예측을 지원한 예정입니다.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '선택한 동',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.dong,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '점포 수',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.shop.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '개업 점포 수',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.openShop.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '프렌차이즈 점포 수',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.openShop.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '직장 인구 수',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.worker.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                      height: 20,
                      child: Text(
                        '10대 직장 인구 수',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Text(
                        Feature.teen.toString(),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '입력하신 값이 맞습니까?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        var result = await predict();
                        showAlert(result);
                      },
                      child: const Text(
                        '예',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 62, 168, 255),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        backToFront();
                      },
                      child: const Text(
                        '아니요',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 62, 62),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } // build 함수

  /// -------------------------------------------------------------------------------
  /// 만든이 : 권순형
  /// 함수 : 값 예측하기
  predict() async {
    SimulationService service = SimulationService();
    var result = 0.0;
    if (Feature.shop != 0 &&
        Feature.openShop != 0 &&
        Feature.franchiseShop != 0 &&
        Feature.worker != 0 &&
        Feature.teen != 0 &&
        Feature.dong != "") {
      result = await service.predict(Feature.shop, Feature.franchiseShop,
          Feature.openShop, Feature.worker, Feature.teen, Feature.dong);
    }

    return result;
  }

  /// -------------------------------------------------------------------------------
  /// 만든이 : 권순형
  /// 함수 : 예측한 값 bottom sheet에 보여주기
  showAlert(double result) {
    var res = "";

    if (result > 0) {
      var f = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
      res = f.format(result.round()).toString();
    }

    String resultText = result < 0
        ? "입력값이 데이터의 평균치에 비해 현저히 떨어집니다."
        : result == 0
            ? "입력하지 않은 값이 있습니다."
            : "분기당 평균 매출은\n$res 입니다.";

    showModalBottomSheet(
      // 이 context는 원래 있는 context를 말해준다.
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: const Center(
                  child: Text(
                    '매출 예측 결과',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 254, 155, 55),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Center(
                  child: Text(
                    resultText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: resultText.contains(RegExp(r'[0-9]'))
                          ? Colors.black
                          : Colors.black38,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(
                  height: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton(
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  backToFront() {
    Feature.dong = "";
    Feature.franchiseShop = 0;
    Feature.shop = 0;
    Feature.openShop = 0;
    Feature.worker = 0;
    Feature.teen = 0;

    widget.controller.add(0);
  }
}

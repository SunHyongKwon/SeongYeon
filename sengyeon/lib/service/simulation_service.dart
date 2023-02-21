import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class SimulationService {
  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.20
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : shop의 개수를 변경해서 예측값이 어떻게 변화하는지 포인터를 가져온다.
  Future<Map> changeShop({start}) async {
    // 포인트 받을 변수 선언
    List<double> points = [];

    // 1. flask 연결
    for (var element in [80, 20, 20, 30, 40, 50, 60, 70, 90, 100]) {
      var url = Uri.parse(
          'http://127.0.0.1:5000/predict?shop=$element&franchise=10&open=1&worker=100000&dong=%EB%82%9C%EA%B3%A1%EB%8F%99&teen=1000');
      var response = await http.get(url);
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      double result = dataConvertedJSON['result'];
      points.add(result);
      // 2. 받아온 값을 토대로 10개의 값을 넣어서 포인트를 받아온다.
    }
    // 오류 방지용
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
      'points': points
    };

    return test;
  }

  Future<Map> changePop() async {
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6'],
      'points': [50.0, 100.0, 20.0, 40.0, 70.0, 30.0]
    };

    return test;
  }

  Future<Map> changeFranchise() async {
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6'],
      'points': [50.0, 100.0, 20.0, 40.0, 70.0, 30.0]
    };
    return test;
  }
}

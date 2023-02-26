import 'dart:convert';
import 'package:http/http.dart' as http;

class SimulationService {
  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.20
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : shop의 개수를 변경해서 예측값이 어떻게 변화하는지 포인터를 가져온다.
<<<<<<< HEAD
  Future<Map> changeShop({start = 0}) async {
    // 포인트 받을 변수 선언
    List<double> points = [];

    List shopList = [40, 45, 50, 55, 60, 65, 70, 75, 80, 85];
    shopList = shopList.map((e) => e + start).toList();
    // 1. flask 연결
    for (var element in shopList) {
      var url = Uri.parse(
          'http://127.0.0.1:5000/predict?shop=$element&franchise=6.054535637149028&open=2.23866090712743&worker=284.45302375809933&dong=%EB%8C%80%ED%95%99%EB%8F%99&teen=0.5556155507559395');
      var response = await http.get(url);
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      double result = dataConvertedJSON['result'];
      points.add(result);
      // 2. 받아온 값을 토대로 10개의 값을 넣어서 포인트를 받아온다.
    }

    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
      'points': points
    };

    return test;
  }

  Future<Map> changePop({start = 0}) async {
    // 포인트 받을 변수 선언
    List<double> points = [];

    List popList = [200, 220, 240, 260, 280, 300, 320, 340, 360, 380];
    popList = popList.map((e) => e + start).toList();
    // 1. flask 연결
    for (var element in popList) {
      var url = Uri.parse(
          'http://127.0.0.1:5000/predict?shop=38.08099352051836&franchise=6.054535637149028&open=2.23866090712743&worker=$element&dong=%EB%8C%80%ED%95%99%EB%8F%99&teen=0.5556155507559395');
=======
  Future<Map> changeShop({start}) async {
    // 포인트 받을 변수 선언
    List<double> points = [];

    // 1. flask 연결
    for (var element in [80, 20, 20, 30, 40, 50, 60, 70, 90, 100]) {
      var url = Uri.parse(
          'http://127.0.0.1:5000/predict?shop=$element&franchise=10&open=1&worker=100000&dong=%EB%82%9C%EA%B3%A1%EB%8F%99&teen=1000');
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
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

<<<<<<< HEAD
  Future<Map> changeFranchise({start = 0}) async {
    // 포인트 받을 변수 선언
    List<double> points = [];

    List franchiseList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    franchiseList = franchiseList.map((e) => e + start).toList();
    // 1. flask 연결
    for (var element in franchiseList) {
      var url = Uri.parse(
          'http://127.0.0.1:5000/predict?shop=38.08099352051836&franchise=$element&open=2.23866090712743&worker=284.45302375809933&dong=%EB%8C%80%ED%95%99%EB%8F%99&teen=0.5556155507559395');
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
=======
  Future<Map> changePop() async {
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6'],
      'points': [50.0, 100.0, 20.0, 40.0, 70.0, 30.0]
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
    };

    return test;
  }

<<<<<<< HEAD
  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.23
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : shop의 개수를 변경해서 예측값이 어떻게 변화하는지 포인터를 가져온다.
  Future<double> predict(int shop, int franchise, int open, int worker,
      int teen, String dong) async {
    // 1. flask 연결
    var url = Uri.parse(
        'http://127.0.0.1:5000/predict?shop=$shop&franchise=$franchise&open=$open&worker=$worker&dong=$dong&teen=$teen');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    double result = dataConvertedJSON['result'];

    return result;
=======
  Future<Map> changeFranchise() async {
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6'],
      'points': [50.0, 100.0, 20.0, 40.0, 70.0, 30.0]
    };
    return test;
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
  }
}

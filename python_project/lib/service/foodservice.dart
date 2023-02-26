import 'dart:convert';
import 'dart:io' show Platform; //ios 및 android os마다 값을 지정해줄 수 있도록 해줌.
import 'package:http/http.dart' as http;

class FoodService {
  Future<List> getCategory() async {
    //카테고리 가져오기
    String url = '';
    if (Platform.isAndroid) {
      url = 'http://10.0.2.2:8080/flutter/category/category_select_flutter.jsp';
    } else if (Platform.isIOS) {
      url =
          'http://localhost:8080/flutter/category/category_select_flutter.jsp';
    }
    var response = await http.get(Uri.parse(url));
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    return result;
  }

  Future<List> getFoodlist(String selectedItem) async {
    String url = '';
    if (Platform.isAndroid) {
      url =
          'http://10.0.2.2:8080/flutter/category/category_select_foodName_flutter.jsp?category=$selectedItem';
    } else if (Platform.isIOS) {
      url =
          'http://localhost:8080/flutter/category/category_select_foodName_flutter.jsp?category=$selectedItem';
    }
    //Android는 localhost 대신 10.0.2.2를 사용
    var response = await http.get(Uri.parse(url));
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    return result;
  }

  Future<List> getFoodprice(String foodnameItem, String selectedItem) async {
    //제품에 해당되는 금액 가져오기 무게나 갯수도 가져온다.
    String url = '';
    if (Platform.isAndroid) {
      url =
          'http://10.0.2.2:8080/flutter/category/category_select_price_flutter.jsp?name=$foodnameItem&category=$selectedItem';
    } else if (Platform.isIOS) {
      url =
          'http://localhost:8080/flutter/category/category_select_price_flutter.jsp?name=$foodnameItem&category=$selectedItem';
    }
    //Android는 localhost 대신 10.0.2.2를 사용
    var response = await http.get(Uri.parse(url));
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    return result;
  }
}

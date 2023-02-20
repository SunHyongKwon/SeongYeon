import 'package:flutter/material.dart';

class WebViewModel with ChangeNotifier {
  static bool isLoading = true;
  static int count = 0;

  static ValueNotifier<String> siteName =
      ValueNotifier('http://127.0.0.1:5000/gender');

  void loadMap(value) {
    WebViewModel.count = 0;
    print("loadMap");

    if (value == '성별') {
      siteName = ValueNotifier('http://127.0.0.1:5000/gender');
    } else if (value == '시간대별') {
      siteName = ValueNotifier('http://127.0.0.1:5000/time');
    } else if (value == '연령대별') {
      siteName = ValueNotifier('http://127.0.0.1:5000/age');
    }

    notifyListeners();

    print("loadMap2");
  }
}

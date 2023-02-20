import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

class SimulationService {
  /// --------------------------------------------------
  /// 작성자 : 권순형
  /// 시작날짜 : 2022.02.20
  /// 수정날짜 :
  /// 완성날짜 :
  /// 설명 : shop의 개수를 변경해서 예측값이 어떻게 변화하는지 포인터를 가져온다.
  Future<Map> changeShop({start}) async {
    // 2. 받아온 값을 토대로 10개의 값을 넣어서 포인트를 받아온다.
    // firebase 머신러닝 사용하는 방법
    FirebaseModelDownloader.instance
        .getModel(
            "sangkwon",
            FirebaseModelDownloadType.localModel,
            FirebaseModelDownloadConditions(
              iosAllowsCellularAccess: true,
              iosAllowsBackgroundDownloading: false,
              androidChargingRequired: false,
              androidWifiRequired: false,
              androidDeviceIdleRequired: false,
            ))
        .then((customModel) {
      // Download complete. Depending on your app, you could enable the ML
      // feature, or switch from the local model to the remote model, etc.

      // The CustomModel object contains the local path of the model file,
      // which you can use to instantiate a TensorFlow Lite interpreter.
      final localModelPath = customModel.file;

      // ...
    });

    // 오류 방지용
    Map test = {
      'labels': ['1', '2', '3', '4', '5', '6'],
      'points': [50.0, 100.0, 20.0, 40.0, 70.0, 30.0]
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

class FoodModel {
  static String foodCategory = '';
  static String foodName = '';
  static double foodWeight = 0; //무게 입력 및 계산 확인 또는 배경화면을 누르면 계산을 하도록
  static double foodPrice = 0; //총 금액
  static double inputWeight = 0;
  static double totalPrice = 0;
}

class FoodInfoModel {
  final String foodCategory;
  final String foodName;
  final double foodWeight; //무게 입력 및 계산 확인 또는 배경화면을 누르면 계산을 하도록
  final int foodPrice; //총 금액

  FoodInfoModel({
    required this.foodCategory,
    required this.foodName,
    required this.foodWeight,
    required this.foodPrice,
  });
}

class FoodModelList {
  static List ListCategory = [];
  static List ListName = [];
  static List ListWeight = []; //무게 입력 및 계산 확인 또는 배경화면을 누르면 계산을 하도록
  static List ListPrice = [];
  static List inputList = [];
  static List totalLIst = [];
  static List saveList = [];
  static double subPrice = 0; //삭제된 값을 위한 변수
  static double lastPrice = 0; //총 금액에 비춰지는 값
}

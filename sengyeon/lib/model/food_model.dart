class FoodModel {
  static String foodCategory = '';
  static String foodName = '';
  static double foodWeight = 0; //무게 입력 및 계산 확인 또는 배경화면을 누르면 계산을 하도록
  static double foodPrice = 0; //총 금액
}

class FoodInfoModel {
  final String foodCategory;
  final String foodName;
  final double foodWeight; //무게 입력 및 계산 확인 또는 배경화면을 누르면 계산을 하도록
  final double foodPrice; //총 금액

  FoodInfoModel({
    required this.foodCategory,
    required this.foodName,
    required this.foodWeight,
    required this.foodPrice,
  });
}

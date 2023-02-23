class FoodListModel {
  final String name;
  final int price;
  final double weight;

  FoodListModel({
    required this.name,
    required this.price,
    required this.weight,
  });

  static String category = '식량작물';
  static String priceUnit = '';
}

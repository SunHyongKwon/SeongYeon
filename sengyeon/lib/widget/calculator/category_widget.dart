import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pj_test/model/food_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<String> categoryList;
  late List<String> foodnameList;
  late List<String> foodpriceList; //제품 가격을 가져 옴
  late List<String> foodweightList; //제품 무게를 가져 옴
  String selectedItem = 'Category'; //선택하기 전에 값들
  String foodnameItem = '제품 명';
  late double totalPrice; //선택한 제품들의 총 가격
  late String weightinput; //무게 입력 Textfield
  String priceUnit = 'g'; //제품 무게의 단위
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // foodnameList = [];
    weightinput = ""; //무게 입력 TextFeild
    foodpriceList = [];
    foodweightList = [];
    totalPrice = 0;
    categoryList = [];
    foodnameList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: const Color(0xffFFB973),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: StreamBuilder(
          stream: firestore.collection('food').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data!.docs;
            callingList(documents); // Dropdown에 들어갈 list값을 넣어주기위한 함수
            return Container(
              child: ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      items: categoryList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          key: UniqueKey(),
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value!; //선택하고 값을 바꿔줌
                          FoodModel.foodCategory = selectedItem;
                          foodnameItem = '제품명';
                          selectcategory();
                        });
                      },
                      hint: Text(selectedItem),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      items: foodnameList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item.length > 9
                                ? item.substring(0, 9) + '...'
                                : item,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          foodnameItem = value!;
                          selectproduct();
                        });
                      },
                      hint: Text(
                        foodnameItem.length > 9
                            ? foodnameItem.substring(0, 9) + '...'
                            : foodnameItem,
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                    ),
                    const SizedBox(width: 20),
                    Text(FoodModel.inputWeight.toString()),
                    Column(
                      children: [
                        Text('\t ' + priceUnit),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        ),
      ),
    );
  }

//-------------------function-------------------------

  callingList(List<QueryDocumentSnapshot> doc) {
    //category를 가져오기 위한 함수
    categoryList = [];
    for (var doc in doc) {
      final foodinfo = FoodInfoModel(
        foodCategory: doc['category'],
        foodName: doc['name'],
        foodWeight: doc['weight'].toDouble(),
        foodPrice: doc['price'],
      );
      if (!categoryList.contains(foodinfo.foodCategory)) {
        categoryList.add(foodinfo.foodCategory);
      }
    }
  }

  selectcategory() {
    //클릭하고 나서 동작이 다시 되어야 하기 때문에 setState줘야함.
    FirebaseFirestore.instance
        .collection('food')
        .where('category', isEqualTo: selectedItem)
        .get()
        .then((querySnapshot) {
      setState(() {
        foodnameList = [];
        querySnapshot.docs.forEach((doc) {
          foodnameList.add(doc['name']);
        });
      });
    });
  }

  selectproduct() {
    FirebaseFirestore.instance
        .collection('food')
        .where('category', isEqualTo: selectedItem)
        .where('name', isEqualTo: foodnameItem)
        .get()
        .then((querySnapshot) {
      setState(() {
        try {
          if (foodnameItem == '수박' ||
              foodnameItem == '오이/다다기계통' ||
              foodnameItem == '오이/취청' ||
              foodnameItem == '호박/애호박' ||
              foodnameItem == '오이/가시계통') {
            priceUnit = '개';
          } else {
            priceUnit = 'g';
          }
          querySnapshot.docs.forEach((doc) {
            //값 넘겨주기
            FoodModel.foodCategory = selectedItem;
            FoodModel.foodName = foodnameItem;
            FoodModel.foodPrice = doc['price'].toDouble();
            FoodModel.foodWeight = doc['weight'].toDouble();
          });
        } catch (e) {
          print('Error occurred: $e'); //에러 메시지 출력
        }
      });
    });
  }
} //End Line
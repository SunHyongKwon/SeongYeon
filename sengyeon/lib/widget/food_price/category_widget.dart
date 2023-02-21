import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import 'package:pj_test/model/food_model.dart';
import 'package:pj_test/service/foodservice.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<String> categoryList;
  String selectedItem = 'Category'; //선택하기 전에 값들
  late List<String> foodnameList;
  String foodnameItem = '제품 명';
  late String weightinput; //무게 입력 Textfield
  late List<String> foodpriceList; //제품 가격을 가져 옴
  late List<String> foodweightList; //제품 무게를 가져 옴
  late double totalPrice; //선택한 제품들의 총 가격
  String priceUnit = 'g'; //제품 무게의 단위
  // late double totalweightinput = double.parse(weightinput.text).toDouble();

  @override
  void initState() {
    super.initState();
    categoryList = [];
    getCategory(); //카테고리 입력 함수
    foodnameList = [];
    weightinput = ""; //무게 입력 TextFeild
    foodpriceList = [];
    foodweightList = [];
    totalPrice = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            items: categoryList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value!; //선택하고 값을 바꿔줌
                FoodModel.foodCategory = selectedItem;
                foodnameList.clear();
                foodnameItem = '제품명';
                // getCategory();
                getFoodList(); //제품명 가져오는 함수
              });
            },
            hint: Text(selectedItem),
            icon: const Icon(Icons.arrow_circle_down_sharp),
          ),
          const SizedBox(width: 20),
          DropdownButton<String>(
            items: foodnameList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item.length > 9 ? item.substring(0, 9) + '...' : item,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                foodnameItem = value!;
                getFoodList();
              });
            },
            hint: Text(
              foodnameItem.length > 9
                  ? foodnameItem.substring(0, 9) + '...'
                  : foodnameItem,
            ),
            icon: Icon(Icons.arrow_circle_down_sharp),
          ),
          const SizedBox(width: 20),
          Text(weightinput),
          Column(
            children: [
              Text('\t ' + priceUnit),
            ],
          ),
          // Row(
          //   children: [
          //     StreamBuilder<QuerySnapshot>(
          //       stream: FirebaseFirestore.instance
          //           .collection('students')
          //           .orderBy('code', descending: false)
          //           .snapshots(),
          //       builder: (context, snapshot) {
          //         if (!snapshot.hasData) {
          //           return const Center(child: CircularProgressIndicator());
          //         }
          //         final documents = snapshot.data!.docs;
          //         return ListView(
          //           children:
          //               documents.map((e) => _buildItemWidget(e)).toList(),
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

//-------------------function-------------------------

  getCategory() async {
    FoodService foodservice = FoodService();
    final result = await foodservice.getCategory();
    setState(() {
      categoryList.addAll(result.map((map) => map["foodCategory"].toString()));
      // FoodModel.foodCategory = categoryList;
    });
  }

  getFoodList() async {
    FoodService foodservice = FoodService();
    final getFoodFuture = await foodservice.getFoodlist(selectedItem);
    setState(() {
      foodnameList
          .addAll(getFoodFuture.map((map) => map["foodName"].toString()));
      FoodModel.foodName = foodnameItem;
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
      } catch (e) {
        print('null');
      }
    });
  }

  // Widget _buildItemWidget(DocumentSnapshot doc) {
  //   // final student = Student(
  //   //   code: doc['code'],
  //   //   name: doc['name'],
  //   //   dept: doc['dept'],
  //   //   phone: doc['phone'],
  //   // );
  //   return Dismissible(
  //     direction: DismissDirection.endToStart,
  //     background: Container(
  //       color: Colors.red,
  //       alignment: Alignment.centerRight,
  //       child: const Icon(Icons.delete_forever),
  //     ),
  //     key: ValueKey(doc),
  //     onDismissed: (direction) {
  //       FirebaseFirestore.instance.collection('students').doc(doc.id).delete();
  //     },
  //     child: Container(
  //       color: Colors.amberAccent,
  //       child: GestureDetector(
  //         onTap: () {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(
  //           //     builder: (context) => const Update(),
  //           //   ),
  //           // );
  //         },
  //         child: Card(
  //           child: ListTile(
  //             title: Text(
  //                 // '학번 : ${student.code} \n이름 : ${student.name} \n학과 : ${student.dept} \n전화번호 : ${student.phone}'
  //                 'hello'),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
} //End Line

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj_test/model/foodList.dart';

class FoodListView extends StatefulWidget {
  final Stream<String> stream;
  const FoodListView({super.key, required this.stream});

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  void initState() {
    super.initState();

    widget.stream.listen((value) {
      setState(() {
        FoodListModel.category = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: () async* {
          // yield* > 값을 변경할 때마다 위젯을 새롭게 구성해줌
          yield* FirebaseFirestore.instance
              .collection('food')
              .where('category', isEqualTo: FoodListModel.category)
              .snapshots();
        }(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data!.docs;
          return ListView(
            children: documents.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    var f = NumberFormat('###,###,###,###');
    final foodListModel = FoodListModel(
      name: doc['name'],
      price: doc['price'],
      weight: doc['weight'],
    );

    if (foodListModel.name == '수박' ||
        foodListModel.name == '오이/다다기계통' ||
        foodListModel.name == '오이/취청' ||
        foodListModel.name == '호박/애호박' ||
        foodListModel.name == '오이/가시계통') {
      FoodListModel.priceUnit = '개';
    } else {
      FoodListModel.priceUnit = 'kg';
    }
    return Card(
      // margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundColor: FoodListModel.category == '식량작물'
                          ? const Color.fromARGB(255, 250, 187, 187)
                          : FoodListModel.category == '채소류'
                              ? const Color.fromARGB(255, 122, 226, 140)
                              : FoodListModel.category == '특용작물'
                                  ? const Color.fromARGB(255, 168, 98, 37)
                                  : FoodListModel.category == '과일류'
                                      ? const Color.fromARGB(255, 221, 237, 4)
                                      : const Color.fromARGB(
                                          255, 106, 192, 228),
                      child: Text(
                        FoodListModel.category,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    foodListModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    '${f.format(foodListModel.price)}원',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    foodListModel.weight.toString() + FoodListModel.priceUnit,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

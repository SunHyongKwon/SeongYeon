import 'package:flutter/material.dart';
import 'package:pj_test/model/food_model.dart';

class CalculatorList extends StatefulWidget {
  const CalculatorList({
    Key? key,
    required this.listUpdate,
    required this.lastPrice,
  }) : super(key: key); //값이 실시간으로 전달 될 수 있도록 선언

  final void Function() listUpdate; //값이 실시간으로 전달 될 수 있도록 선언
  // final double listUpdate;
  final double lastPrice;
  @override
  State<CalculatorList> createState() => _CalculatorListState();

  void updateCalculatorWidget({required double lastPrice}) {}
}

class _CalculatorListState extends State<CalculatorList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Center(
        child: FoodModelList.ListCategory.isEmpty
            ? const Text('')
            : ListView.builder(
                itemCount: FoodModelList.ListCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Color(0xffFFB973),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('제품 종류 : '),
                                    Text(FoodModelList.ListCategory[index])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('제품 이름 : '),
                                    Text(FoodModelList.ListName[index])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('입력한 무게 : '),
                                    Text(FoodModelList.inputList[index]
                                        .toString())
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('가격 : '),
                                    Text(FoodModelList.saveList[index]
                                        .toString())
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         // 삭제 버튼 클릭 시 구현할 기능
                          //         setState(() {
                          //           FoodModelList.subPrice =
                          //               FoodModelList.saveList[index]; //빼줄 값
                          //           FoodModelList.ListCategory.removeAt(index);
                          //           FoodModelList.ListName.removeAt(index);
                          //           FoodModelList.inputList.removeAt(index);
                          //           FoodModelList.saveList.removeAt(index);
                          //           FoodModelList.ListPrice.removeAt(
                          //               0); //항상 처음에 있는 값을 지움.
                          //           widget
                          //               .listUpdate(); //눌렀을 때, 값이 변경 되면 됨. 값 정상적으로 들어감
                          //           widget.lastPrice;

                          //           widget.updateCalculatorWidget(
                          //               lastPrice: widget.lastPrice);
                          //           CalculatorWidget;
                          //         });
                          //       },
                          //       icon: Icon(Icons.delete),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

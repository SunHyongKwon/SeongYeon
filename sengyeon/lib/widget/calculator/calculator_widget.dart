import 'package:flutter/material.dart';
import 'package:pj_test/model/food_model.dart';
import 'package:pj_test/widget/calculator/calculator_list.dart';
import 'package:pj_test/widget/calculator/category_widget.dart';
import 'package:pj_test/widget/calculator/nomalcalculator_widget.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({
    Key? key,
    required this.listUpdate,
    required this.lastPrice,
  }) : super(key: key); //값이 실시간으로 전달 될 수 있도록 선언
  final void Function() listUpdate; //값이 실시간으로 전달 될 수 있도록 선언
  final double lastPrice;

  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String output = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;
  List<double> result = [];
  FoodModel foodhandler = FoodModel(); //FoodModel 값을 전달하기위한 선언
  late double totalprice;
  late List<String> foodprice;
  late String testprice;
  late String buttonText;
  late double lastPrice;
  late List<double> viewPrice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result.add(0); //list 첫번째 인덱스 값 0으로 넣어주기
    // FoodModelList.ListPrice.add(0); //list 첫번째 인덱스 값 0으로 넣어주기
    totalprice = 0;
    foodprice = [];
    testprice = '';
    buttonText = '';
    lastPrice = 0;
    viewPrice = [];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //사이를 벌려줌.
            children: [
              Column(
                children: const [
                  Text(
                    "총 금액 : ",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    // "${widget.lastPrice.toStringAsFixed(2)}",
                    "${FoodModelList.lastPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize:
                          (FoodModelList.lastPrice.toStringAsFixed(2).length) >
                                  15
                              ? 15.0
                              : 30.0, //15글자 이상으로 되면 폰트사이즈를 수정해주겠다.
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CategoryWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton("7", Colors.grey),
            _buildButton("8", Colors.grey),
            _buildButton("9", Colors.grey),
            _buildButton("C", Colors.orange),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton("4", Colors.grey),
            _buildButton("5", Colors.grey),
            _buildButton("6", Colors.grey),
            _buildButton("R", Colors.orange),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton("1", Colors.grey),
            _buildButton("2", Colors.grey),
            _buildButton("3", Colors.grey),
            _buildButton("+/-", Colors.orange),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
                "<-",
                Colors
                    .grey), //한글자 지우기로 변경하기 제품입력완료같은 버튼만들기 그리고 밑에 해당되는 제품 가격 리스트로 뽑아주기
            _buildButton("0", Colors.grey),
            _buildButton(".", Colors.grey),
            _buildButton("+", Colors.orange),
            //밑에 계산 list를 만들어서 토글처럼 숨기는 기능 추가해서 제품가격입력 삭제가능하도록 해보기
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
//
              },
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Normal()),
                );
              },
              icon: Icon(Icons.calculate),
              style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.fromLTRB(0, 0, 0, 0), // label의 padding을 0으로 설정
                backgroundColor: Color(0xffFFB973),
              ),
              label: SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CalculatorList(
                //계산되었던 내역들 뽑아주는 구간
                listUpdate: () {
                  setState(() {
                    FoodModelList();
                    // FoodModelList.lastPrice;
                  });
                },
                lastPrice: FoodModelList.lastPrice,
              ),
            ),
          ],
        ),
      ],
    );
  }

// widget function
  _buildButton(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            buttonText = text;
            num1 = FoodModel.inputWeight; //전역변수느낌으로 값을 주면 되지 않을까?
            if (buttonText == "C") {
              output = "0";
              operand = "";
              num1 = 0.0;
              num2 = 0.0;
              result = [0];
              FoodModel.totalPrice = double.parse(output);
              FoodModel.inputWeight = double.parse(output);
              FoodModelList.ListPrice = []; //값들 초기화
              FoodModelList.ListCategory = []; //값들 초기화
              FoodModelList.ListName = []; //값들 초기화
              FoodModelList.inputList = []; //값들 초기화
              FoodModelList.saveList = [];
              FoodModelList.subPrice = 0;
              widget.listUpdate();
              lastPrice = 0;
              FoodModelList.lastPrice = lastPrice;
              //result의 값을 FoodModel.inputWeight에 넘겨주고, 이 값을 받은 함수가 결과값을 넘겨줄 수 있도록
            } else if ("R".contains(buttonText)) {
              output = "0";
              FoodModel.inputWeight = 0;
            } else if (["+"].contains(buttonText)) {
              // num1을 넣어준다.
              FoodModel.inputWeight = num1;
              if (num1 == 0 || FoodModel.inputWeight == 0 || output == "0") {
                //입력 값이 없으면 더하기 빼기를 실행하지 못하도록
                return;
              } else {
                getFoodpricecalc(); //num1값을 넣어주기 완료 후 num2값을 받아서 계산하는 걸로
                operand = buttonText;
                if (FoodModelList.ListPrice.length <= 1) {
                  lastPrice = double.parse(FoodModelList.ListPrice.last);
                  FoodModelList.lastPrice = lastPrice;
                  FoodModelList.saveList.add(lastPrice); //변환되기전 값을 넣어준다.
                  num1 = 0;
                  FoodModel.inputWeight = 0;
                  output = "0";
                  return; //값이 하나 이하면 그냥 다음으로 넘어갈게
                } else {
                  double value = double.parse(output); //변화를 주는 변수
                  FoodModel.inputWeight = value;
                  // Viewpage에서 보여질 리스트 하나
                  // 따로 값을 저장해야한다 viewPrice이값을 따로 저장하는 model을 만들어서 list넘겨주자
                  if (operand == "+") {
                    FoodModelList.saveList.add(double.parse(
                        FoodModelList.ListPrice.last)); //변환되기전 값을 넣어준다.
                    FoodModel.inputWeight = value;
                    if (FoodModelList
                            .ListPrice[FoodModelList.ListPrice.length - 2]
                        is String) {
                      lastPrice = (double.parse(FoodModelList
                              .ListPrice[FoodModelList.ListPrice.length - 2]) +
                          double.parse(FoodModelList.ListPrice.last));
                      FoodModelList.lastPrice = lastPrice;
                    } else {
                      lastPrice = (FoodModelList
                              .ListPrice[FoodModelList.ListPrice.length - 2] +
                          double.parse(FoodModelList.ListPrice.last));
                      FoodModelList.lastPrice = lastPrice;
                    }
                    if (FoodModelList.subPrice != 0) {
                      //뺄값이 있을 경우
                      lastPrice = lastPrice - FoodModelList.subPrice;
                      FoodModelList.lastPrice = lastPrice;
                      FoodModelList.subPrice = 0;
                    } else {
                      //
                    }
                    FoodModelList.ListPrice.last =
                        lastPrice; //뺄셈을 해주고나서 뺀 값을 초기화해야함
                  }
                }
              }
              num1 = 0;
              FoodModel.inputWeight = 0;
              output = "0";
            } else if (buttonText == "<-") {
              if (output.length <= 1) {
                output = "0";
                FoodModel.inputWeight = double.parse(output);
                return;
              } else {
                output = output.substring(
                    0, output.length - 1); //글자의 크기를 줄여쿨력수를 줄이는 방식
                FoodModel.inputWeight = double.parse(output);
              }
              // num1 = double.parse(output);
            } else if (buttonText == ".") {
              if (output.contains(".")) {
                FoodModel.inputWeight = double.parse(output);
                return;
              } else {
                output += buttonText;
                FoodModel.inputWeight = double.parse(output);
              }
            } else if (buttonText == "+/-") {
              double value = double.parse(output);
              output = (-value).toString(); // 클릭할 때마다 부호 교정
              FoodModel.inputWeight = double.parse(output);
            } else {
              //숫자들을 입력할 때만 발생하는 구간
              if (output == "0") {
                output = "";
              }
              output += buttonText;
              FoodModel.inputWeight = double.parse(output);
              //num1값이 완전하게 입력이 모두 입력이되고 나서 값을 넘겨준다.
            }
          });
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(22),
          shape: const CircleBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

// total price 구하기 위한 함수
  getFoodpricecalc() async {
    setState(() {
      try {
        if (FoodModel.foodName == '수박' ||
            FoodModel.foodName == '오이/다다기계통' ||
            FoodModel.foodName == '오이/취청' ||
            FoodModel.foodName == '호박/애호박' ||
            FoodModel.foodName == '오이/가시계통') {
          FoodModel.totalPrice = (FoodModel.foodPrice /
              ((FoodModel.foodWeight) /
                  (FoodModel.inputWeight))); // 1개당 가격정보 나옴
          // passFoodList(); //총금액에 비춰지는 값들을 넘겨줌
        } else {
          FoodModel.totalPrice = (FoodModel.foodPrice /
              ((FoodModel.foodWeight * 1000) /
                  (FoodModel.inputWeight))); // 1g당 가격정보 나옴
        }
        FoodModelList.ListCategory.add(FoodModel.foodCategory);
        FoodModelList.ListName.add(FoodModel.foodName);
        FoodModelList.ListPrice.add(FoodModel.totalPrice.toStringAsFixed(2));
        FoodModelList.inputList.add(FoodModel.inputWeight);
        widget.listUpdate();
      } catch (e) {
        print('null');
      }
    });
  }
}

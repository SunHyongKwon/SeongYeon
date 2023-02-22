import 'package:flutter/material.dart';
import 'package:pj_test/model/food_model.dart';
import 'package:pj_test/service/foodservice.dart';
import 'package:pj_test/widget/food_price/category_widget.dart';

void main() => runApp(CalculatorWidgetApp());

class CalculatorWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result.add(0); //list 첫번째 인덱스 값 0으로 넣어주기
    totalprice = 0;
    foodprice = [];
    testprice = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xffFFB973),
        title: const Text(
          '농수산물 무게별 가격 확인',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView(
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
                      "$output",
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CategoryWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("C", Colors.grey),
              SizedBox(
                height: 90,
                child: Center(
                  child: _buildButton("+/-", Colors.grey),
                ),
              ),
              _buildButton("%", Colors.grey),
              _buildButton("÷", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("7", Colors.grey),
              _buildButton("8", Colors.grey),
              _buildButton("9", Colors.grey),
              _buildButton("×", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("4", Colors.grey),
              _buildButton("5", Colors.grey),
              _buildButton("6", Colors.grey),
              _buildButton("-", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("1", Colors.grey),
              _buildButton("2", Colors.grey),
              _buildButton("3", Colors.grey),
              _buildButton("+", Colors.orange),
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
              _buildButton("=", Colors.orange),
              //밑에 계산 list를 만들어서 토글처럼 숨기는 기능 추가해서 제품가격입력 삭제가능하도록 해보기
            ],
          ),
//           Row(
//             children: [
// //
//             ],
//           ),
        ],
      ),
    );
  }

// widget function
  _buildButton(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            String buttonText = text;
            if (buttonText == "C") {
              output = "0";
              operand = "";
              num1 = 0.0;
              num2 = 0.0;
              result = [0];
            } else if (["+", "-", "×", "÷", "%"].contains(buttonText)) {
              //사직연산 및 %(나머지) 버튼을 눌렀을 경우
              double value = double.parse(output);
              if (operand == "+") {
                //버튼들을 눌렀을 경우 작동되는 동작들 마지막값을 받아서 변동되는 흐름
                value = result.last + value;
              } else if (operand == "-") {
                value = result.last - value;
              } else if (operand == "×") {
                value = result.last * value;
              } else if (operand == "÷") {
                value = result.last / value;
              } else if (operand == "%") {
                value = (result.last * value) / 100;
              }
              result[result.length - 1] = value;
              operand = buttonText;
              output = "0";
            } else if (buttonText == "<-") {
              if (output.length <= 0) {
                return;
              } else {
                output = output.substring(
                    0, output.length - 1); //글자의 크기를 줄여쿨력수를 줄이는 방식
              }
            } else if (buttonText == ".") {
              if (output.contains(".")) {
                return;
              } else {
                output += buttonText;
              }
            } else if (buttonText == "=") {
              num2 = double.parse(output); //두번째 받은 값과 이전에 받은 마지막 값을 더하는 흐름
              double value = 0.0;
              if (operand == "+") {
                value = result.last + num2;
              } else if (operand == "-") {
                value = result.last - num2;
              } else if (operand == "×") {
                value = result.last * num2;
              } else if (operand == "÷") {
                value = result.last / num2;
              } else if (operand == "%") {
                value = (result.last * num2) / 100;
              }
              getFoodpricecalc(); //------------------------------------
              result.add(value);
              output = value.toString();
              operand = "";
            } else if (buttonText == "+/-") {
              double value = double.parse(output);
              output = (-value).toString(); // 클릭할 때마다 부호 교정
            } else {
              if (output == "0") {
                output = "";
              }
              output += buttonText;
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
          style: const TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      ),
    );
  }

// total price 구하기 위한 함수
  getFoodpricecalc() async {
    FoodService foodservice = FoodService();
    final result = await foodservice.getFoodprice(
        FoodModel.foodName, FoodModel.foodCategory);
    String foodnameItem = FoodModel.foodName;
    // print(result);
    foodprice.addAll(result.map((map) => map["foodPrice"].toString()));

    final String resultStr =
        result.map((map) => map["foodPrice"].toString()).join();
    print(resultStr);

    setState(() {
      try {
        if (foodnameItem == '수박' ||
            foodnameItem == '오이/다다기계통' ||
            foodnameItem == '오이/취청' ||
            foodnameItem == '호박/애호박' ||
            foodnameItem == '오이/가시계통') {
          // totalprice = (totalprice_list /
          //     ((totalweight_list) / (totalweightinput))); // 1개당 가격정보 나옴
        } else {
          // totalprice = (totalprice_list /
          //     ((totalweight_list * 1000) / (totalweightinput))); // 1g당 가격정보 나옴
        }
      } catch (e) {
        print('null');
      }
    });
  }
}

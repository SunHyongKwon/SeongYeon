import 'package:flutter/material.dart';
import 'package:pj_test/view_model/feature_view_model.dart';

class InputViewThree extends StatefulWidget {
  const InputViewThree({super.key});

  @override
  State<InputViewThree> createState() => _InputViewThreeState();
}

class _InputViewThreeState extends State<InputViewThree> {
  late TextEditingController workerController;
  late TextEditingController teenController;

  @override
  void initState() {
    super.initState();

    workerController = TextEditingController();
    teenController = TextEditingController();

    workerController.text = Feature.worker.toString();
    teenController.text = Feature.teen.toString();

    workerController.text =
        Feature.worker == 0 ? "" : Feature.worker.toString();
    teenController.text = Feature.teen == 0 ? "" : Feature.teen.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '직장인구 수 입력하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Divider(
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  '현재 지원되는 예측 모델은 관악구만 해당 됩니다.\n추후 업데이트를 통해 다른 구의 매출 예측을 지원한 예정입니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  '총 직장 인구 수',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    controller: workerController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color:
                          Feature.worker == 0 ? Colors.black26 : Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != "") {
                        Feature.worker = int.parse(value);
                      } else {
                        Feature.worker = 0;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '10대 직장 인구 수',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    controller: teenController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color:
                          Feature.teen == 0 ? Colors.black26 : Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != "") {
                        Feature.teen = int.parse(value);
                      } else {
                        Feature.teen = 0;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pj_test/view_model/feature_view_model.dart';
import 'package:pj_test/view_model/predict_view_model.dart';

class InputViewOne extends StatefulWidget {
  const InputViewOne({super.key});

  @override
  State<InputViewOne> createState() => _InputViewOneState();
}

class _InputViewOneState extends State<InputViewOne> {
  @override
  void initState() {
    super.initState();
    if (Feature.dong == "") {
      Feature.dong = "신원동";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                '동 선택하기',
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
                height: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.6,
                child: CupertinoPicker.builder(
                  childCount: PredcitVm.dongList.length,
                  itemExtent: 50,
                  scrollController: FixedExtentScrollController(
                    initialItem: PredcitVm.dongList.indexOf(Feature.dong),
                  ),
                  onSelectedItemChanged: (value) {
                    Feature.dong = PredcitVm.dongList[value];
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(PredcitVm.dongList[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

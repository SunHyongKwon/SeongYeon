import 'package:flutter/material.dart';
import 'package:pj_test/view_model/feature_view_model.dart';

class InputViewTwo extends StatefulWidget {
  const InputViewTwo({super.key});

  @override
  State<InputViewTwo> createState() => _InputViewTwoState();
}

class _InputViewTwoState extends State<InputViewTwo> {
  late TextEditingController shopController;
  late TextEditingController openShopController;
  late TextEditingController franchiseShopController;

  @override
  void initState() {
    super.initState();

    shopController = TextEditingController();
    openShopController = TextEditingController();
    franchiseShopController = TextEditingController();

    shopController.text = Feature.shop == 0 ? "" : Feature.shop.toString();
    openShopController.text =
        Feature.openShop == 0 ? "" : Feature.openShop.toString();
    franchiseShopController.text =
        Feature.franchiseShop == 0 ? "" : Feature.franchiseShop.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                  '점포 수 입력하기',
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
                  height: 30,
                ),
                const Text(
                  '점포 수',
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
                    controller: shopController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color:
                          Feature.shop == 0 ? Colors.black26 : Colors.black87,
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
                        Feature.shop = int.parse(value);
                      } else {
                        Feature.shop = 0;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '개업 점포 수',
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
                    controller: openShopController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Feature.openShop == 0
                          ? Colors.black26
                          : Colors.black87,
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
                        Feature.openShop = int.parse(value);
                      } else {
                        Feature.openShop = 0;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '프랜차이즈 점포 수',
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
                    controller: franchiseShopController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Feature.franchiseShop == 0
                          ? Colors.black26
                          : Colors.black87,
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
                        Feature.franchiseShop = int.parse(value);
                      } else {
                        Feature.franchiseShop = 0;
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
  } // build

}

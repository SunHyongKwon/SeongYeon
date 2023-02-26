import 'package:flutter/src/widgets/framework.dart';
import 'package:python_project/widget/food_info_list_widget.dart';

class Foodinfolist extends StatefulWidget {
  const Foodinfolist({super.key});

  @override
  State<Foodinfolist> createState() => _FoodinfolistState();
}

class _FoodinfolistState extends State<Foodinfolist> {
  @override
  Widget build(BuildContext context) {
    return Foodinfowidget();
  }
}

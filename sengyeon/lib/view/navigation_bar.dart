import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/view/calendar_page.dart';
import 'package:pj_test/view/food_list.dart';
import 'package:pj_test/view/web_view.dart';
import 'package:pj_test/view/predict.dart';
import 'home.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  StreamController<int> controller = StreamController();

  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      // 페이지 수정할 부분
      Home(controller: controller),
      const WebViewPage(),
      const PredictSimul(),
      const FoodList(),
      const CalendarPage(),
    ];
    controller.stream.listen((event) {
      setState(() {
        _selectedIndex = event;
      });
    });
  }

  // 아이콘이 클릭되었을 때의 이벤트 리스너
  // 클릭된 인덱스로 _selectedIndex에 할당하고 build 함수를 호출한다(setState)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // 아이콘 이미지도 페이지에 맞춰서 수정해야함
          BottomNavigationBarItem(
              // 현재 아이콘이 선택된 아이콘일때와 선택된 아이콘이 아닌 경우 Icon을 다르게 하기 위함
              icon: _selectedIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    )
                  : const Icon(Icons.home_outlined,
                      color: Color.fromARGB(255, 255, 148, 33)),
              label: 'home'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(
                      Icons.map,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    )
                  : const Icon(
                      Icons.map_outlined,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    ),
              label: 'map'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(
                      Icons.money,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    )
                  : const Icon(
                      Icons.money_outlined,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    ),
              label: 'map'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? const Icon(
                      Icons.shopping_bag,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    )
                  : const Icon(Icons.shopping_bag_outlined,
                      color: Color.fromARGB(255, 255, 148, 33)),
              label: 'media'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? const Icon(
                      Icons.calendar_month,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    )
                  : const Icon(
                      Icons.calendar_month_outlined,
                      color: const Color.fromARGB(255, 255, 148, 33),
                    ),
              label: 'shop'),
        ],
        backgroundColor: null,
        onTap: _onItemTapped,
        showSelectedLabels: false, // label 숨기기
        showUnselectedLabels: false, // label 숨기기
        type: BottomNavigationBarType.fixed, //(2)
      ),
    );
  }
}

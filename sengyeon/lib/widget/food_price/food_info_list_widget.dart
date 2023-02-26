import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:pj_test/view_model/loading_impect.dart';

class Foodinfowidget extends StatefulWidget {
  const Foodinfowidget({super.key});

  @override
  State<Foodinfowidget> createState() => _FoodinfowidgetState();
}

class _FoodinfowidgetState extends State<Foodinfowidget> {
  late List dataList; //data가 들어올 때까지 기다림.
  // late String search;
  late ScrollController scrollController; // paging을 위한 스크롤 컨트롤러
  late int page; //paging을 위한 page 수 설정
  late int lastIndex, start, end; //페이징 범위를 전역변수로 선언
  late LoadingHud _hub; //Loading 창 띄우기
  late TextEditingController searchSelect; //검색 SQL문 사용하기
  late String search;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    page = 1; //page초기값은 1
    _hub = LoadingHud(context);
    searchSelect = TextEditingController();
    search = '';
    scrollController.addListener(
      () {
        //리스트의 마지막일 경우
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          if (lastIndex <= end) {
            //end값이 lastIndex보다 값이 커지면 아무 행동도 안하겠다.
          } else {
            page++; //page를 추가해주고 이에 해당되는 데이터들을 불러오겠다.
            getJsonData();
            _hub.showHud(); //로딩창을 띄우겠다.
            Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
              _hub.hideHud(); //로딩창을 딜레이주고 나서 닫아주겠다.
            });
          }
        }
      },
    );
    dataList = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffFFB973),
          title: TextField(
            controller: searchSelect,
            decoration: const InputDecoration(labelText: '농수산물 전체 가격 정보'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              setState(() {
                dataList.clear();
                page = 1;
                search = searchSelect.text;
                searchData();
              });
            },
          )),
      body: Center(
          child: dataList.isEmpty
              ? const Text('데이터가 없습니다.')
              : ListView.builder(
                  controller: scrollController,
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        child: Column(children: [
                          Row(
                            children: [
                              const Text('제품 명 : '),
                              Text(dataList[index]['foodName'])
                            ],
                          ),
                          Row(
                            children: [
                              const Text('무게, 갯수 : '),
                              Text(dataList[index]['foodWeight'].toString())
                            ],
                          ),
                          Row(
                            children: [
                              const Text('가격 : '),
                              Text(dataList[index]['foodPrice'])
                            ],
                          ),
                          Row(
                            children: [
                              const Text('기준 날짜 : '),
                              Text(dataList[index]['foodDate'].toString())
                            ],
                          ),
                          Row(
                            children: [
                              const Text('카테고리 : '),
                              Text(dataList[index]['foodCategory'])
                            ],
                          ),
                        ]),
                      ),
                    );
                  },
                )),
    );
  }

//--------------------------Function------------------------------
  //2023.02.12 송명철, 리스트 조회 및 페이징 완료
  Future<bool> getJsonData() async {
    var url =
        Uri.parse('http://10.0.2.2:8080/flutter/price_select_flutter.jsp');
    //Android는 localhost 대신 10.0.2.2를 사용
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    lastIndex = result.length;
    List sortedList = [];

    start = (page - 1) * 20;
    end = page * 20;
    if (lastIndex <= end) {
      sortedList.add(result.sublist(start, lastIndex)); //마지막 값이
      //최대 크기 보다 커지면 최대크기로 마지막 값 자리에 값을 넣어준다.
    } else {
      sortedList.add(result.sublist(start, end));
    }
    setState(() {
      dataList.addAll(sortedList[0]); //배열의 0번째를 가져와야 꺼내져 나옴
    });
    return true;
  }

  Future<bool> searchData() async {
    var url = Uri.parse(
        'http://10.0.2.2:8080/flutter/price_select_Like_flutter.jsp?searchTerm=$search');
    //Android는 localhost 대신 10.0.2.2를 사용
    var response = await http.get(url);
    print(response);
    print(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    print(result);
    lastIndex = result.length;
    List sortedList = [];

    start = (page - 1) * 20;
    end = page * 20;
    if (lastIndex <= end) {
      sortedList.add(result.sublist(start, lastIndex)); //마지막 값이
      //최대 크기 보다 커지면 최대크기로 마지막 값 자리에 값을 넣어준다.
    } else {
      sortedList.add(result.sublist(start, end));
    }
    print(sortedList);
    setState(() {
      dataList.addAll(sortedList[0]); //배열의 0번째를 가져와야 꺼내져 나옴
    });
    return true;
  }
}

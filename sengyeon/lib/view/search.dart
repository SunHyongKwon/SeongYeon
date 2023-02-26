import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj_test/widget/search/listview.dart';
import 'package:pj_test/widget/search/search_text_field.dart';
import 'package:pj_test/widget/search/top_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  StreamController<List> controller = StreamController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(child: TopButton(controller: controller)),
              SizedBox(child: SearchTextField(controller: controller)),
              Expanded(child: SearchListView(stream: controller.stream)),
            ],
          ),
        ),
      ),
    );
  }
}

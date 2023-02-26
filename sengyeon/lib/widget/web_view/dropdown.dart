// import 'package:flutter/material.dart';
// import 'package:pj_test/view_model/web_view.dart';

// // 2023.02.17 create
// // lib/view/web_view.dart에서 사용하는 AppBar에 사용할 DropDown Widget 페이지 입니다.

// class DropDown extends StatefulWidget {
//   const DropDown({super.key});

//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   WebViewModel viewmodel = WebViewModel();

//   String dropdownValue = '성별';
//   List<String> items = ['성별', '연령대별', '시간대별', '요일별'];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       items: items.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       style: const TextStyle(color: Colors.black, fontSize: 16),
//       onChanged: (value) {
//         setState(() {
//           viewmodel.loadMap(value);
//         });
//       },
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return DropdownButton(
//   //     items: WebViewModel.items.map<DropdownMenuItem<String>>((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //     style: const TextStyle(color: Colors.black, fontSize: 16),
//   //     onChanged: (value) {
//   //       setState(() {
//   //         viewmodel.loadMap(value);
//   //       });
//   //     },
//   //   );
//   // }
// } // AppBar Page


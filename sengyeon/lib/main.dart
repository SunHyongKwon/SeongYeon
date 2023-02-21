import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pj_test/view/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding();
  await initializeDateFormatting();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xffFFB973);

  static MaterialColor primaryColorSwatch = MaterialColor(
    primaryColor.value,
    const <int, Color>{
      50: Color(0xffFFB973),
      100: Color(0xffFFB973),
      200: Color(0xffFFB973),
      300: Color(0xffFFB973),
      400: Color(0xffFFB973),
      500: Color(0xffFFB973),
      600: Color(0xffFFB973),
      700: Color(0xffFFB973),
      800: Color(0xffFFB973),
      900: Color(0xffFFB973),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: primaryColorSwatch,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigationBarPage(),
      },
    );
  }
}

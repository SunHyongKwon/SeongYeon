import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
<<<<<<< HEAD
import 'package:pj_test/view/loading_%20screen.dart';

void main() async {
  WidgetsFlutterBinding();
  await initializeDateFormatting();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
import 'package:pj_test/firebase_options.dart';
import 'package:pj_test/view/navigation_bar.dart';

void main() async {
  // WidgetsFlutterBinding();
  // await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  // await Firebase.initializeApp();
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
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
<<<<<<< HEAD
        '/': (context) => const LoadingScreen(),
=======
        '/': (context) => const NavigationBarPage(),
>>>>>>> f5e2574c158a68d3fdd1de79f861ea83ed056aaa
      },
    );
  }
}

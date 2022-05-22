import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fortuneteller/consts.dart';
import 'package:fortuneteller/pages/main_page/main_page.dart';
import 'package:fortuneteller/pages/navbar_pages/profilepage/create_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Color(TEXT_COLOR),
          displayColor: Color(TEXT_COLOR),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/createProfile': (context) => CreateProfilePage(),
      },
    );
  }
}

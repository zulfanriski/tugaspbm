import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 13, 183, 78),
          background: Color.fromARGB(255, 13, 93, 24),
          surface: Color.fromARGB(255, 78, 54, 56)
        )
      ),
      initialRoute: "/register",
      routes: {
        "/register": (context) => RegisterPage(),
        "/login":(context) => LoginPage(username: username, password: password,),
        "/home":(context) => HomePage(username: username,)
      },
    );
  }
}

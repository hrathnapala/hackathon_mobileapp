import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/auth/Login.dart';
import 'package:hackathon_app/screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-Sentinel',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

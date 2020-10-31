import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/Profile.dart';
import 'package:hackathon_app/screens/SplashScreen.dart';
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
      home: SplashScreen(),
    );
  }
}

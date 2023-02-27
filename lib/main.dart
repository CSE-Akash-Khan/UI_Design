import 'package:flutter/material.dart';
import 'package:ui_design/screen/HomePage.dart';
import 'package:ui_design/screen/WineDetailsPage.dart';
import 'package:ui_design/screen/bottomNavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WineDetailsPage(),
      home: BottomNavBar(),
    );
  }
}


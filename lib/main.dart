import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ui_design/getx/HomePageGetX.dart';
import 'package:ui_design/jacket_shop/controller/CardController.dart';
import 'package:get/get.dart';


import 'jacket_shop/HomePageJacket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: 'jacket_shop/',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WineDetailsPage(),
      home: HomePageJacket(),
    );
  }
}


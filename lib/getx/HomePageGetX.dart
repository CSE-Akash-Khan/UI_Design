import 'package:flutter/material.dart';
import 'package:ui_design/getx/HomePageController.dart';
import 'package:get/get.dart';
class HomePageGetX extends StatelessWidget {
  HomePageGetX({Key? key}) : super(key: key);

  HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<HomePageController>(builder: (controller) {
              return Text(homePageController.value.toString(),style: TextStyle(fontSize: 20),);
            },),
            ElevatedButton(onPressed: () {
              homePageController.increaseValue();
            }, child: Text("Increase")),
            ElevatedButton(onPressed: () {
              homePageController.decreaseValue();
            }, child: Text("Increase")),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
class HomePageController extends GetxController{
  var value = 0;
  void increaseValue(){
    value++;
    update();
  }
  void decreaseValue(){
    value--;
    update();
  }

}
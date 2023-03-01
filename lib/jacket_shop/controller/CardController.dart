import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../JacketModel.dart';
class CardController extends GetxController{
  var jacketList = <JacketModel>[];

  var cardList = <JacketModel>[];

  var totalAmount = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadJacketData();
    cardList!.isNotEmpty?getTotal() :null;
  }

  Future<void> loadJacketData() async {
    var productJson = await rootBundle.loadString("assets/images/tutorial_product.json");
    var decodedData = jsonDecode(productJson);
    for(Map i in decodedData){
      jacketList.add(JacketModel.fromJson(i));
    }
    update();
  }



  void getTotal(){
    totalAmount = cardList!.map((item) => item.price!.toInt() * item.quantity)
        .reduce((value, element) => value + element);
  }

  void addToCard(int index){
    try{
      cardList.firstWhere((element) => element.id == jacketList[index].id);
      Get.snackbar("Already added in list", "try another one");
    }catch(e){
      cardList.add(jacketList[index]);
    }
    getTotal();
    update();
  }

  void decreaseItem(int index){
    if(cardList![index].quantity>1){
      cardList![index].quantity--;
    }
    else{
      // cardList!.removeAt(index);
      deleteItem(index);
    }
    getTotal();
    update();
  }

  void increaseItem(int index){
    cardList[index].quantity++;
    getTotal();
    update();
  }

  void deleteItem(int index){
    cardList!.removeAt(index);
    if(index != 0){
      getTotal();
    }
    else{
      totalAmount = 0;
    }
    update();
  }

  void clearAll(){
    cardList.clear();
    // getTotal();
    totalAmount = 0;
    update();
  }



}
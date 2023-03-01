import 'package:flutter/material.dart';
import 'package:ui_design/jacket_shop/HomePageJacket.dart';
import 'package:ui_design/jacket_shop/JacketModel.dart';
import 'package:ui_design/jacket_shop/controller/CardController.dart';
import 'package:ui_design/model/WineInfo.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardController cardController = Get.find();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            "My Cart",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  cardController.clearAll();
                },
                child: GetBuilder<CardController>(builder: (controller) {
                  return Text(
                    "Clear(${cardController.cardList!.length.toString()})",
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
                  );
                },)
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: GetBuilder<CardController>(builder: (controller) {
                return ListView.separated(
                  //todo: important concept
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: cardController.cardList!.length,
                  itemBuilder: (context, index) {
                    // var jacket = cardController.cardList![index];
                    return SizedBox(
                      height: 170,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(25)),
                                child: SizedBox(
                                  height: 170,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(cardController.cardList[index].image.toString()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    "Size: ${cardController.cardList[index].size}",
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                  Text(
                                    cardController.cardList[index].name.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Price: ${cardController.cardList[index].price! * cardController.cardList[index].quantity}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),

                                  const Spacer(),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cardController.decreaseItem(index);
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.orange,
                                          child: Icon(Icons.remove,color: Colors.black,),
                                        ),
                                      ),

                                      Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 13),
                                          child: Text(cardController.cardList[index].quantity.toString(), style: TextStyle(fontSize: 20),)
                                      ),

                                      InkWell(
                                        onTap: () {
                                          cardController.increaseItem(index);
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.orange,
                                          child: Icon(Icons.add,color: Colors.black,),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          cardController.deleteItem(index);
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.orange,
                                          child: Icon(Icons.delete,color: Colors.black,),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );}
                );
              },)
            ),
            Container(
              width: double.infinity,
              height: size.height * .07,
              color: Colors.orangeAccent,
              child: Center(child: GetBuilder<CardController>(builder: (controller) {
                return Text(
                  "Total Amount: ${cardController.totalAmount.toString()}",
                  style: const TextStyle(fontSize: 20),
                );
              },)),
            )
          ],
        ));
  }
}

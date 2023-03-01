import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design/jacket_shop/CardPage.dart';
import 'package:ui_design/jacket_shop/JacketModel.dart';
import 'package:ui_design/jacket_shop/controller/CardController.dart';
import 'package:get/get.dart';

class HomePageJacket extends StatefulWidget {
  const HomePageJacket({Key? key}) : super(key: key);

  @override
  State<HomePageJacket> createState() => HomePageJacketState();
}

class HomePageJacketState extends State<HomePageJacket> {
  // static var cardList = <JacketModel>[];
  CardController cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CardPage(),));
              Get.to(()=>CardPage());
            },
            label: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/cart.svg",color: Colors.red,),
                  const SizedBox(width: 10,),
                  const Text("Go To Card Page",style: TextStyle(fontSize: 20,color: Colors.black),),
                ],
              ),
            )
        ),

        backgroundColor: Colors.white,
        appBar: AppBar(

          actions: [

            InkWell(
              onTap: (){
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Badge(
                   padding: EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/images/add_to_cart.svg",color: Colors.black,)
                ),
              ),
            ),
          ],

          backgroundColor: Colors.white,
          title: Row(
            children: [
              GetBuilder<CardController>(builder: (controller) {
                return Text("Total Item: ${cardController.cardList.length}",style: TextStyle(color: Colors.black,fontSize: 20),);
              },),

              const SizedBox(width: 70,),
              const Text(
                "Jackets",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: cardController.jacketList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                    childAspectRatio:.67
                  ),
                  itemBuilder: (context, index) {
                    var jacketList = cardController.jacketList[index];
                    return Container(
                      color: Color(int.parse(jacketList.color.toString())).withOpacity(.3),
                      child: Column(
                        children: [
                          Container(
                            height: 210,
                              child: Image.asset(jacketList.image.toString())
                          ),
                          // SizedBox(height: 3,),
                          Text(jacketList.name.toString(),style: TextStyle(fontSize: 19),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price: "+jacketList.price.toString(),style: TextStyle(fontSize: 16)),
                                InkWell(
                                  onTap: () {
                                    cardController.addToCard(index);
                                  },
                                    child: SvgPicture.asset("assets/images/add_to_cart.svg",color: Colors.red,)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },),
            ),
          ],

        ));
  }
}

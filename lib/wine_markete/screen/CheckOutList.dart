import 'package:flutter/material.dart';
import 'package:ui_design/model/WineInfo.dart';

import 'SelectedList.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<int> qntyList = List.filled(WineInfo.wineInfoList().length, 1);
  @override
  Widget build(BuildContext context) {
    var wineList = WineInfo.wineInfoList();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  "Clear(2)",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
                ))
          ],
        ),
        body: ListView.separated( //todo: important concept
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
          itemCount: wineList.length,
          itemBuilder: (context, index) {
            var wine = wineList[index];
            var builderIndex = index;
            // return SelectedList(wine: wine);
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
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: SizedBox(
                          height: 170,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(wine.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 13,),
                            Text(wine.wineType,style: TextStyle(color: Colors.black54,fontSize: 16),),
                            Text(wine.title.replaceAll('\n', ' '),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(wine.price,style: TextStyle(fontWeight: FontWeight.bold),),
                            Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: Colors.grey.withOpacity(.5),
                                    onPressed: () {
                                      setState(() {
                                        if(qntyList[builderIndex] > 1){
                                          qntyList[builderIndex]--;
                                        }
                                      });
                                    },child: Icon(Icons.remove,color: Colors.black,),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 13),
                                  child: Text(qntyList[builderIndex].toString(),style: TextStyle(fontSize: 20),),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: Colors.grey.withOpacity(.5),
                                    onPressed: () {
                                      setState(() {
                                        qntyList[builderIndex]++;
                                      });
                                    },child: Icon(Icons.add,color: Colors.black,),),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: Colors.orange,
                                    onPressed: () {

                                    },child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}


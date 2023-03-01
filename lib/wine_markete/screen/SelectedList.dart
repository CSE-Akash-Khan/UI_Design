import 'package:flutter/material.dart';

import '../../model/WineInfo.dart';

class SelectedList extends StatelessWidget {
  SelectedList({
    super.key,
    required this.wine,
  });

  final WineInfo wine;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
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

                          },child: Icon(Icons.remove,color: Colors.black,),),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Text(quantity.toString(),style: TextStyle(fontSize: 20),),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.grey.withOpacity(.5),
                            onPressed: () {

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
  }
}

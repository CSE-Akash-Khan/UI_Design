import 'package:flutter/material.dart';

import '../CustomColor.dart';
import 'LastPart_wineDetails.dart';
class WineDetailsPage extends StatefulWidget {
  String image;
  String title;
  String wineType;
  int rating;

  WineDetailsPage(this.image, this.title, this.wineType,
      this.rating); // WineDetailsPage(this.image);
  @override
  State<WineDetailsPage> createState() => _WineDetailsPageState();
}

class _WineDetailsPageState extends State<WineDetailsPage> {

  var tagList = ['2016','2017','2018'];
  int selectedColor = 1;
  String titleStr = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleStr = widget.title.replaceAll("\n", " ");
    if(widget.title.substring(widget.title.length - 4) == "2016"){
      selectedColor = 0;
    }
    else if(widget.title.substring(widget.title.length - 4) == "2017"){
      selectedColor = 1;
    }
    else{
      selectedColor = 2;
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.bgColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.menu, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.shopping_basket, color: Colors.black),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 11),
                  height: size.height*.3,
                  child: Image.asset(widget.image),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            backgroundColor:selectedColor == index? Colors.yellow:Colors.white,
                            elevation: 0
                          ),
                          onPressed: () {
                            setState(() {
                              selectedColor = index;
                            });

                      }, child: Text(tagList[index],style: TextStyle(color: Colors.black),));
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 5,),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(titleStr.substring(0,titleStr.length - 5),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.wineType,style: TextStyle(color: Colors.black54,fontSize: 18)),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.black,size:20.0),
                                  Text("5.0")
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  LastPartWineDetails()
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}


// String str = 'Hello, world!';
//
// // extract the last 5 characters of the string
// String lastFiveCharacters = str.substring(str.length - 5);

// widget.title.substring(widget.title.length - 5)
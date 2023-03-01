import 'package:flutter/material.dart';

import 'package:ui_design/model/WineInfo.dart';

import '../CustomColor.dart';
import 'TopSection.dart';
import 'WineDetailsPage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final wineInfo = WineInfo.wineInfoList();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.bgColor,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Icon(Icons.list, color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.format_list_bulleted, color: Colors.black),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopSection(),
              SizedBox(
                height: 16,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: wineInfo.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  var wine = wineInfo[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WineDetailsPage(wine.image,
                                wine.title, wine.wineType, wine.rating),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(22)),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  wine.image,
                                  width: 200,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  wine.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  wine.wineType,
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  wine.price,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: ClipPath(
                                  clipper: HexagonClipper(),
                                  child: Container(
                                    width: 37,
                                    height: 37,
                                    color: CustomColor.ratingColor,
                                    child: Center(
                                        child: Text(wine.rating.toString())),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height * 3 / 4);
    path.lineTo(0, size.height / 4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

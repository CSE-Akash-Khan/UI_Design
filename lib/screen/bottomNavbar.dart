import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/screen/CheckOutList.dart';
import 'package:ui_design/screen/HomePage.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [HomePage(),CheckOut(),Card()];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        height: 50,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,),
          Icon(Icons.shopping_bag_outlined,color: Colors.white,),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}

import 'package:flutter/material.dart';
class LastPartWineDetails extends StatefulWidget {
  LastPartWineDetails({Key? key}) : super(key: key);

  @override
  State<LastPartWineDetails> createState() => _LastPartWineDetailsState();
}
class _LastPartWineDetailsState extends State<LastPartWineDetails>with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {

    return Expanded( //todo: last curve
      flex: 6,
      child: Container(
        // height: double.maxFinite,
        //   height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23))
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  height:80,
                  width: double.maxFinite,
                  // color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          height:80,
                          width: 80,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            border: Border.all(width: 2,color: Colors.grey.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wine_bar),
                              Text("4.6/5")
                            ],
                          ),
                        ),
                      );
                    },),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      controller: tabController,
                      tabs: [
                        Tab(text: "Description",),
                        Tab(text: "Feature",)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

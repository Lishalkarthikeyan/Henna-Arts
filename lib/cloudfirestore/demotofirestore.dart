

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Define a model class
class ListItem {
  final List<String>discount;
  final List<String >category;
  final List<String> type;
  final List<String> amount;
  final List<String> ok;
  final List<String> remo;
  final List<String> rs;

  ListItem({required this.discount, required this.category,
    required this.remo,required this.type,required this.ok,required this.amount,required this.rs,});
}

class Demotofirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Filter and TabBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilteredListView(),
    );
  }
}

class FilteredListView extends StatefulWidget {
  @override
  _FilteredListViewState createState() => _FilteredListViewState();
}

class _FilteredListViewState extends State<FilteredListView>
    with SingleTickerProviderStateMixin {
  late List<ListItem> items;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize your items
    items = [

      ListItem(discount:  [
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
      ], category: ["All","All","All","All","All","All"], remo:  [
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
      ], type:  [
        "Front hand",
        "Back Hand",
        "Leg Design",
        "Front hand",
        "Back Hand",
        "Leg Design",
      ], ok: [
        "Bridal",
        "Semi Bridal",
        "Arabic",
        "Matala",
        "Bridal",
        "Semi Bridal"
      ], amount:  [
        " 500",
        " 1000",
        " 700",
        " 500",
        " 1000",
        " 700",
      ], rs:  [
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
      ]) ,ListItem(discount:  [
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
      ], category:  ["All","All","All","All","All","All"], remo:  [
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
      ], type:  [
        "Front hand",
        "Back Hand",
        "Leg Design",
        "Front hand",
        "Back Hand",
        "Leg Design",
      ], ok: [
        "Bridal",
        "Semi Bridal",
        "Arabic",
        "Matala",
        "Bridal",
        "Semi Bridal"
      ], amount:  [
        " 500",
        " 1000",
        " 700",
        " 500",
        " 1000",
        " 700",
      ], rs:  [
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
      ]) ,ListItem(discount:  [
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
        "(30% Discount)",
      ], category: ["Front Hand Design","Front Hand Design","Front Hand Design","Front Hand Design","Front Hand Design","Front Hand Design",], remo:  [
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
        "assets/splash.png",
        "assets/onboard1.png",
      ], type:  [
        "Front hand",
        "Back Hand",
        "Leg Design",
        "Front hand",
        "Back Hand",
        "Leg Design",
      ], ok: [
        "Bridal",
        "Semi Bridal",
        "Arabic",
        "Matala",
        "Bridal",
        "Semi Bridal"
      ], amount:  [
        " 500",
        " 1000",
        " 700",
        " 500",
        " 1000",
        " 700",
      ], rs:  [
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
        "Rs ",
      ]) ,


    ];


    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black,),
        title: Text('ListView Filter and TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Front Hand Design'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListView("All"),
          _buildListView("Front Hand Design"),

        ],
      ),
    );
  }

  Widget _buildListView(String category) {

    final filteredItems = items
        .where((item) => item.category == category)
        .toList(); // Filter items for the given category
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          mainAxisExtent: 350,
          crossAxisSpacing: 0,
        ),
        itemCount:category.length,
        itemBuilder: (BuildContext ctx, int index) {
          final item = filteredItems[index];

          return
            InkWell(
              child: Container(

                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.elliptical(20, 20))),
                child: Column(children: [
                  Container(
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.remo[index],
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),

                  SizedBox(height: 5),
                  Container(

                      child: Text(
                        item.type[index],
                        style: TextStyle(color: Colors.blueGrey),
                      )),
                  Text(
                    item.ok[index],
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.rs[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        item.amount[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(210, 43, 43, 1)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.discount[index],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) =>
                            Icon(
                              Icons.star,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 2)
                              ],
                              color: Colors.orange,
                            ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        '4.0',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '/ 5.0',
                        style: TextStyle(
                            color: Colors.pink[500],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 25,

                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black,
                              spreadRadius: 0.50,
                              blurRadius: 2)
                        ],

                        color: Colors.pink,
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(
                            20,
                            20,
                          ),
                        )

                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),

              ),
            );
        }
    );

  }


}






//        ListView.builder(
//         itemCount: filteredItems.length,
//         itemBuilder: (context, index) {
//           final _item = filteredItems[index];
//           return InkWell(
//               onTap: (){
//             Navigator.push(context,MaterialPageRoute(builder: (context) => yourorderpage(item: _item,),));
//           },
//             child: Container(
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(_item.title),
//                     subtitle: Text(_item.category),
//                     leading: SizedBox(height:100,width: 100,child: Text(_item.remo.toString())),
//
//                   ),
//                   Image.asset(_item.image[0],height: 100,width: 100,),
//
//                 ],
//               ),
//             ),
//           );
//         },
//
//     );
//   }
// }
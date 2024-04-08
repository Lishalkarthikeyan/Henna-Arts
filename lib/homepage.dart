import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'cloudfirestore/savedataincloud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //
  // List<String> allVideos = [
  //   "Video 1",
  //   "Video 2",
  //   "Video 3",
  //   // Add more videos as needed
  // ];

  // List<String> filteredVideos = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  // void filterVideos(String category) {
  //   setState(() {
  //     // Implement your filtering logic based on the selected category
  //     // For example, here, we are filtering based on the category "Music"
  //     // filteredVideos = allVideos.where((video) => video.contains(category)).toList();
  //   });
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   phoneController.dispose();
  //   super.dispose();
  // }

  void _ontap(int index) {
    setState(() {
      _selectedIndex = index;

      // Use Navigator to push the corresponding screen onto the stack
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, "yourpage");
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, "categorypage");
      } else if (_selectedIndex == 3) {
        Navigator.pushNamed(context, "yourorderpage");
      }
    });
  }

  int _selectedIndex = 0;

  List design = [
    "All",
    "Front Hand Design",
    "Back Hand Design",
    "Leg Design",
    "Bridal Design",
    "More Design"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Container(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Drawer(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                    ), //BoxDecoration
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.pink),
                      accountName: Text(
                        "Sandhya Lishal",
                        style: TextStyle(fontSize: 18),
                      ),
                      accountEmail: Text("sandhya30009@gmail.com"),
                      currentAccountPictureSize: Size.square(50),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 165, 255, 137),
                        child: Text(
                          "S",
                          style: TextStyle(fontSize: 30.0, color: Colors.blue),
                        ), //Text
                      ), //circleAvatar
                    ), //UserAccountDrawerHeader
                  ), //DrawerHeader
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(' My Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text(' My Course '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text(' Go Premium '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.video_label),
                    title: const Text(' Saved Videos '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text(' Edit Profile '),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.pink,
            title: Text(
              "Mehandhi app",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ss");
                },
                icon: Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "favoritepage");
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                dividerColor: Colors.pink,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelStyle:
                    TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                unselectedLabelColor: Colors.pink,
                indicatorWeight: 3,
                labelColor: Colors.black,
                tabs: [
                  CustomTabBarLabel(
                    text: "All",
                  ),
                  CustomTabBarLabel(
                    text: "FrontHand Design",
                  ),
                  CustomTabBarLabel(
                    text: "BackHand Design",
                  ),
                  CustomTabBarLabel(
                    text: "Leg Design",
                  ),
                  CustomTabBarLabel(
                    text: "More Design",
                  ),
                ]),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Alltab(),
              ProductListView(type: "Front hand"),
              ProductListView(type: "Back Hand"),
              ProductListView(type: "Leg Design"),
              Alltab(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            useLegacyColorScheme: true,
            onTap: _ontap,
            iconSize: 25,
            selectedIconTheme: IconThemeData(
              size: 32,
            ),
            unselectedIconTheme: IconThemeData(
              size: 25,
              color: Colors.white,
            ),
            selectedFontSize: 30,
            unselectedFontSize: 25,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            backgroundColor: Colors.pink,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            unselectedLabelStyle: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(
                fontSize: 13,
                color: Colors.pink,
                letterSpacing: 3,
                fontWeight: FontWeight.bold),
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home_outlined,
                  )),
              BottomNavigationBarItem(
                  label: "You",
                  icon: Icon(
                    Icons.account_circle_outlined,
                  )),
              BottomNavigationBarItem(
                  label: "Cart",
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  )),
              BottomNavigationBarItem(
                  label: "Your Orders",
                  icon: Icon(
                    Icons.add_business_outlined,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Alltab extends StatefulWidget {
  // final List<String> videos;

  // Alltab(this.videos);

  @override
  State<Alltab> createState() => _AlltabState();
}

class _AlltabState extends State<Alltab> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        List<Product> products = documents
            .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            mainAxisExtent: 350,
            crossAxisSpacing: 0,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, int index) {
            final Product product = products[index];
            return Container(
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
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
              child: Column(children: [
                Container(
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                    child: Text(
                  product.type,
                  style: TextStyle(color: Colors.blueGrey),
                )),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.rupees,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      product.price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(210, 43, 43, 1)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      product.discount,
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
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
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
                          color: Colors.pink[500], fontWeight: FontWeight.bold),
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
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0.50,
                            blurRadius: 2)
                      ],
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          20,
                          20,
                        ),
                      )),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            );
          },
        );
      },
    );
  }
}

class CustomTabBarLabel extends StatelessWidget {
  final String text;

  CustomTabBarLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            spreadRadius: 2,
          )
        ],
        border: Border.all(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}

import 'package:mehandhi/cartpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cloudfirestore/savedataincloud.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  final Cart cart = Cart();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  final ValueNotifier<int> cartItemCount = ValueNotifier<int>(0);

  void cartItemCounting() {
    // This method should be called whenever an item is added to the cart.
    cartItemCount.value = cart.items.length;
  }

  void _ontap(int index) {
    setState(() {
      _selectedIndex = index;

      // Use Navigator to push the corresponding screen onto the stack
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, "yourpage");
      } else if (_selectedIndex == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItemCounting:cartItemCounting,
                cart: cart,
              ),
            ));
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
                    title: const Text('Demo firestore'),
                    onTap: () {
                      Navigator.pushNamed(context, "demotofirestore");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text('Category page'),
                    onTap: () {
                      Navigator.popAndPushNamed(context, "categorypage");
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
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('username');
                      await prefs.remove('password');
                      await prefs.remove('email');
                      await prefs.remove('phone');
                      await prefs.remove('isLoggedIn');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Logged out Sucessfully",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.black,
                          duration: Duration(milliseconds: 1300),
                          behavior: SnackBarBehavior.floating,
                          closeIconColor: Colors.white,
                        ),
                      );

                      Navigator.pushReplacementNamed(context, 'loginpage');
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
              // for dark mode given below

              // Switch(
              //   value: isDarkMode,
              //   onChanged: (value) {
              //     setState(() {
              //       isDarkMode = value;
              //       // Toggle between light and dark mode
              //       isDarkMode
              //           ? Theme.of(context).copyWith(brightness: Brightness.dark)
              //           : Theme.of(context).copyWith(brightness: Brightness.light);
              //     });
              //   },
              // ),
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
              ProductListView(cart: cart, cartItemCount: cartItemCounting),
              ProductListView(type: "Front hand", cart: cart, cartItemCount: cartItemCounting,),
              ProductListView(type: "Back Hand", cart: cart, cartItemCount: cartItemCounting),
              ProductListView(type: "Leg Design", cart: cart, cartItemCount: cartItemCounting),
              ProductListView(cart: cart, cartItemCount: cartItemCounting),
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
            items: [
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
                icon: ValueListenableBuilder<int>(
                    valueListenable: cartItemCount,
                    builder: (context, value, child) {
                      return badges.Badge(
                        badgeAnimation: badges.BadgeAnimation.slide(),
                        position: badges.BadgePosition.topEnd(),
                        badgeStyle: badges.BadgeStyle(badgeColor: Colors.black
                            ,shape:badges.BadgeShape.twitter,borderSide: BorderSide(color: Colors.white,width:1)),
                        badgeContent: Text(value.toString(),
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      );
                    }),
              ),
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

import 'package:flutter/material.dart';
import 'package:badges/badges.dart'as badges;

import 'cartpage.dart';
import 'cloudfirestore/savedataincloud.dart';

class FirebaseProductList extends StatefulWidget {
  @override
  _FirebaseProductListState createState() => _FirebaseProductListState();
}

class _FirebaseProductListState extends State<FirebaseProductList> {
  final Cart cart = Cart();
  final ValueNotifier<int> cartItemCount = ValueNotifier<int>(0);

  void _updateCartItemCount() {
    // This method should be called whenever an item is added to the cart.
    cartItemCount.value = cart.items.length;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: [
            ValueListenableBuilder<int>(
              valueListenable: cartItemCount,
              builder: (context, value, child) {
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(),
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: Text(value.toString(), style: TextStyle(color: Colors.white)),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(cart: cart,cartItemCounting: _updateCartItemCount,),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Front Hand'),
              Tab(text: 'Back Hand'),
              Tab(text: 'Leg Design'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductListView(type: 'Front hand', cart: cart, cartItemCount: _updateCartItemCount),
            ProductListView(type: 'Back Hand', cart: cart, cartItemCount: _updateCartItemCount),
            ProductListView(type: 'Leg Design', cart: cart, cartItemCount: _updateCartItemCount),
          ],
        ),
      ),
    );
  }
}

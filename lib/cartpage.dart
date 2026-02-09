import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mehandhi/productview.dart';
import 'cloudfirestore/savedataincloud.dart';

class CartPage extends StatefulWidget {
  final Cart cart;
  final VoidCallback cartItemCounting;

  CartPage({required this.cart, required this.cartItemCounting});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Cart",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          final product = widget.cart.items.keys.elementAt(index);
          final quantity = widget.cart.items[product]!;
          return Container(
            height: 200,
            width: width,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 2,
                    spreadRadius: 0.50,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productview(product: product),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 200,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Center(child: Text('Failed to load image'));
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 35,),
                    Column(
                      children: [
                        Container(
                            child: Text(product.type,
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ))),
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        Row(
                          children: [
                            Text(
                              "\u20B9",
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),

                        Text(
                          product.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(210, 43, 43, 1)),
                        ),
                          ],
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
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(30, 30)),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.pink,
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.cart.removeItem(product);
                                widget.cartItemCounting();
                              });
                            },
                            child: Icon(Icons.remove_circle,color: Colors.pink,size: 20,),

                          ),
                          Text(quantity.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),), // Display the quantity
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.cart.addItem(product);
                                widget.cartItemCounting();
                              });
                            },
                            child: Icon(Icons.add_circle,color: Colors.pink,size: 20,),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          widget.cart.items.remove(product);
                          widget.cartItemCounting();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30)),
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                              style: BorderStyle.solid,
                            )),
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          // booking code
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30)),
                            border: Border.all(
                              color: Colors.pink,
                              width: 1,
                              style: BorderStyle.solid,
                            )),
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.pink,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.verified,color: Colors.green[600],size: 20,),
                  SizedBox(width: 5,),
                  Text('Total Price :',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),

                ],
              ),
              Text('\u20B9 ${widget.cart.getTotalAmount().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
                ,color: Colors.pink[600]),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.pink[600],
                      borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10)),
                      border: Border.all(
                        color: Colors.pink,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    "Book Now (${widget.cart.items.length} items)",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  void _checkout() {
    // Implement checkout functionality here
    // Save data to Firestore or any other database
    saveDataToCloud(widget.cart.items.keys.toList());
  }
}

void saveDataToCloud(List<Product> items) {
  // Your Firestore saving functionality goes here
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class firebase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   void addDataToFirestore() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//     // Get values from text controllers
//     List< String >category= ["All","Front HandDesign","Back HandDesign","Leg Design","More"];
//
//     // Validate that name, age, and email are not empty
//     // if (category.isEmpty ||  email.isEmpty) {
//     //   print('Please fill in all fields');
//     //   return;
//     // }
//
//     // Define the data to be added
//     Map<String, dynamic> data = {
//     'category': category,
//
//
//     };
//
//     // Add the data to Firestore
//     try {
//     await firestore.collection('Tabs').add(data);
//     print('Data added successfully!');
//     } catch (e) {
//     print('Error adding data: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//                 addDataToFirestore.toString()
//             ),
//
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: addDataToFirestore,
//               child: Text('Add to Firestore'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
//
// class firebase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   void addDataToFirestore() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//     // Define the data to be added
//     Map<String, dynamic> data = {
//       'All': {
//         'image': {
//           "assets/splash.png",
//           "assets/onboard1.png",
//           "assets/splash.png",
//           "assets/onboard1.png",
//           "assets/splash.png",
//           "assets/onboard1.png",
//         },
//         'mehandhitype': [
//           "Bridal",
//           "Semi Bridal",
//           "Arabic",
//           "Matala",
//           "Bridal",
//           "Semi Bridal"
//         ],
//         'hand': [
//           "Front hand",
//           "Back Hand",
//           "Leg Design",
//           "Front hand",
//           "Back Hand",
//           "Leg Design",
//         ],
//         'rs': [
//           "Rs ",
//           "Rs ",
//           "Rs ",
//           "Rs ",
//           "Rs ",
//           "Rs ",
//         ],
//         'amount': [
//           " 500",
//           " 1000",
//           " 700",
//           " 500",
//           " 1000",
//           " 700",
//         ],
//         'Discount': [
//           "(30% Discount)",
//           "(30% Discount)",
//           "(30% Discount)",
//           "(30% Discount)",
//           "(30% Discount)",
//           "(30% Discount)",
//         ]
//       }
//     };
//
//     // Add the data to Firestore
//     try {
//       await firestore.collection('Tabs').add(data);
//       print('Data added successfully!');
//     } catch (e) {
//       print('Error adding data: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: addDataToFirestore,
//               child: Text('Add to Firestore'),
//             ),
//             ElevatedButton(
//               child: Text('Go To Going'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Going()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Going extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Firestore Example'),
//         ),
//         body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('Tabs').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error}'),
//                   );
//                 }
//             final documents = snapshot.data!.docs;
//             return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 0,
//                   mainAxisExtent: 350,
//                   crossAxisSpacing: 0,
//                 ),
//                 itemCount: documents.length,
//
//             itemBuilder: (BuildContext ctx, int index) {
//                 final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
//
//
//
//
//                   return InkWell(
//                     child: Container(
//                       margin: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black38,
//                             blurRadius: 2,
//                             spreadRadius: 2,
//                           )
//                         ],
//                         borderRadius: BorderRadius.all(
//                           Radius.elliptical(20, 20),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           // Container(
//                           //   height: 180,
//                           //   child: ClipRRect(
//                           //     borderRadius: BorderRadius.circular(10),
//                           //     child: Image.asset(
//                           //       documents.['image'], // Assuming 'image' is a field in your Firestore document
//                           //       fit: BoxFit.cover,
//                           //     ),
//                           //   ),
//                           // ),
//                           SizedBox(height: 5),
//                           Text(
//                             data["All"].toString(),
//                             style: TextStyle(color: Colors.blueGrey),
//                           ),
//                           // Text(
//                           //   itemData?.[data.first],
//                           //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           // ),
//                           // Text(
//                           //   'Rs ${itemData['rs']} ${itemData['amount']} ${itemData['Discount']}',
//                           //   style: TextStyle(fontWeight: FontWeight.bold),
//                           // ),
//                           // Row(
//                           //   mainAxisAlignment: MainAxisAlignment.center,
//                           //   children: [
//                           //     RatingBar.builder(
//                           //       itemSize: 20,
//                           //       initialRating: 3,
//                           //       minRating: 1,
//                           //       direction: Axis.horizontal,
//                           //       itemCount: 5,
//                           //       itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                           //       itemBuilder: (context, _) => Icon(
//                           //         Icons.star,
//                           //         shadows: [
//                           //           Shadow(color: Colors.black, blurRadius: 2)
//                           //         ],
//                           //         color: Colors.orange,
//                           //       ),
//                           //       onRatingUpdate: (rating) {
//                           //         print(rating);
//                           //       },
//                           //     ),
//                           //     SizedBox(width: 10),
//                           //     Text(
//                           //       '4.0', // Replace with actual rating
//                           //       style: TextStyle(
//                           //           color: Colors.blueAccent,
//                           //           fontWeight: FontWeight.bold),
//                           //     ),
//                           //     Text(
//                           //       '/ 5.0',
//                           //       style: TextStyle(
//                           //           color: Colors.pink[500],
//                           //           fontWeight: FontWeight.bold),
//                           //     )
//                           //   ],
//                           // ),
//                           // SizedBox(height: 10),
//                           // Container(
//                           //   alignment: Alignment.center,
//                           //   height: 25,
//                           //   margin: EdgeInsets.only(left: 40, right: 40),
//                           //   decoration: BoxDecoration(
//                           //       boxShadow: [
//                           //         BoxShadow(color: Colors.black,
//                           //             spreadRadius: 0.50,
//                           //             blurRadius: 2)
//                           //       ],
//                           //       color: Colors.pink,
//                           //       borderRadius: BorderRadius.all(
//                           //         Radius.elliptical(
//                           //           20,
//                           //           20,
//                           //         ),
//                           //       )
//                           //   ),
//                           //   child: Text(
//                           //     "Add to Cart",
//                           //     style: TextStyle(
//                           //         fontSize: 14,
//                           //         color: Colors.white,
//                           //         fontWeight: FontWeight.bold),
//                           //   ),
//                           // )
//                         ],
//                       ),
//                     ),
//                   );
//                 });
//           },
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class Product {
//   final String image;
//   final String name;
//   final String type;
//   final String price;
//   final String rupees;
//
//   final String discount;
//
//   Product(
//       {required this.image,
//       required this.name,
//       required this.type,
//       required this.price,
//       required this.discount,
//       required this.rupees});
//
//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//         image: map['image'],
//         name: map['name'],
//         type: map['type'],
//         price: map['price'],
//         discount: map['discount'],
//         rupees: map['rupees']);
//   }
// }
//
// class MyGridView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('products').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         final List<DocumentSnapshot> documents = snapshot.data!.docs;
//         List<Product> products = documents
//             .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
//             .toList();
//
//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 0,
//             mainAxisExtent: 350,
//             crossAxisSpacing: 0,
//           ),
//           itemCount: products.length,
//           itemBuilder: (BuildContext ctx, int index) {
//             final Product product = products[index];
//             return Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black38,
//                       blurRadius: 2,
//                       spreadRadius: 2,
//                     )
//                   ],
//                   borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
//               child: Column(children: [
//                 Container(
//                   height: 180,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       product.image,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Container(
//                     child: Text(
//                   product.type,
//                   style: TextStyle(color: Colors.blueGrey),
//                 )),
//                 Text(
//                   product.name,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       product.rupees,
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                     ),
//                     Text(
//                       product.price,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Color.fromRGBO(210, 43, 43, 1)),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       product.discount,
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     RatingBar.builder(
//                       itemSize: 20,
//                       initialRating: 3,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       itemCount: 5,
//                       itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         shadows: [Shadow(color: Colors.black, blurRadius: 2)],
//                         color: Colors.orange,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       '4.0',
//                       style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '/ 5.0',
//                       style: TextStyle(
//                           color: Colors.pink[500], fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   height: 25,
//                   margin: EdgeInsets.only(left: 40, right: 40),
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black,
//                             spreadRadius: 0.50,
//                             blurRadius: 2)
//                       ],
//                       color: Colors.pink,
//                       borderRadius: BorderRadius.all(
//                         Radius.elliptical(
//                           20,
//                           20,
//                         ),
//                       )),
//                   child: Text(
//                     "Add to Cart",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ]),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// void addDataToFirestore() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   List<String> remo = [
//     "assets/splash.png",
//     "assets/onboard1.png",
//     "assets/splash.png",
//     "assets/onboard1.png",
//     "assets/splash.png",
//     "assets/onboard1.png",
//   ];
//
//   List<String> ok = [
//     "Bridal",
//     "Semi Bridal",
//     "Arabic",
//     "Matala",
//     "Bridal",
//     "Semi Bridal"
//   ];
//
//   final List<String> type = [
//     "Front hand",
//     "Back Hand",
//     "Leg Design",
//     "Front hand",
//     "Back Hand",
//     "Leg Design",
//   ];
//
//   final List<String> rs = [
//     "Rs ",
//     "Rs ",
//     "Rs ",
//     "Rs ",
//     "Rs ",
//     "Rs ",
//   ];
//   final List<String> amount = [
//     " 500",
//     " 1000",
//     " 700",
//     " 500",
//     " 1000",
//     " 700",
//   ];
//   final List<String> Discount = [
//     "(30% Discount)",
//     "(30% Discount)",
//     "(30% Discount)",
//     "(30% Discount)",
//     "(30% Discount)",
//     "(30% Discount)",
//   ];
//
//   for (int i = 0; i < remo.length; i++) {
//     await firestore.collection('products').add({
//       'image': remo[i],
//       'name': ok[i],
//       'type': type[i],
//       'price': amount[i],
//       'rupees': rs[i],
//       'discount': Discount[i],
//     });
//   }
// }
//
// class fire extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.pink,
//           iconTheme: IconThemeData(color: Colors.white),
//           title: Text('Product Grid'),
//         ),
//         body: MyGridView());
//   }
// }
//
// class firebase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Grid'),
//         ),
//         body: Column(
//           children: [
//             Container(
//                 child: ElevatedButton(
//                     child: Text("add"),
//                     onPressed: () {
//                       addDataToFirestore();
//                     })),
//             Container(
//                 child: ElevatedButton(
//                     child: Text("firebase"),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => fire(),
//                           ));
//                     })),
//           ],
//         ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mehandhi/productview.dart';
import '../cartpage.dart';

class Product {
  final String image;
  final String name;
  final String type;
  final String price;
  final String rupees;
  final String discount;

  Product({
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.discount,
    required this.rupees,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'],
      name: map['name'],
      type: map['type'],
      price: map['price'],
      discount: map['discount'],
      rupees: map['rupees'],
    );
  }
}

class firebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Assuming you have 3 product types
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Front Hand'),
              Tab(text: 'Back Hand'),
              Tab(text: 'Leg Design'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductListView(),
            ProductListView(type: 'Front hand'),
            ProductListView(type: 'Back Hand'),
            ProductListView(type: 'Leg Design'),
          ],
        ),
      ),
    );
  }
}

class ProductListView extends StatelessWidget {

  final String? type;


  ProductListView({this.type});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
      //if you dont need types remove this Two lines:

          .collection('products').where('type', isEqualTo: type).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        List<Product> products = documents
            .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>)).toList();


        return   GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 0,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final Product product = products[index];
                  return  Container(
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


                        InkWell(
                        onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  Productview(product: product),));
                  },
                      child:
                      Container(
                        height: 180,
                        width: 180,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:  Image.network(
                            product.image,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                              return Center(child: Text('Failed to load image'));
                            },
                          ),


                        ),
                      ),
                        ),
                      SizedBox(height: 5),
                      Container(
                          child: Text(
                            product.type,
                              style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 16,)
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
                        height: 15,
                      ),
                  InkWell(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  cart(),));
                  },
                  child:
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 0.20,
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
                  )
                    ]
                  ),

                  );
                },

        );
          },
        );

  }
}






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'cloudfirestore/savedataincloud.dart';



class Productview extends StatefulWidget {

  final Product product;

  const Productview({super.key,required this.product});

  @override
  State<Productview> createState() => _ProductviewState();
}

class _ProductviewState extends State<Productview> {
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text("Design View"
            , style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white),),),
      body: Center(
        child: Container(
                      height: height,
                      width: width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(30),
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
                          height: 300,
                          width: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.product.image,
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),


                        SizedBox(height: 10),
                        Container(
                            child: Text(
                                widget.product.type,
                                style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 30,)
                            )),
                        Text(
                          widget.product.name,
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.product.rupees,
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              widget.product.price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                  color: Color.fromRGBO(210, 43, 43, 1)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.product.discount,
                              style: TextStyle(fontSize: 27),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              itemSize: 25,
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
                            SizedBox(width: 15),
                            Text(
                              '4.0',
                              style: TextStyle(fontSize: 25,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '/ 5.0',
                              style: TextStyle(fontSize: 25,
                                  color: Colors.pink[500], fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
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
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 0.20,
                                    blurRadius: 2)
                              ],
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(
                                  20,
                                  20,
                                ),
                              )),
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
      )
              ),

    );
  }
}

import 'package:flutter/material.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {

  @override
  Widget build(BuildContext context) {

    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;

    return  SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white,),
        title:Text("Favorite", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white),),),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    ));
  }
}

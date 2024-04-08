import 'package:flutter/material.dart';
class Yourpage extends StatefulWidget {
  const Yourpage({super.key});

  @override
  State<Yourpage> createState() => _YourpageState();
}

class _YourpageState extends State<Yourpage> {
  @override
  Widget build(BuildContext context) {

    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text("My Profile", style: TextStyle(
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
import 'package:flutter/material.dart';

class Morepage extends StatefulWidget {
  const Morepage({super.key});

  @override
  State<Morepage> createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text("Categories", style: TextStyle(
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


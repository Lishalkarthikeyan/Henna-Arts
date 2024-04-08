import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class yourorderpage extends StatefulWidget {
  const yourorderpage({super.key});

  @override
  State<yourorderpage> createState() => _yourorderpageState();
}

class _yourorderpageState extends State<yourorderpage> {
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text(" Your Orders", style: TextStyle(
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

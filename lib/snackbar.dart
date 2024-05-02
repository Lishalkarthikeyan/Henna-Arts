import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String message,{Duration duration = const Duration(seconds: 3)}){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message, style: TextStyle(  fontSize: 15,fontWeight: FontWeight.bold,)
  ),duration: duration,backgroundColor: Color.fromRGBO(199, 0, 27, 1),showCloseIcon: true,));

}
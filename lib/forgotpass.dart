import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final _formkey = GlobalKey<FormState>();
    final _emailcontroller = TextEditingController();
    final _emailcontoller = TextEditingController();
    final _emailconroller = TextEditingController();
    Container(
      height: height,
      width: width,
    );
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 460,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(50, 50),
                      topLeft: Radius.elliptical(50, 50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: Colors.pink,
                            ),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(30, 30),
                                ))),
                      ),
                      height: 50,
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.message_outlined,
                            color: Colors.pink,
                          ),
                          labelText: "Otp",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30),
                              ))),
                    ),
                    height: 50,
                    width: 300,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.pink,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30),
                              ))),
                    ),
                    height: 50,
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Colors.pink,
                          ),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(30, 30),
                              ))),
                    ),
                    height: 50,
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                        border: Border.all(
                          color: Colors.pink,
                          width: 0.30,
                          style: BorderStyle.solid,
                        )),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 220);
    path.quadraticBezierTo(size.width / 4, 160, size.width / 2, 175);
    path.quadraticBezierTo(3 / 4 * size.width, 190, size.width, 130);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

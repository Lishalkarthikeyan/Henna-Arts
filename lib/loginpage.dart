import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mehandhi/firebasecreateuser/createuser.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formkey = GlobalKey<FormState>();
  static TextEditingController _emailcontroller = TextEditingController();
  static TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        Container(
          height: height,
          width: width,
          color: Colors.pink,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Container(
                height: height / 1.65,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(50, 50),
                        topRight: Radius.elliptical(50, 50)),
                    border: Border.all(color: Colors.white, width: 3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(children: [
                          Container(
                            height: 70,
                            width: 330,
                            child: TextFormField(
                                cursorColor: Colors.pink,
                                cursorErrorColor: Colors.red,
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.fromLTRB(
                                    //     20.0, 5.0, 40.0, 10.0),
                                    prefixIcon: Icon(
                                      Icons.mail_outline_outlined,
                                      color: Colors.pink,
                                    ),
                                    labelText: "E-mail address",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30),
                                    ))),
                                validator: (a) {
                                  RegExp emailRegExp = RegExp(
                                      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$');

                                  if (a == null || a.isEmpty) {
                                    return 'Please enter an email address.';
                                  } else if (!emailRegExp.hasMatch(a)) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                }),
                            margin: EdgeInsets.only(left: 40, right: 40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            width: 330,
                            child: TextFormField(
                                controller: _passwordcontroller,
                                cursorErrorColor: Colors.red,
                                cursorColor: Colors.pink,
                                decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.fromLTRB(
                                    //     20.0, 20.0, 40.0, 10.0),
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
                                validator: (a) {
                                  RegExp passRegExp = RegExp(
                                      r'^(?=.*[a-zA-Z]).{8,}');
                                  if (a == null || a.isEmpty) {
                                    return 'Please enter an Password.';
                                  } else if (!passRegExp.hasMatch(a)) {
                                    return 'Passwoed contain 8 digit with one Capital letter.';
                                  }
                                  return null;
                                }),
                            margin: EdgeInsets.only(left: 40, right: 40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_formkey.currentState!.validate())
                                await Authentication().signinUser(
                                    _emailcontroller.text,
                                    _passwordcontroller.text);
                            },
                            child: Container(
                              height: 45,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  border: Border.all(
                                    color: Colors.pink,
                                    width: 0.30,
                                    style: BorderStyle.solid,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont have an Account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "registerpage");
                          },
                          child: Container(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "forgotpass");
                      },
                      child: Container(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: width / 2.5,
                          child: Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: width / 2.5,
                          child: Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(234, 237, 237, 1),
                              border: Border.all(color: Colors.pink, width: 2),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Image(
                            image: AssetImage(
                              "assets/googlelogo.png",
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(234, 237, 237, 1),
                              border: Border.all(color: Colors.pink, width: 2),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Image(
                            image: AssetImage(
                              "assets/fblogo.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
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

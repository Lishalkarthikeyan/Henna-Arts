import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mehandhi/firebasecreateuser/createuser.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formkey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Container(
      height: height,
      width: width,
    );

    return Scaffold(
        body: Stack(children: [
      Container(
        color: Colors.pink,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              height: height / 1.47,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(50, 50),
                      topRight: Radius.elliptical(50, 50)),
                  border: Border.all(color: Colors.white, width: 0.20)),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: _formkey,
                          child: Column(children: [
                            Container(
                              child: TextFormField(
                                controller: _emailcontroller,
                                decoration: InputDecoration(
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
                                  }
                              ),
                              height: 50,
                              width: 300,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _phonecontroller,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone_outlined,
                                      color: Colors.pink,
                                    ),
                                    prefixText: "+91 ",
                                    prefixStyle: TextStyle(color: Colors.black,fontSize: 16,),

                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30),
                                    ))),
                                  validator: (a) {
                                    if (a == null || a.isEmpty) {
                                      return "Please enter a phone number";
                                    } else if (a.length != 10) {
                                      return "Please enter 10 digits";
                                    }
                                    return null; // Return null if validation passes
                                  }

                              ),

                              height: 50,
                              width: 300,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _passwordcontroller,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.pink,
                                      ),
                                      labelText: "Password",
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.elliptical(30, 30),
                                      ))),
                                  validator: (a) {
                                    RegExp passRegExp =
                                        RegExp(r'^(?=.*[a-zA-Z]).{8,}');
                                    if (a == null || a.isEmpty) {
                                      return 'Please enter an Password.';
                                    } else if (!passRegExp.hasMatch(a)) {
                                      return 'Passwoed contain 8 digit with one Capital letter.';
                                    }
                                    return null;
                                  }),
                              height: 50,
                              width: 300,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,

                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password_sharp,
                                      color: Colors.pink,
                                    ),
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30),
                                    ))),
                                  validator: (a) {
                                    if (a == null || a.isEmpty ) {
                                      return 'Please enter an Password.';
                                    } else if ( a!= _passwordcontroller.text) {
                                      return 'Passwoed does not match';
                                    }
                                    return null;
                                  }

                              ),
                              height: 50,
                              width: 300,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ])),
                      InkWell(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            await Authentication().registerUser(
                              _emailcontroller.text,
                              _passwordcontroller.text,



                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(30, 30)),
                              border: Border.all(
                                color: Colors.pink,
                                width: 0.30,
                                style: BorderStyle.solid,
                              )),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "loginpage");
                            },
                            child: Container(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "firebase");
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(234, 237, 237, 1),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.pink,
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/googlelogo.png",
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "homepages");
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(234, 237, 237, 1),
                                    border: Border.all(
                                        color: Colors.pink, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/fblogo.png",
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ]),
              ),
            ),
          ),
        ],
      ),
    ]));
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

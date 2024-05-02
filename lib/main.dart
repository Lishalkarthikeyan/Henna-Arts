
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mehandhi/cartpage.dart';
import 'package:mehandhi/cloudfirestore/demotofirestore.dart';
import 'package:mehandhi/cloudfirestore/savedataincloud.dart';
import 'package:mehandhi/favoritepage.dart';
import 'package:mehandhi/forgotpass.dart';
import 'package:mehandhi/homepage.dart';
import 'package:mehandhi/loginpage.dart';
import 'package:mehandhi/morepage.dart';
import 'package:mehandhi/registerpage.dart';
import 'package:mehandhi/yourorderpage.dart';
import 'package:mehandhi/yourpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'profilepage.dart';
import 'categorypage.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool? isLoggedIn;


  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;


    });

  }
  @override
  Widget build(BuildContext context) {

        double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SizedBox(width: width,height: height,);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "registerpage": (context) => registerpage(),
        "loginpage": (context) => loginpage(),
        "forgotpass": (context) => forgotpass(),
        "homepages": (context) => homepage(),
        // "firebase" : (context) => firebase(),
        "profilepage": (context) => profilepage(),
        "categorypage": (context) => category(),
        "demotofirestore": (context) => Demotofirestore(),
        "favoritepage": (context) => Favoritepage(),
        "yourpage": (context) => Yourpage(),
        "morepage": (context) => Morepage(),
        "cart": (context) => cart(),
        "yourorderpage": (context) => yourorderpage(),
        // "remo": (context) => remo(),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          Scaffold(
              backgroundColor: Colors.pinkAccent,
              body: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: (width = width),
                    height: (height = height),
                    color: Colors.pinkAccent,
                    child:
                    AnimatedSplashScreen(
                      nextScreen:
                           isLoggedIn

                          ?? false ?homepage()
                          : loginpage(),


                      splash: Text("Henna  Arts",style: TextStyle(color: Colors.white,
                          fontSize: 70,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),),
                      backgroundColor: Colors.pink,
                      duration: 1,
                      splashTransition: SplashTransition.fadeTransition,

                    ),
                  ),


      ],
              )


          ),


    );
  }
}

//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     @override
//
//
//     void _isLogin()async {
//       SharedPreferences prefs= await SharedPreferences.getInstance();
//       await prefs.getBool('isLoggedIn');
//
//
//       bool? isLogin = prefs.getBool('isLoggedIn') ?? true;
//
//       if(isLogin){
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => homepage())
//         );
//     }
//
//       else{
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => const loginpage())
//         );
//
//       }
//     }
//
//
//
//
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     Container(width: width,height: height,);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: <String, WidgetBuilder>{
//         "registerpage": (context) => registerpage(),
//         "loginpage": (context) => loginpage(),
//         "forgotpass": (context) => forgotpass(),
//         "homepages": (context) => homepage(),
//         "firebase" : (context) => firebase(),
//         "profilepage": (context) => profilepage(),
//         "categorypage": (context) => category(),
//         "cartpage": (context) => Cartpage(),
//         "favoritepage": (context) => Favoritepage(),
//         "yourpage": (context) => Yourpage(),
//         "morepage": (context) => Morepage(),
//         // "remo": (context) => remo(),
//
//       },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:
//           Scaffold(
//               backgroundColor: Colors.pinkAccent,
//               body: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     width: (width = width),
//                     height: (height = height),
//                     color: Colors.pinkAccent,
//                     child:
//                     AnimatedSplashScreen(
//                       nextScreen: loginpage(),
//                       splash: Text("Henna  Arts",style: TextStyle(color: Colors.white,
//                           fontSize: 70,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),),
//                       backgroundColor: Colors.pink,
//                       duration: 1,
//                       splashTransition: SplashTransition.fadeTransition,
//
//                     ),
//                   ),
//
//
//       ],
//               )),
//
//
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     Container(
//       width: width,
//       height: height,
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Stack(children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 300),
//             child: Container(
//               height: 250,
//               width: 250,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.10), BlendMode.darken),
//                       image: AssetImage(
//                         "assets/1.png",
//                       ))),
//             ),
//           ),
//         ),
//       Column(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, "screen1");
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 200),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 55,
//                     width: 300,
//                     margin: EdgeInsets.only(top: 300),
//                     decoration: BoxDecoration(
//                         color: Colors.pink,
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 0.50,
//                         ),
//                         borderRadius:
//                             BorderRadius.all(Radius.elliptical(50, 50))),
//                     child: Text("Login ?",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                   ),
//                 ),
//               ),
//
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, "createaccount");
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: ),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 50,
//                     width: 150,
//                     margin: EdgeInsets.only(top: 300),
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 0.50,
//                         ),
//                         color: Colors.pink,
//                         borderRadius:
//                             BorderRadius.all(Radius.elliptical(12, 12))),
//                     child: Text("Signup ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 ),
//               )
//             ],
//           ),
//
//       ])),
//     );
//   }
// }

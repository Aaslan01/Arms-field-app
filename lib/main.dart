import 'dart:async';

import 'package:arms/welcomePage.dart';
import 'package:flutter/material.dart';
import 'changePassword.dart';
import 'package:firebase_core/firebase_core.dart';

import 'loginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
    );
  }
}

//
// class HomePageSplash extends StatefulWidget {
//   const HomePageSplash({Key? key}) : super(key: key);
//
//   @override
//   _HomePageSplashState createState() => _HomePageSplashState();
// }
//
// class _HomePageSplashState extends State<HomePageSplash> {
//   @override
//   void initState(){
//     super.initState();
//     Timer(Duration(seconds: 3),(){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePage()));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xff0962ff),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             textWidget(label: "arms", fontF: 'Merienda',wei: FontWeight.bold, size: 70),
//             textWidget(label: "FIELD APP", wei: FontWeight.w500, size: 30,letterSpace: 2.5,)
//           ],
//         ),
//       ),
//     );
//   }
// }
//

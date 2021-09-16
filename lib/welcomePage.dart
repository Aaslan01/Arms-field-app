import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';
import 'loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1075f1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height/3,
            child: Image.asset('images/logo.jpeg', width: double.infinity, height: size.height/2.5,)
          ),
          Container(
              child: Column(
                children: [
                  textWidget(label: "Welcome to", colour: Color(0xffe7fef9), fontF: '', wei: FontWeight.w500, size: 40),
                  textWidget(label: "ARMS Field App", wei: FontWeight.bold, fontF: 'Basic', size: 40,letterSpace: 2.5,),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "The best way to navigate and discover new places",
                      style: TextStyle(
                        fontSize: 17,
                          color: Color(0xffe7fef9)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Let's get started!",
                      style: TextStyle(
                        fontSize: 17,
                          color: Color(0xffe7fef9)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      child: Center(
                        child: textWidget(label:'EMAIL',colour: Color(0xff0962ff),
                            wei:  FontWeight.bold,size: 20),
                      ),
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> loginPage()));
                      },
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}


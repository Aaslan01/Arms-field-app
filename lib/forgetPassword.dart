import 'dart:math';

import 'package:arms/loginPage.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(65,0,0,0),
              child: Image.asset('images/drawer.jpeg', height: 50, width: 80,),
            ),
          ),
          body: forgetPasswordBody()
      );
  }
}

class forgetPasswordBody extends StatelessWidget {
  const forgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: size.height*0.35,
            width: double.infinity,
            color: Colors.white,
              child: FittedBox(
                  child: Image.asset('images/forgetPassword.jpeg')
              )
          ),
          Container(
            height: size.height*0.65,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                    children: [
                      TextSpan( text: 'Please enter a valid email in field below and '),
                      TextSpan(text: "'send'", style: TextStyle(
                        color: Color(0xff0962ff),
                      )),
                      TextSpan(text: ' button. An automated email shall be generated '
                          'to the specified email address with instructions of resetting password')
                    ]
                  )),
                ),
                SizedBox(height: 10,),
                SimpleInputP(inputHint: 'EMAIL'),
                enterButton(label: 'EMAIL',
                callFunction: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>loginPage()))
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


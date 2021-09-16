import 'package:arms/dataEntery.dart';
import 'package:flutter/material.dart';
import 'dataEntery.dart';
import 'DashBoard.dart';
import 'Listings.dart';
import 'Listing_media.dart';
import 'package:arms/Offline_listng.dart';
import 'changePassword.dart';
const activeCardColor = Color(0xff0e73ec);
const inActiveCardColor = Colors.white;
const activeTextColor = Colors.white;
const inActiveTextColor = Colors.black;

// Text Wighet with all the properties
class textWidget extends StatelessWidget {
  textWidget(
      {this.label = '',
      this.colour = Colors.white,
      this.fontF = '',
      this.wei = FontWeight.normal,
      this.size = 0,
      this.letterSpace = 0});

  final String label;
  final Color colour;
  final String fontF;
  final FontWeight wei;
  final double size;
  final double letterSpace;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: colour,
        fontFamily: fontF,
        fontWeight: wei,
        fontSize: size,
        letterSpacing: letterSpace,
      ),
    );
  }
}

// Input Box
class SimpleInputP extends StatefulWidget {
  String inputHint;

  SimpleInputP({required this.inputHint});

  @override
  _SimpleInputPState createState() => _SimpleInputPState();
}

class _SimpleInputPState extends State<SimpleInputP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
              obscureText: widget.inputHint == 'Password' ? true : false,
              onEditingComplete: () {},
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: widget.inputHint,
                hintStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                focusColor: Color(0xff0962ff),
                focusedBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide(
                    color: Color(0xff0962ff),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.5
                  ),
                ),
              )),
        ),
      ],
    );
  }
}


// Password box

class PasswordBox extends StatefulWidget {
  String inputHint;

  PasswordBox({required this.inputHint});

  @override
  _PasswordBoxState createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
              obscureText: true,
              onEditingComplete: () {},
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: widget.inputHint,
                hintStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                focusColor: Color(0xff0962ff),
                focusedBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide(
                    color: Color(0xff0962ff),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 0.5
                  ),
                ),
              )),
        ),
      ],
    );
  }
}


// DataEntry
class gestureButton extends StatelessWidget {
  gestureButton({
    required this.cardColor,
    this.rediusL = 0,
    this.rediusR = 0,
    required this.label,
    required this.textColor,
    this.bottomBorder: Colors.white,
  });

  final Color cardColor;
  final double rediusL;
  final double rediusR;
  final String label;
  final Color textColor;
  final Color bottomBorder;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      decoration: BoxDecoration(
          color: cardColor,
          border: Border(
              bottom: BorderSide(
            color: bottomBorder,
          )),
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(rediusL),
              topEnd: Radius.circular(rediusR),
              bottomStart: Radius.circular(rediusL),
              bottomEnd: Radius.circular(rediusR))),
      child: Center(
        child: textWidget(
          label: label,
          colour: textColor,
          wei: FontWeight.bold,
          size: 20,
        ),
      ),
    );
  }
}

//
class DataEntryTextWidget extends StatelessWidget {
  final double width;
  final Color hintColor;
  final String inputHint;

  DataEntryTextWidget({
    this.width = double.infinity,
    this.hintColor = Colors.black12,
    required this.inputHint,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      color: Colors.white,
      child: Center(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          onEditingComplete: () {},
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0, 0.0),
            hintText: inputHint,
            hintStyle: TextStyle(
              fontSize: 18,
              color: hintColor,
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SIMPLE ENTER BUTTON

class enterButton extends StatelessWidget {
  final String label;
  final Function callFunction;
  enterButton({required this.label, required this.callFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      // width: scrWidth * 0.8,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xff0962ff),
      ),
      child: InkWell(
        child: Center(
          child: textWidget(
              label: label,
              colour: Colors.white,
              wei: FontWeight.bold,
              size: 20),
        ),
        onTap: callFunction(),
      ),
    );
  }
}

// DawerListIcons

class CustomTitleList extends StatelessWidget {
  IconData icon;
  String label;
  Color cardColor;
  Color iconColor;
  Color textColor;
  Widget callFnction;
  CustomTitleList({
    required this.icon,
    required this.label,
    this.cardColor: Colors.white,
    this.iconColor: activeCardColor,
    this.textColor: Colors.black,
    required this.callFnction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 8, 10, 5),
        child: InkWell(
          splashColor: Colors.black12,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => callFnction));
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 35,
                color: iconColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: textWidget(
                  label: label,
                  colour: textColor,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Drawer Layout
class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 12,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    //color: Colors.black,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 25, 10, 0),
                          child: Material(
                            child: Image.asset(
                              'images/drawer.jpeg',
                              width: 130,
                              height: 100,
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Welcome",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Ali Sher',
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      CustomTitleList(
                        icon: Icons.home,
                        label: 'Add Property',
                        cardColor: Color(0xff0e73ec),
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> callFnction));
                        callFnction: DataEntry(),
                      ),
                      CustomTitleList(
                        icon: Icons.laptop,
                        label: 'Dashboard',
                        callFnction: DasHBoard(),
                      ),
                      CustomTitleList(
                        icon: Icons.list_alt_outlined,
                        label: 'Listings',
                        callFnction: Listings(),
                      ),
                      CustomTitleList(
                        icon: Icons.list_alt_outlined,
                        label: 'Listing for Media',
                        callFnction: ListingforMedia(),
                      ),
                      CustomTitleList(
                        icon: Icons.search_rounded,
                        label: 'Offline Listing',
                        callFnction: offineListings(),
                      ),
                      CustomTitleList(
                        icon: Icons.password_outlined,
                        label: 'Change Password',
                        callFnction: changePassword(),
                      ),
                      CustomTitleList(
                        icon: Icons.logout,
                        label: 'Logout',
                        callFnction: DasHBoard(),
                      ),
                      Divider(
                        thickness: 0.2,
                        color: Colors.black,
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

// GestureButton of Listing

class GestureDetectorListing extends StatelessWidget {
  final Color bottomC;
  final String Label;
  final Color textC;
  GestureDetectorListing({
    required this.bottomC,
    required this.Label,
    required this.textC,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
              color: bottomC,
            )),
      ),
      child: Center(
        child: textWidget(
          label: Label,
          colour: textC,
          wei: FontWeight.bold,
          size: 18,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Widgets.dart';

class Filter extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          key: scaffoldKey,
          drawer: Container(
            width: size.width * 0.75,
            child: DrawerLayout(),
          ),
          backgroundColor: Color(0xffe7ecf0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Image.asset(
                'images/drawer.jpeg',
                height: 50,
                width: 80,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  }),
            ],
          ),
          body: Container(),
        );
  }
}

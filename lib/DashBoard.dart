import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets.dart';


class DasHBoard extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          key: scaffoldKey,
          drawer: Container(
            width: size.width*0.75,
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
              padding: const EdgeInsets.fromLTRB(70,0,0,0),
              child: Image.asset('images/drawer.jpeg', height: 50, width: 80,),
            ),
            // title: RichText(
            //   textAlign: TextAlign.center,
            //   text: TextSpan(
            //       text: "arms",
            //       style: TextStyle(
            //           fontSize: 25,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xff0962ff)),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '\nFIELD APP',
            //           style: TextStyle(
            //             fontSize: 10,
            //           ),
            //         ),
            //       ]),
            // ),
            actions: [
              IconButton(
                  icon: Icon(Icons.menu,
                  color: Colors.black,),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  }),
            ],

          ),
          body: Column(
            children: [
              Flexible(
                  flex: 3,child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade900,
                      width: 1.5,
                    ),
                  ),
                ),

                child: Column(
                  children: [
                    Icon(Icons.laptop,
                    color: Colors.blue.shade700,
                      size: size.height*0.1,
                    ),
                    textWidget(label: "Listings Information",
                    colour: Colors.black,
                    size: size.height*0.05,
                    fontF: "Roboto",
                    ),
                    textWidget(label: "Ali Sher",
                      colour: Colors.blue.shade700,
                      size: size.height*0.05,
                      fontF: "Roboto",
                    )
                  ],
                ),
              )),
              Flexible(flex:7, child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    DashBoardListing(
                      lfNum: '0',
                      lfDis: 'Added in',
                      lsNum: '1',
                      lsDis: 'month',
                      rfNum: '0',
                      rfDis: 'Added in',
                      rsNum: '1',
                      rsDis: 'Week',
                    ),
                    DashBoardListing(
                      lfNum: '0',
                      lfDis: 'Added ',
                      lsNum: '',
                      lsDis: 'Today',
                      rfNum: '0',
                      rfDis: 'On Hold',
                      rsNum: '',
                      rsDis: 'listing',
                    ),
                    DashBoardListing(
                      lfNum: '0',
                      lfDis: 'Pending',
                      lsDis: 'Listing',
                      rfNum: '0',
                      rfDis: 'Published &',
                      rsDis: 'Completed',
                    ),
                    DashBoardListing(
                      lfNum: '0',
                      lfDis: 'Listing coverage',
                      lsDis: 'per month',
                      rfNum: '0',
                      rfDis: 'Listing coverage',
                      rsDis: 'per day',
                    ),
                  ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

class DashBoardListing extends StatelessWidget {

  String lfNum;
  String lfDis;
  String lsNum;
  String lsDis;
  String rfNum;
  String rfDis;
  String rsNum;
  String rsDis;
  DashBoardListing({
    this.lfNum ='',
    this.lfDis='',
    this.lsNum='',
    this.lsDis='',
    this.rfNum ='',
    this.rfDis='',
    this.rsNum='',
    this.rsDis='',
  });


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width*0.5,
          height: 109.7,
          //color: Colors.black,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade900,
                  width: 1.5,
                ),
                right: BorderSide(
                  color: Colors.grey.shade900,
                  width: 0.7,
                )
            ),
          ),
          child: InfoOfListing(
            fNum: lfNum,
            fDis: lfDis,
            sNum: lsNum,
            sDis: lsDis,
          ),
        ),
        Container(
          width: size.width*0.5,
          height: 109.7,
          //color: Colors.blue,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade900,
                    width: 1.5,
                  ),
                  left: BorderSide(
                    color: Colors.grey.shade900,
                    width: 0.7,
                  )
              )
          ),
          child: InfoOfListing(
            fDis: rfDis,
            fNum: rfNum,
            sNum: rsNum,
            sDis: rsDis,
          )
        ),
      ],
    );
  }
}

class InfoOfListing extends StatelessWidget {
  String fNum;
  String fDis;
  String sNum;
  String sDis;
  InfoOfListing({
    this.fNum ='',
    this.fDis='',
    this.sNum='',
    this.sDis='',
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: fNum,
          style: TextStyle(
          color: Colors.black,
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            fontFamily: 'Basic'
          ),
          children: [
            TextSpan(text: " ",),
            TextSpan(text: fDis),
            TextSpan(text: "\n "),
            TextSpan(text: sNum),
            TextSpan(text: " "),
            TextSpan(text: sDis),
          ]
        ),
      ),
    );
  }
}

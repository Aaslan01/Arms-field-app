import 'package:flutter/material.dart';
import 'Widgets.dart';
import 'filter.dart';

class ListingforMedia extends StatelessWidget {
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
          body: ListingBody(),
        );
  }
}

class ListingBody extends StatefulWidget {
  const ListingBody({Key? key}) : super(key: key);

  @override
  _ListingBodyState createState() => _ListingBodyState();
}

const activeColor = Colors.blue;
const InActiveColor = Colors.black;
const activeBorder = Colors.blue;
const inActiveBorder = Colors.white;

class _ListingBodyState extends State<ListingBody> {
  Color lText = activeColor;
  Color lBor = activeBorder;
  Color rText = InActiveColor;
  Color rBor = inActiveBorder;

  void updateColor(int val) {
    if (val == 1) {
      lText = activeColor;
      lBor = activeBorder;
      rText = InActiveColor;
      rBor = inActiveBorder;
    } else if (val == 2) {
      lText = InActiveColor;
      lBor = inActiveBorder;
      rText = activeColor;
      rBor = activeBorder;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColor(1);
                  });
                },
                child: GestureDetectorListing(
                  bottomC: lBor,
                  Label: 'Pending Media',
                  textC: lText,
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(2);
                    });
                  },
                  child: GestureDetectorListing(
                    bottomC: rBor,
                    Label: "Cleared",
                    textC: rText,
                  )),
            ),
          ]),
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            color: Color(0xffe7ecf0),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Showing',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff6d7072),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: ' '),
                              TextSpan(text: '0'),
                              TextSpan(text: ' '),
                              TextSpan(text: 'Property'),
                            ]),
                      ),
                      InkWell(
                        splashColor: Colors.black,
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_sharp,
                              color: Colors.black,
                              size: 25,
                            ),
                            textWidget(
                              label: 'Filters',
                              colour: Color(0xff6d7072),
                              fontF: 'basic',
                              size: 20,
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Filter()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DataEntryTextWidget(
                    inputHint: 'Property ID',
                    hintColor: Color(0xffa6a7a6),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.06,
            decoration: BoxDecoration(
                color: Color(0xfff4f5f5),
                border: Border.all(color: Colors.grey.shade400, width: 0.6, style: BorderStyle.solid)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  textWidget(
                    label: 'ID',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    width: size.width*0.1,
                  ),
                  textWidget(
                    label: 'Title',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    width: size.width*0.1,
                  ),
                  textWidget(
                    label: 'Area',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    width: size.width*0.1,
                  ),
                  textWidget(
                    label: 'Status',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: 100,
              color: Color(0xfffffefe),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No Entry',
                  textAlign: TextAlign.center,
                ),
              )
          )
        ],
      ),
    );
  }
}



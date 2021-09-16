import 'package:flutter/material.dart';
import 'Widgets.dart';
import 'filter.dart';

class offineListings extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          key: scaffoldKey,
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
              TextButton(
                  onPressed: (){},
                  child: textWidget(
                    label: 'Send Online',
                    size: 18,
                    wei: FontWeight.bold,
                    colour: Color(0xff0b6de8),
                  )
              )
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


class _ListingBodyState extends State<ListingBody> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [

          Container(
            width: double.infinity,
            height: size.height * 0.2,
            color: Color(0xffe7ecf0),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
            height: size.height * 0.1,
            decoration: BoxDecoration(
                color: Color(0xffe7ecf0),
                border: Border.all(color: Colors.grey.shade400, width: 0.6, style: BorderStyle.solid)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textWidget(
                    label: 'ID',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    width: size.width*0.15,
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
                    label: 'Location',
                    colour: Colors.black,
                    fontF: 'Basic',
                    wei: FontWeight.bold,
                    size: 18,
                  ),
                  SizedBox(
                    width: size.width*0.1,
                  ),
                  textWidget(
                    label: 'Price',
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
              child: Text('No Offline properties available',
                textAlign: TextAlign.center,
              ),
            )
          )
        ],
      ),
    );
  }
}



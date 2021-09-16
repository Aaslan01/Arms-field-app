import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';

class DataEntry extends StatelessWidget {
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
          iconTheme: IconThemeData(color: Colors.black, size: 50),
            backgroundColor: Colors.white,
            leading: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                child: InkWell(
                  child: textWidget(
                      label: "Reset",
                      fontF: 'Basic',
                      colour: Color(0xff0962ff),
                      wei: FontWeight.bold,
                      size: 18),
                  onTap: () {},
                ),
              ),
            ),
            title: Center(
              child: textWidget(
                label: "Add Property",
                colour: Colors.black,
                wei: FontWeight.bold,
                size: 17,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  }),
            ],
          ),
          body: DataEnterBody(),
        );
  }
}




class DataEnterBody extends StatefulWidget {
  const DataEnterBody({Key? key}) : super(key: key);

  @override
  _DataEnterBodyState createState() => _DataEnterBodyState();
}

class _DataEnterBodyState extends State<DataEnterBody> {
  Color saleCardColor = activeCardColor;
  Color saleTextColor = activeTextColor;
  Color rentCardColor = inActiveCardColor;
  Color rentTextColor = inActiveTextColor;
  IconData icon = Icons.add;
  String label = 'Add a custom title';

  void title(String label1) {
    print(label1[0]);
    if (label1[0] == 'A') {
      icon = Icons.remove;
      label = "Use graana generated title";
    } else if (label1[0] == 'U') {
      icon = Icons.add;
      label = 'Add a custom title';
    }
    print(label1[0]);
  }

  void updateColor(int val) {
    if (val == 1) {
      saleCardColor = activeCardColor;
      saleTextColor = activeTextColor;
      rentCardColor = inActiveCardColor;
      rentTextColor = inActiveTextColor;
    } else if (val == 2) {
      saleCardColor = inActiveCardColor;
      saleTextColor = inActiveTextColor;
      rentCardColor = activeCardColor;
      rentTextColor = activeTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: gestureButton(
                        cardColor: saleCardColor,
                        rediusL: 10,
                        label: 'Sale',
                        textColor: saleTextColor,
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
                      child: gestureButton(
                        cardColor: rentCardColor,
                        rediusR: 10,
                        label: 'Rent',
                        textColor: rentTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Property Info',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Basic'),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                width: double.infinity,
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      title(label);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.black,
                        size: 30,
                      ),
                      textWidget(
                        label: label,
                        colour: Colors.black,
                        fontF: 'Basic',
                        wei: FontWeight.bold,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DataEntryTextWidget(
                inputHint: 'Enter Custom Title',
                hintColor: Colors.black54,
              ),
              SizedBox(
                height: 20,
              ),

              DataEntryTextWidget(
                inputHint: 'Price in PKR',
                hintColor: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}







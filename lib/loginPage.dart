import 'package:flutter/material.dart';
import 'forgetPassword.dart';
import 'dataEntery.dart';
import 'Widgets.dart';
import 'method.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              padding: const EdgeInsets.fromLTRB(60,0,0,0),
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
          ),
          body: LoginPageBody()
    );
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(

      body:  isLoading ? Center(
        child: Container(
          height: size.height/20,
          width: size.width/20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Container(
                  height: size.height/3,
                  child: Image.asset('images/homepic.jpeg')
              ),
              Container(
                  child: Column(

                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      //SimpleInputP(inputHint: 'User Name'),
                      field('User name', Icons.email,_email),
                      SizedBox(
                        height: 10,
                      ),
                      field('Password', Icons.lock,_password),
                      SizedBox(
                        height: 10,
                      ),
                     customButton(size),
                      // enterButton(
                      //   label: 'Email',
                      //   callFunction: (){
                      //     if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                      //
                      //       login(_email.text, _password.text).then((user){
                      //         if(user != null){
                      //           print('Login Sucessfull');
                      //
                      //           Navigator.push(context, MaterialPageRoute(builder: (_)=>DataEntry()));
                      //         }else{
                      //           print(
                      //               'Login Failed'
                      //           );
                      //
                      //         }
                      //       });
                      //
                      //     }
                      //     else{
                      //       print(
                      //           'Please fill form correctly'
                      //       );
                      //     }
                      //   },
                      // ),
                      Container(
                        padding: EdgeInsets.zero,
                        child: FlatButton(
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          textColor: Colors.grey.shade600,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (content)=> forgetPassword()));
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    )
    );
  }
  Widget field(String hintText, IconData icon, TextEditingController cont){
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextFormField(
            controller: cont,
            obscureText: hintText=='Password'? true: false,
            //controller: cont,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff0962ff),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon),
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
    );
  }

  Widget customButton(Size size)
  {

    return GestureDetector(
      onTap: (){
        if(_email.text.isNotEmpty && _password.text.isNotEmpty){
          setState(() {
            isLoading=true;
          });

          login(_email.text, _password.text).then((user){
            if(user != null){
              print('Login Sucessfull');
              Navigator.push(context, MaterialPageRoute(builder: (_)=>DataEntry()));
              setState(() {
                isLoading=false;
              });
            }else{
              print(
                  'Login Failed'
              );
              setState(() {
                isLoading=false;
              });
            }
          });

        }
        else{
          print(
              'Please fill form correctly'
          );
          setState(() {
            isLoading= false;
          });
        }

      },
      child: Container(
        height: 50,
        width: size.width/1.13,
        decoration: BoxDecoration(
            color: Colors.blue
        ),
        alignment: Alignment.center,
        child: Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}


// class LoginPageBody extends StatelessWidget {
//   const LoginPageBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     var scrWidth = MediaQuery.of(context).size.width;
//     var scrheight = MediaQuery.of(context).size.height;
//     return SafeArea(child: SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Flexible(
//               flex: 1,
//               child: FittedBox(child: Image.asset('images/homepic.jpeg'))
//           ),
//           Flexible(
//               flex: 2,
//               child: Column(
//
//                 children: [
//                   SizedBox(
//                     height: 5,
//                   ),
//                   //SimpleInputP(inputHint: 'User Name'),
//                   field('User name', Icons.email),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   PasswordBox(inputHint: 'Password'),
//                   enterButton(
//                     label: 'EMAIL',
//                     callFnction: DataEntry(),
//                   ),
//                   Container(
//                     padding: EdgeInsets.zero,
//                     child: FlatButton(
//                       child: Text(
//                         'Forget Password?',
//                         style: TextStyle(fontSize: 17.0),
//                       ),
//                       textColor: Colors.grey.shade600,
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (content)=> forgetPassword()));
//                       },
//                     ),
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     )
//     );
//   }



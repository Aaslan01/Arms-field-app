import 'package:firebase_auth/firebase_auth.dart';

Future<User?> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    if (user != null) {
      print('Account login  Successfully');
      return user;
    } else {
      print('Account Login failed');
      return user;
    }
  }
  catch(e){
    print(e);
    return null;
  }
}
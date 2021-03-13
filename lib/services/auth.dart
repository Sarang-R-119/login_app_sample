import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // private member
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anon
  Future signInAnon() async {
    try{
      // Get user creds
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign in email & pass

  // register in email & pass

  // sign out
}
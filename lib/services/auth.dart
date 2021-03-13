import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // private member
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  // returns users on authentication changes
  Stream<User> get user {
    return _auth.authStateChanges();
  }

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
  Future signInWithEmailAndPass(email, password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register in email & pass
  Future signUpWithEmailAndPass(email, password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
}
}
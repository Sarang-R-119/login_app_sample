import 'package:flutter/material.dart';
import 'package:login_app_sample/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Sign in to Thrive Cloud Cafe'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null)
              print('error in signing in');
            else {
              print('signed in');
              print(result.uid);
            }
          }
        ),
      )
    );
  }
}

//await and state

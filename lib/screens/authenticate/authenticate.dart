// sign in or sign up widget

import 'package:flutter/material.dart';
import 'package:login_app_sample/screens/authenticate/signIn.dart';
import 'package:login_app_sample/screens/authenticate/signUp.dart';
import 'package:login_app_sample/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn)
      return SignIn(toggleView: toggleView);
    else
      return SignUp(toggleView: toggleView);
  }
}

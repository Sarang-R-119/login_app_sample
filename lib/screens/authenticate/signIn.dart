import 'package:flutter/material.dart';
import 'package:login_app_sample/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String emailId = '';
  String pwd = '';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Sign in to Thrive Cloud Cafe'),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  // widget here is the class SignIn
                  widget.toggleView();
                },
                style: TextButton.styleFrom(primary: Colors.black),
                icon: Icon(Icons.person),
                label: Text("Sign up")
            )
          ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState(() => emailId = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => pwd = val);
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                  onPressed: () async{
                    dynamic result = await _auth.signInWithEmailAndPass(emailId, pwd);
                  },
                  child: Text(
                      'sign in',
                  style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        )
      )
    );
  }
}

//await and state

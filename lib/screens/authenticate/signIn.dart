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
  String error = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Firebase Auth Demo'),
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val) {
                  setState(() => emailId = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter a password 6 + characters long': null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => pwd = val);
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPass(emailId, pwd);
                      if(result == null)
                        setState(() => error = 'Email/Password is incorrect!');
                    }
                  },
                  child: Text(
                      'Sign In',
                  style: TextStyle(color: Colors.white),)
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        )
      )
    );
  }
}

//await and state

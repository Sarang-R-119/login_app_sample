import 'package:flutter/material.dart';
import 'package:login_app_sample/services/auth.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
          title: Text('Sign up to Thrive Cloud Cafe'),
            actions: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    // widget here is the class SignUp
                    widget.toggleView();
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  icon: Icon(Icons.person),
                  label: Text("Sign in")
              )
            ]
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey, // for validation, keep track of the form's state
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
                        // valid form
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.signUpWithEmailAndPass(
                              emailId, pwd);
                          if (result == null)
                            setState(() => error = 'Please provide a valid email!');
                        }
                      },
                      child: Text(
                        'Sign Up',
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

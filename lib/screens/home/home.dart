import 'package:flutter/material.dart';
import 'package:login_app_sample/services/auth.dart';

class Home extends StatelessWidget {

  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green[500],
        elevation: 0.0,
        // expects a widget list, to the right
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              style: TextButton.styleFrom(primary: Colors.black),
              icon: Icon(Icons.person),
              label: Text("Log out")
          )
        ]
        ),

    );
  }
}

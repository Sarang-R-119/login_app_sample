import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app_sample/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
//    print(user.uid);

    if(user == null)
      return Authenticate();
    else
      return Home();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app_sample/screens/authenticate/authenticate.dart';
import 'package:login_app_sample/screens/home/home.dart';
import 'package:login_app_sample/screens/wrapper.dart';
import 'package:login_app_sample/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of 'build':

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //  The method is asynchronous and returns a Future, so you need to ensure it
  //  has completed before displaying your main application. The examples below show
  //  how this can be achieved with a FutureBuilder or a StatefulWidget:
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot){
        //check for errors
        if(snapshot.hasError){
          return Text('An error has occurred.');
        }
        // once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User>.value(
            // Specifies the stream being listened to
            // accessing the user stream
            // wrapping the material app, all the descendants receive the stream
            value: AuthService().user,
            child: MaterialApp(
              title: 'Firebase Auth Demo',
              home: Wrapper(),
            ),
          );

        }

        return Text('Loading', textDirection: TextDirection.ltr);
      }
    );
  }
}

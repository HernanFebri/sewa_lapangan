import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen.dart';
import 'package:flutter_application_1/screens/loginorregisterscreen.dart';
// import 'package:flutter_application_1/screens/loginscreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged
          if (snapshot.hasData) {
            return HomeScreen();
          }

          //user is not logged
          else {
            return LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}

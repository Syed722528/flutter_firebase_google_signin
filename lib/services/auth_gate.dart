import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_google_signin/services/login_or_signup.dart';

import '../pages/home_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.active){
        if (snapshot.hasData) {
          return HomePage();
        }
        else{
          return LoginOrRegister();
        }
      }else{
        return const Center(child: CircularProgressIndicator(),);
      }
    }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_firebase_google_signin/services/firebase_auth.dart';
import 'package:flutter_firebase_google_signin/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CustomButton(
              onTap: () {
                AuthService.logOut();
              },
              text: 'Log out'),
        ),
      ),
    );
  }
}

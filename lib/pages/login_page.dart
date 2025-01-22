import 'package:flutter/material.dart';
import 'package:flutter_firebase_google_signin/utils/validators.dart';
import 'package:flutter_firebase_google_signin/widgets/custom_button.dart';
import 'package:flutter_firebase_google_signin/widgets/custom_input_field.dart';

import '../models/user_model.dart';
import '../services/firebase_auth.dart';
import '../utils/show_alert.dart';
import '../widgets/custom_button_withicon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  bool rememberMe = false; // For Checkbox

  void signIn() async {
    try {
      UserModel user = await _authService.signInUserWithEmail(
          _email.text.trim(), _password.text.trim());
      print('User log in Successfull ${user.uid}');
    } catch (e) {
      print('Error logging in user: $e');
      ShowAlert.showAlertDialog(
          context: context, title: 'Error ocuured', message: '${e}');
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // To make sure screen is adjusted.
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      'Log in to continue',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 131, 130, 130)),
                    ),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email'),
                        CustomInputField(
                          controller: _email,
                          icon: Icons.mail,
                          isPassword: false,
                          validator: Validators.validateEmail,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Password'),
                            CustomInputField(
                              controller: _password,
                              isPassword: true,
                              validator: Validators.validatePassword,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Checkbox(
                                  value: rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  }),
                              Text('Remeber me')
                            ]),
                            GestureDetector(
                                onTap: () {}, child: Text('Forgot Password')),
                          ],
                        ),
                      ],
                    ),
                    CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          signIn();
                        }
                      },
                      text: 'Sign in',
                    ),
                    CustomButtonWithicon(
                      onTap: () {},
                      text: 'Sign in with Google',
                      iconSource: 'assets/google_logo.png',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/registerPage');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

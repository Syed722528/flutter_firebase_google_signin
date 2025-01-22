import 'package:flutter/material.dart';
import 'package:flutter_firebase_google_signin/models/user_model.dart';
import 'package:flutter_firebase_google_signin/services/firebase_auth.dart';
import 'package:flutter_firebase_google_signin/utils/show_alert.dart';
import 'package:flutter_firebase_google_signin/utils/validators.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_button_withicon.dart';
import '../widgets/custom_input_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void signUp() async {
    try {
      UserModel user = await _authService.createUserwithEmail(
          _email.text.trim(), _password.text.trim());
      print('User registered Successfully ${user.uid}');
      if (!mounted) return;
      ShowAlert.showAlertDialog(
          context: context,
          title: 'Account created',
          message: 'You can log in now');
    } catch (e) {
      print('Error registering user: $e');
      if (!mounted) return;
      ShowAlert.showAlertDialog(
          context: context, title: 'Error ocuured', message: '$e');
    }
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
                      "Let's create an Account for you",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Text(
                      'Please enter your details',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 131, 130, 130)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text('Password'),
                        CustomInputField(
                          controller: _password,
                          validator: Validators.validatePassword,
                          isPassword: true,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text('Confirm Password'),
                        CustomInputField(
                          controller: _confirmPassword,
                          isPassword: true,
                          validator: Validators.validatePassword,
                        ),
                      ],
                    ),
                    CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (_confirmPassword.text.trim() ==
                              _password.text.trim()) {
                            signUp();
                          } else {
                            ShowAlert.showAlertDialog(
                                context: context,
                                title: 'An error occurred',
                                message: "Password's don't match");
                          }
                        }
                      },
                      text: 'Create Account',
                    ),
                    CustomButtonWithicon(
                      onTap: () {
                        try {
                          _authService.signInWithGoogle();
                        } catch (e) {
                          ShowAlert.showAlertDialog(
                              context: context,
                              title: 'Error ocuured',
                              message: '$e');
                        }
                      },
                      text: 'Continue with Google',
                      iconSource: 'assets/google_logo.png',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Aleardy have an account? "),
                        GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Log in',
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

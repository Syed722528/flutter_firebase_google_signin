import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_button_withicon.dart';
import '../widgets/custom_input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
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
              child: Column(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's create an Account for you",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Text(
                    'Please enter your details',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 131, 130, 130)),
                  ),
                  Text('Email'),
                  CustomInputField(
                    controller: _email,
                    icon: Icons.mail,
                    isPassword: false,
                  ),
                  Text('Password'),
                  CustomInputField(
                    controller: _password,
                    icon: Icons.visibility,
                    isPassword: true,
                  ),
                  Text('Confirm Password'),
                  CustomInputField(
                    controller: _confirmPassword,
                    icon: Icons.visibility,
                    isPassword: true,
                  ),
                  CustomButton(
                    onTap: () {},
                    text: 'Create Account',
                  ),
                  CustomButtonWithicon(
                    onTap: () {},
                    text: 'Continue with Google',
                    iconSource:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Aleardy have an account? "),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Sign in',
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
    );
  }
}

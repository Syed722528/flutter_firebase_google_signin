import 'package:flutter/material.dart';
import 'package:flutter_firebase_google_signin/widgets/custom_button.dart';
import 'package:flutter_firebase_google_signin/widgets/custom_input_field.dart';

import '../widgets/custom_button_withicon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    'Welcome back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Text(
                    'Please enter your details',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 131, 130, 130)),
                  ),
                  CustomInputField(
                    icon: Icons.mail,
                    isPassword: false,
                  ),
                  CustomInputField(
                    icon: Icons.visibility,
                    isPassword: true,
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
                      GestureDetector(onTap: (){},child: Text('Forgot Password')),
                    ],
                  ),
                  CustomButton(
                    onTap: () {},
                    text: 'Sign in',
                  ),
                  CustomButtonWithicon(
                    onTap: () {},
                    text: 'Sign in with Google',
                    iconSource:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                          onTap: () {},
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
    );
  }
}

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final bool isPassword;

  const CustomInputField(
      {super.key, required this.icon, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}

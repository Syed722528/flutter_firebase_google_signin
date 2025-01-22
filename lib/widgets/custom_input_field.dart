import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  IconData? icon = Icons.visibility;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomInputField(
      {super.key,
      this.icon,
      required this.isPassword,
      required this.controller,
      this.validator});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? showPassword : false,
      validator: widget.validator,
      decoration: InputDecoration(
          prefixIcon: widget.isPassword
              ? IconButton(
                  onPressed: togglePassword,
                  icon: showPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off))
              : Icon(widget.icon),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}

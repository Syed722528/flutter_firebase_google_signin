import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(color: Colors.deepPurple[400]),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: 17),
        ),
      ),
    );
  }
}

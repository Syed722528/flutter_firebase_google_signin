import 'package:flutter/material.dart';

class CustomButtonWithicon extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String iconSource;
  const CustomButtonWithicon({super.key,required this.onTap, required this.text,required this.iconSource});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(iconSource)  ,
                fit: BoxFit.contain),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

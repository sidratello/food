import 'package:flutter/material.dart';


class CustomSignUpText extends StatelessWidget {
  final String message; // Dynamic text parameter
final Color color;
final FontWeight? f;

  // Constructor to accept the message
  const CustomSignUpText({Key? key, required this.message, required this.color, this.f}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: color,
fontWeight: f,

      ),
    );
  }
}
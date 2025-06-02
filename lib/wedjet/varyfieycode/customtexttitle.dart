import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String message;
  final Color color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final bool center;


  const CustomTitle({
    Key? key,
    required this.message,
    required this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign = TextAlign.center,
    this.center = true,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      message,
   
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );

    return center ? Center(child: textWidget) : textWidget;
  }
}

import 'package:flutter/material.dart';

class CustomTextadress extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;


  const CustomTextadress({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
   required TextStyle style,
  
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
 //from left to right 
  
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
     
    
      ),
    );
  }
}

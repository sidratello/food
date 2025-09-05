import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed; //voidcallback function that didnt have parameter and return void 
  final String title; 
final Color color;
  const Button({
    super.key,
    required this.onPressed,
    this.title = "LOG IN",
     required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 130,
      child: 
      ElevatedButton(
        onPressed: onPressed,
             style: ElevatedButton.styleFrom(
          backgroundColor: color,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
              
            ),
        ),
        
        child: Text(title,
        style:TextStyle(color:Colors.white),)
        
        
      ),


    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed; // دالة عند الضغط على الزر
  final String title; // نص الزر
final Color color;
  const Button({
    super.key,
    required this.onPressed,
    this.title = "LOG IN", required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
             style: ElevatedButton.styleFrom(
          backgroundColor: color,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // 👈 Circular shape
            ),
           // تحديد لون الزر
        ),
        
        child: Text(title,style:TextStyle(color:Colors.white),)
        
        
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor; 
  final TextEditingController? controller;
    final String? Function(String?)? validator;
  // final TextInputType? keyboardType;

final Icon icon;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    required this.hintTextColor,
       this.validator,
    //  this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      // keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0), // إضافة مسافة حول الأيقونة
          child: icon,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.cyan,
            width: 2.0, // عرض الإطار
          ),
        ),
        
        hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
             enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // 👈 Circular border
       
      ),
      ),
    );
  }
}